package ZipTie::Adapters::ThreeCom::Switch3300::AutoLogin;

use strict;
use ZipTie::CLIProtocol;
use ZipTie::Response;

use ZipTie::Logger;

# Get the instance of the ZipTie::Logger module
my $LOGGER = ZipTie::Logger::get_logger();

sub execute
{
	# login to a device via the CLI (SSH or Telnet)
	my $cli_protocol = shift;
	my $connection_path = shift;
	
	# Pull off the ZipTie::Credentials instance from the ZipTie::ConnectionPath object
	my $credentials = $connection_path->get_credentials();

	# Store all the information needed to connect to the device
	my $ip_address = $connection_path->get_ip_address();
	my $port      = $cli_protocol->get_port();
	my $username  = $credentials->{username};
	my $password  = $credentials->{password};

	my $protocolName = $cli_protocol->get_protocol_name();
	$LOGGER->debug("Protocol in use: $protocolName");

	# Attempt to connect to the device
	$cli_protocol->connect( $ip_address, $port, $username, $password );    
	$LOGGER->debug("Verifying the initial connection ...");

	# If all goes well during the login process, the last method to be called will be "get_prompt"
	# and its return value will be returned all the way to here
	my $prompt_regex = _initial_connection( $cli_protocol, $credentials );

	# Print that the login process has been completed
	$LOGGER->debug("Login has successfully completed!\n");

	return $prompt_regex;
}

sub _initial_connection
{
	my $cli_protocol = shift;
	my $credentials = shift;
	
	# Specify the responses to check for
	my @responses = ();
	push(@responses, ZipTie::Response->new('^\s*$', \&_send_enter));
	push(@responses, ZipTie::Response->new('sername:|ogin:', \&_send_username));
	push(@responses, ZipTie::Response->new('[Pp]assword:', \&_send_password));
	push(@responses, ZipTie::Response->new('Select menu option', \&_get_prompt));
	
	my $response = $cli_protocol->wait_for_responses(\@responses);
	
	# Based on the response of the device, determine the next interaction that should be executed.
	if ($response)
	{
		my $next_interaction = $response->get_next_interaction();
		return &$next_interaction($cli_protocol, $credentials);
	}
	else
	{
		$LOGGER->fatal("Invalid response from device encountered!");
	}
}

sub _send_enter
{
	my $cli_protocol = shift;
	my $credentials = shift;
	
	$cli_protocol->send_as_bytes('0D');
	
	# Specify the responses to check for
	my @responses = ();
	push(@responses, ZipTie::Response->new('sername:|ogin:', \&_send_username));
	push(@responses, ZipTie::Response->new('[Pp]assword:', \&_send_password));
	push(@responses, ZipTie::Response->new('Select menu option', \&_get_prompt));
	
	my $response = $cli_protocol->wait_for_responses(\@responses);
	
	# Based on the response of the device, determine the next interaction that should be executed.
	if ($response)
	{
		my $next_interaction = $response->get_next_interaction();
		return &$next_interaction($cli_protocol, $credentials);
	}
	else
	{
		$LOGGER->fatal("Invalid response from device encountered!");
	}
}


sub _send_username
{
	my $cli_protocol = shift;
	my $credentials = shift;
	
	# Specify the responses to check for
	my @responses = ();
	push(@responses, ZipTie::Response->new('[Pp]assword:', \&_send_password));
	push(@responses, ZipTie::Response->new('[Ii]ncorrect', undef, $INVALID_CREDENTIALS));
	
	# Send username credential
	my $username = $credentials->{username};
	$LOGGER->debug("Sending username credential ...");
	$cli_protocol->send($username);
	my $response = $cli_protocol->wait_for_responses(\@responses);
	
	if ($response)
	{
		my $next_interaction = $response->get_next_interaction();
		return &$next_interaction($cli_protocol, $credentials);
	}
	else
	{
		$LOGGER->fatal("Invalid response from device encountered!");
	}
}

sub _send_password
{
	my $cli_protocol = shift;
	my $credentials = shift;
	
	# Specify the responses to check for
	my @responses = ();
	push(@responses, ZipTie::Response->new('[Ii]ncorrect|[Ii]nvalid', undef, $INVALID_CREDENTIALS));
	push(@responses, ZipTie::Response->new('Select menu option', \&_get_prompt));
	
	# Send username credential
	my $password = $credentials->{password};
	$LOGGER->debug("Sending password credential ...");
	$cli_protocol->send($password);
	my $response = $cli_protocol->wait_for_responses(\@responses);
	
	if ($response)
	{
		my $next_interaction = $response->get_next_interaction();
		return &$next_interaction($cli_protocol, $credentials);
	}
	else
	{
		$LOGGER->fatal("Invalid response from device encountered!");
	}
}

sub _get_prompt
{
	my $cli_protocol = shift;

	# Grab the last match that the CLIProtocol implementation captured
	my $last_match = $cli_protocol->last_match();
	$LOGGER->debug("---------------------------------------------------------");
	$LOGGER->debug("[LAST MATCH CAPTURED]");
	$LOGGER->debug($last_match);

	# Use a regular expression to strip the prompt from the match
	$last_match =~ /([^\s][^\r\n]*)$/;

	# Grab the extracted device prompt and clean it up for regular expression use
	my $device_prompt = $1;
	$device_prompt =~ s/^\s+//;
	$device_prompt =~ s/\s+$//;
	$device_prompt = quotemeta($device_prompt);

	# Construct the regular expression for the prompt so that it will only match the prompt that is displayed
	# as the very last thing.  This will get around the issue of a device possibly echoing back it's prompt when
	# a command is sent.
	my $device_prompt_regex = $device_prompt . "\\s*";
	
	$LOGGER->debug("---------------------------------------------------------");
	$LOGGER->debug("[REGULAR EXPRESSION TO MATCH DEVICE PROMPT]");
	$LOGGER->debug($device_prompt_regex);
	$LOGGER->debug("---------------------------------------------------------");
	
	return $device_prompt_regex;
}

1;
