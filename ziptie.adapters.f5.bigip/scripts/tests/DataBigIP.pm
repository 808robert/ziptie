package DataBigIP;

use strict;
use warnings;
use Exporter 'import';
our @EXPORT_OK = qw($responsesBigIP);

our $responsesBigIP = {};

$responsesBigIP->{license} = <<'END';
cat /config/bigip.license
#

Auth vers :                  5b

#

#

#       BIG-IP System License Key File

#       DO NOT EDIT THIS FILE!!

#

#       Install this file as "/config/bigip.license".

#

#       Contact information in file /CONTACTS

#

Usage :                      Production

#

#

#  Only the specific use referenced above is allowed. Any other uses are prohibited.

#

Vendor :                     F5 Networks, Inc.

#

#       Module List 

#

active module :              BIG-IP LTM (Local Traffic Manager)|WITJEMV-JRPGECF|Add SSL 100 TPS

optional module :            Add  Compression (X 1 MBPS)

optional module :            Add  SSL TPS (X 1 TPS)

optional module :            BGP Routing Module

optional module :            Client Authentication

optional module :            IPv6 Gateway Module

optional module :            OSPF Routing Module

optional module :            RamCache

optional module :            Rate Shaping

optional module :            RIP Routing Module

optional module :            Routing Modules Bundle

#

#       Accumulated Tokens for Module

#       Add SSL 100 TPS  perf_SSL_total_TPS 100  key WITJEMV-JRPGECF

#

perf_SSL_total_TPS :         100

#

#       Accumulated Tokens for Modules

#       Add SSL 100 TPS  perf_SSL_Mbps 2000  key WITJEMV-JRPGECF

#       BIG-IP LTM (Localperf_SSL_Mbps 2000  key WITJEMV-JRPGECF

#

perf_SSL_Mbps :              4000

#

#       License Tokens for Module BIG-IP LTM (Local Traffic Manager) key WITJEMV-JRPGECF

#

mod_ltm :                    enabled

#

#       License Tokens for Module BIG-IP LTM (Local Traffic Manager) key WITJEMV-JRPGECF

#

ltm_conn_limits :            enabled

ltm_conn_rebinding :         enabled

ltm_def_gw_pool :            enabled

ltm_gw_last_hop_pool :       enabled

ltm_ha_active_active :       enabled

ltm_ha_failover :            enabled

ltm_ha_pool_min_up :         enabled

ltm_ha_state_mirror :        enabled

ltm_ha_vlan_failsafe :       enabled

ltm_lb :                     enabled

ltm_lb_fastest :             enabled

ltm_lb_least_conn :          enabled

ltm_lb_observed :            enabled

ltm_lb_predictive :          enabled

ltm_lb_priority :            enabled

ltm_lb_ratio :               enabled

ltm_lb_rr :                  enabled

ltm_monitor_ftp :            enabled

ltm_monitor_gateway_icmp :   enabled

ltm_monitor_http :           enabled

ltm_monitor_https :          enabled

ltm_monitor_icmp :           enabled

ltm_monitor_reverse :        enabled

ltm_monitor_rule :           enabled

ltm_monitor_tcp :            enabled

ltm_monitor_tcp_echo :       enabled

ltm_monitor_transparent :    enabled

ltm_persist_simple :         enabled

ltm_persist_sticky :         enabled

ltm_pool :                   enabled

ltm_snat :                   enabled

ltm_transparent :            enabled

nw_port_mirror :             enabled

nw_stp :                     enabled

nw_vlan_groups :             enabled

#

#       License Tokens for Module BIG-IP LTM (Local Traffic Manager) key WITJEMV-JRPGECF

#

ltm_bandw_tos_qos :          enabled

ltm_conn_one_connect_pool :  enabled

ltm_isnat_rule :             enabled

ltm_lb_dynamic_ratio :       enabled

ltm_monitor_external :       enabled

ltm_monitor_imap :           enabled

ltm_monitor_ldap :           enabled

ltm_monitor_ldap_ssl :       enabled

ltm_monitor_mssql :          enabled

ltm_monitor_nntp :           enabled

ltm_monitor_oracle :         enabled

ltm_monitor_pop3 :           enabled

ltm_monitor_radius :         enabled

ltm_monitor_real :           enabled

ltm_monitor_scripted :       enabled

ltm_monitor_sip :            enabled

ltm_monitor_smtp :           enabled

ltm_monitor_snmp :           enabled

ltm_monitor_soap :           enabled

ltm_monitor_tcp_ho :         enabled

ltm_monitor_udp :            enabled

ltm_monitor_wap :            enabled

ltm_monitor_wmi :            enabled

ltm_persist_cookie :         enabled

ltm_persist_sip :            enabled

ltm_persist_ssl_id :         enabled

ltm_persist_universal :      enabled

ltm_persist_wts :            enabled

ltm_proxy_content :          enabled

ltm_proxy_header :           enabled

ltm_proxy_probe :            enabled

ltm_proxy_redirect :         enabled

ltm_rule_L4 :                enabled

ltm_rule_L7 :                enabled

perf_PVA_dram_limit :        enabled

perf_PVA_enable :            enabled

security_authz :             enabled

security_nw_pk_filter :      enabled

security_ssl :               enabled

#

#       Licensing Information 

#

Licensed date :              20051012

Service check date :         20051012

#

#       Platform Information 

#

Registration Key :           VANXC-MAGGB-FNPMR-KSJTD-QAGQZQN

Licensed version :           9.1.0

Platform ID :                C36

Appliance SN :               bip078818s

#

#       Outbound License Dossier Validation

#

Dossier :                    01a7cb914a52d12d0a492726ad62b8ccaa01a45567c9f822d4343293a89b3be68ac301231043e1e9842accc444899b436e9aa304c0bbc1f769d81cecaa63a21c3ec291e9043b824126c37cbcecbcf4c9117ecc058604623403ceaa133e60b250fcee8ee2e998043669f892c1279477c00981b0ea0c88d2048ef7506712a5975bad5e6f6b0f10744c08fd7249956d865514326de3e10869db4f0ae93f59a8d9f85b50eddcc11e83bc2c070da5939454ea796caf534c86e850637add12af7b88f7d6e081215332a85ad19a265586cd16fd567925053f17652f63e7eca000891f9520432aa2eb19faf2280c3a0dfacf8bddad0d51de6561b87fb57476cb1ecda78ca375bafb77866488fd046b6f4b3472d28c048e30f81ff8dab26b75deda58e9eaf094d103a1fb7fc3c62040bc2511f61c8632

#

#       Outbound License Authorization Signature

#

Authorization :              a07620011a574c5d997d93c62a1d4c16c32a3e139edb9d00573010f50ab50c5bd92eb6283f96590d8d671e95d9159cec69a3712f4073b8cc76a84ec9a716af5e541c17be70c0785cd820879a46c032a19183835ddecc7ac52830a05c9e87056ccc1c80fb59cab52860431c25b0c70c15e322349bc8ecdc3446b86db2e3f70efdedf251ffcc5551a6c289fa2bf50a634514ba821ad533df0ff8f66aecc431df27fb61da12b77fe31b2999ef0e62604bd69af9e2021a8f0ac6d124fa83c89f62f73117ba2b23b5c42ea43bdcd1e656aa1e0198c7974527abc1f336cd408a3f1947d8b03fd9c3f3c62d0d47df70ae1cd85215c916e8716a0e1e3185d75512a1977a

#

#-----------------------------------------

# Copyright 1996-2005, F5 Networks, Inc.

# All rights reserved. 

END

$responsesBigIP->{snmp} = <<'END';
cat /config/snmp/snmpd.conf
##########################################################################
#
# For how to modify this snmpd.conf, please see man page snmpd.conf
#

##########################################################################
# System contact information
#
sysservices    78

##########################################################################
# Set the agent running ports and as a master agent of agentx 
agentaddress udp6:161,tcp6:161
master agentx
agentxTimeout 60

##########################################################################
#  Configure Authentication and Traps
#
trapcommunity public
#trap2sink 127.0.0.1  public 162
#trapsess -v 2c -c public 127.0.0.1:162
authtrapenable 2
agenttrap enable
##########################################################################
# Check to see if certain processes are running on the agent machine
# Note:
#       The string length of a process name is limited to 16 characters 
#       in struct proc. So here we have to use the first 16 characters
#       of the long process name
#

proc    bigd       1 1
proc    bigdbd     1 1
proc    chmand     1 1
proc    httpd      1 1
proc    mcpd       1 1
proc    sod        1 1
proc    tmm        1 1

##########################################################################
# Check the  named disks mounted at PATH for available disk space
# Note:
#       It only checks partition in /etc/fstab.
#
disk / 2000
disk /var 10000

##########################################################################
# Check the load average of the machine 
load 5 5 5 

########################################################################## 
# Set Access Control
# View-Based Access Control Model (vacm)  RFC 2265
#

########################################################################## 
rouser testlab authpriv .1
rocommunity public default .1
rocommunity6 public default .1
rwcommunity testenv default .1
rocommunity testcomm1 default .1
rocommunity testing default .1
rocommunity demo 10.100.10.1 .1.2.4.5.
rocommunity public default .1
rocommunity public default .1
rocommunity public default .1
rocommunity public default .1
rocommunity pitest2 default .1
rocommunity krissy default .1
rocommunity reportTest default .1
rocommunity public123 default .1
rocommuntiy pitest1 default .1
rocommuntiy pitest1 default .1
rocommuntiy pitest1 default .1
rocommuntiy pitest1 default .1
rocommuntiy pitest1 default .1
rocommuntiy pitest1 default .1
rocommunity public123 default .1
rocommunity public default .1
rocommuntiy pitest1 default .1
rocommuntiy pitest1 default .1
rocommuntiy pitest1 default .1
rocommuntiy pitest1 default .1
rocommuntiy pitest1 default .1
rocommuntiy pitest1 default .1
rocommuntiy pitest1 default .1
rocommuntiy pitest1 default .1
rocommunity public23 default .1
rocommuntiy pitest1 default .1
rocommuntiy pitest1 default .1
rocommuntiy pitest1 default .1
rocommuntiy pitest1 default .1
rocommuntiy pitest1 default .1
rocommuntiy pitest1 default .1
rocommuntiy pitest1 default .1
rwcommunity6 pubic default .1
rocommunity public default .1
rouser testlab authpriv .1
rocommunity public default .1
rocommunity6 public default .1
rwcommunity testenv default .1
rocommunity testcomm1 default .1
rwcommunity whatthe 10.100.22.33 .1.3
trapsess -v 2c -c newtrapcommunity 10.10.1.32:161
trapsess -v 1 -c whatcommunity? 10.195.55.11:10161
rocommunity public default .1
syslocation Alterpoint
syscontact SailajaGandra
trapsess -v 2c -c public 10.10.1.94:161

END

$responsesBigIP->{ucsv} = <<'END';
cat /config/ucs_version
Product: BIG-IP
Version: 9.1.0
Build: 6.2
Edition: Final
Built: 050527115216
Date: Fri May 27 11:52:16 PDT 2005

END

$responsesBigIP->{users} = <<'END';
cat /etc/passwd
root:x:0:0:root:/root:/bin/bash
bin:x:1:1:bin:/bin:/sbin/nologin
daemon:x:2:2:daemon:/sbin:/sbin/nologin
adm:x:3:4:adm:/var/adm:/sbin/nologin
lp:x:4:7:lp:/var/spool/lpd:/sbin/nologin
sync:x:5:0:sync:/sbin:/bin/sync
shutdown:x:6:0:shutdown:/sbin:/sbin/shutdown
halt:x:7:0:halt:/sbin:/sbin/halt
mail:x:8:12:mail:/var/spool/mail:/sbin/nologin
news:x:9:13:news:/etc/news:
uucp:x:10:14:uucp:/var/spool/uucp:/sbin/nologin
operator:x:11:0:operator:/root:/sbin/nologin
games:x:12:100:games:/usr/games:/sbin/nologin
gopher:x:13:30:gopher:/var/gopher:/sbin/nologin
ftp:x:14:50:FTP User:/var/ftp:/sbin/nologin
nobody:x:99:99:Nobody:/:/sbin/nologin
admin:x:0:500:Admin User:/home/admin:/bin/bash
support:x:0:0:support:/root:/bin/bash
vcsa:x:69:69:virtual console memory owner:/dev:/sbin/nologin
rpm:x:37:37::/var/lib/rpm:/bin/bash
apache:x:48:48:Apache:/usr/local/www:/sbin/nologin
tomcat4:x:91:91:Tomcat4:/usr/local/tomcat4:/bin/bash
radvd:x:75:75:radvd user:/:/sbin/nologin
sshd:x:74:74::/var/empty/sshd:/bin/false
syscheck:x:500:10::/home/syscheck:/bin/bash
pcap:x:77:77::/var/arpwatch:/sbin/nologin
rpc:x:32:32:Portmapper RPC user:/:/sbin/nologin
postfix:x:89:89::/var/spool/postfix:/sbin/nologin
ntp:x:38:38::/etc/ntp:/sbin/nologin
named:x:25:25:Named:/var/named:/bin/false
testlab:x:0:500:testlab:/home/testlab:/bin/bash
rkruse:x:0:500:rkruse:/home/rkruse:/bin/bash
END

$responsesBigIP->{dmesg} = <<'END';
dmesg
Linux version 2.4.21-9.1.0.3.0smp (root@nemo.f5net.com) (gcc version 3.2.2 20030222 (Red Hat Linux 3.2.2-5)) #2 SMP Wed May 18 02:11:03 PDT 2005
BIOS-provided physical RAM map:
 BIOS-e820: 0000000000000000 - 0000000000098000 (usable)
 BIOS-e820: 0000000000098000 - 00000000000a0000 (reserved)
 BIOS-e820: 00000000000f0000 - 0000000000100000 (reserved)
 BIOS-e820: 0000000000100000 - 000000002fff0000 (usable)
 BIOS-e820: 000000002fff0000 - 000000002fff3000 (ACPI NVS)
 BIOS-e820: 000000002fff3000 - 0000000030000000 (ACPI data)
 BIOS-e820: 00000000fec00000 - 0000000100000000 (reserved)
user-defined physical RAM map:
 user: 0000000000000000 - 0000000000098000 (usable)
 user: 0000000000098000 - 00000000000a0000 (reserved)
 user: 00000000000f0000 - 0000000000100000 (reserved)
 user: 0000000000100000 - 000000000e000000 (usable)
0MB HIGHMEM available.
224MB LOWMEM available.
found SMP MP-table at 000f5700
hm, page 000f5000 reserved twice.
hm, page 000f6000 reserved twice.
hm, page 000f1000 reserved twice.
hm, page 000f2000 reserved twice.
NX protection not present; using segment protection
On node 0 totalpages: 57344
zone(0): 4096 pages.
zone(1): 53248 pages.
zone(2): 0 pages.
ACPI: Searched entire block, no RSDP was found.
ACPI: RSDP located at physical address 020f7190
RSD PTR  v0 [IntelR]
__va_range(0x2fff3000, 0x28): idx=33 mapped at fffdd000
ACPI table found: RSDT v1 [IntelR AWRDACPI 16944.11825]
__va_range(0x2fff3040, 0x24): idx=33 mapped at fffdd000
__va_range(0x2fff3040, 0x74): idx=33 mapped at fffdd000
ACPI table found: FACP v1 [IntelR AWRDACPI 16944.11825]
__va_range(0x2fff7240, 0x24): idx=33 mapped at fffdd000
__va_range(0x2fff7240, 0x74): idx=33 mapped at fffdd000
ACPI table found: APIC v1 [IntelR AWRDACPI 16944.11825]
__va_range(0x2fff7240, 0x74): idx=33 mapped at fffdd000
LAPIC (acpi_id[0x0000] id[0x0] enabled[1])
CPU 0 (0x0000) enabledProcessor #0 Pentium 4(tm) XEON(tm) APIC version 20

LAPIC (acpi_id[0x0001] id[0x1] enabled[0])
CPU 1 (0x0100) disabled
IOAPIC (id[0x2] address[0xfec00000] global_irq_base[0x0])
IOAPIC (id[0x3] address[0xfec10000] global_irq_base[0x18])
INT_SRC_OVR (bus[0] irq[0x0] global_irq[0x2] polarity[0x0] trigger[0x0])
INT_SRC_OVR (bus[0] irq[0x9] global_irq[0x9] polarity[0x1] trigger[0x3])
LAPIC_NMI (acpi_id[0x0000] polarity[0x1] trigger[0x1] lint[0x1])
LAPIC_NMI (acpi_id[0x0001] polarity[0x1] trigger[0x1] lint[0x1])
2 CPUs total
Local APIC address fee00000
Enabling the CPU's according to the ACPI table
Intel MultiProcessor Specification v1.4
    Virtual Wire compatibility mode.
OEM ID: OEM00000 Product ID: PROD00000000 APIC at: 0xFEE00000
I/O APIC #2 Version 17 at 0xFEC00000.
I/O APIC #3 Version 17 at 0xFEC10000.
Processors: 1
xAPIC support is present
Enabling APIC mode: Flat.	Using 2 I/O APICs
Kernel command line: ro root=/dev/hda5 console=ttyS0,9600 panic=1 mem=224M quiet
mapped 4G/4G trampoline to fffd7000.
Initializing CPU#0
Detected 2500.130 MHz processor.
Console: colour VGA+ 80x25
Calibrating delay loop... 4993.84 BogoMIPS
Page-cache hash table entries: 65536 (order: 6, 256 KB)
Page-pin hash table entries: 16384 (order: 4, 64 KB)
Dentry cache hash table entries: 32768 (order: 6, 256 KB)
Inode cache hash table entries: 16384 (order: 5, 128 KB)
Buffer cache hash table entries: 16384 (order: 4, 64 KB)
Memory: 218320k/229376k available (1967k kernel code, 8848k reserved, 1454k data, 216k init, 0k highmem)
Mount cache hash table entries: 512 (order: 0, 4096 bytes)
CPU: Trace cache: 12K uops, L1 D cache: 8K
CPU: L2 cache: 128K
CPU: Hyper-Threading is disabled
Intel machine check architecture supported.
Intel machine check reporting enabled on CPU#0.
CPU:     After generic, caps: bfebfbff 00000000 00000000 00000000
CPU:             Common caps: bfebfbff 00000000 00000000 00000000
Enabling fast FPU save and restore... done.
Enabling unmasked SIMD FPU exception support... done.
Checking 'hlt' instruction... OK.
POSIX conformance testing by UNIFIX
mtrr: v1.40 (20010327) Richard Gooch (rgooch@atnf.csiro.au)
mtrr: detected mtrr type: Intel
CPU: Trace cache: 12K uops, L1 D cache: 8K
CPU: L2 cache: 128K
CPU: Hyper-Threading is disabled
Intel machine check reporting enabled on CPU#0.
CPU:     After generic, caps: bfebfbff 00000000 00000000 00000000
CPU:             Common caps: bfebfbff 00000000 00000000 00000000
CPU0: Intel(R) Celeron(R) CPU 2.50GHz stepping 09
per-CPU timeslice cutoff: 365.65 usecs.
task migration cache decay timeout: 10 msecs.
enabled ExtINT on CPU#0
ESR value before enabling vector: 00000000
ESR value after enabling vector: 00000000
ENABLING IO-APIC IRQs
Setting 2 in the phys_id_present_map
...changing IO-APIC physical APIC ID to 2 ... ok.
Setting 3 in the phys_id_present_map
...changing IO-APIC physical APIC ID to 3 ... ok.
init IO_APIC IRQs
 IO-APIC (apicid-pin) 2-0, 2-5, 2-9, 2-12, 2-20, 2-22, 3-1, 3-2, 3-3, 3-4, 3-5, 3-6, 3-7, 3-8, 3-9, 3-10, 3-11, 3-12, 3-13, 3-14, 3-15, 3-16, 3-17, 3-18, 3-19, 3-20, 3-21, 3-22, 3-23 not connected.
..TIMER: vector=0x31 pin1=2 pin2=0
number of MP IRQ sources: 22.
number of IO-APIC #2 registers: 24.
number of IO-APIC #3 registers: 24.
testing the IO APIC.......................

IO APIC #2......
.... register #00: 02000000
.......    : physical APIC id: 02
.......    : Delivery Type: 0
.......    : LTS          : 0
.... register #01: 00178020
.......     : max redirection entries: 0017
.......     : PRQ implemented: 1
.......     : IO APIC version: 0020
.... register #03: 00000001
.......     : Boot DT    : 1
.... IRQ redirection table:
 NR Log Phy Mask Trig IRR Pol Stat Dest Deli Vect:   
 00 000 00  1    0    0   0   0    0    0    00
 01 001 01  0    0    0   0   0    1    1    39
 02 001 01  0    0    0   0   0    1    1    31
 03 001 01  0    0    0   0   0    1    1    41
 04 001 01  0    0    0   0   0    1    1    49
 05 000 00  1    0    0   0   0    0    0    00
 06 001 01  0    0    0   0   0    1    1    51
 07 001 01  0    0    0   0   0    1    1    59
 08 001 01  0    0    0   0   0    1    1    61
 09 000 00  1    0    0   0   0    0    0    00
 0a 001 01  0    0    0   0   0    1    1    69
 0b 001 01  0    0    0   0   0    1    1    71
 0c 000 00  1    0    0   0   0    0    0    00
 0d 001 01  0    0    0   0   0    1    1    79
 0e 001 01  0    0    0   0   0    1    1    81
 0f 001 01  0    0    0   0   0    1    1    89
 10 001 01  1    1    0   1   0    1    1    91
 11 001 01  1    1    0   1   0    1    1    99
 12 001 01  1    1    0   1   0    1    1    A1
 13 001 01  1    1    0   1   0    1    1    A9
 14 000 00  1    0    0   0   0    0    0    00
 15 001 01  1    1    0   1   0    1    1    B1
 16 000 00  1    0    0   0   0    0    0    00
 17 001 01  1    1    0   1   0    1    1    B9

IO APIC #3......
.... register #00: 03000000
.......    : physical APIC id: 03
.......    : Delivery Type: 0
.......    : LTS          : 0
.... register #01: 00178020
.......     : max redirection entries: 0017
.......     : PRQ implemented: 1
.......     : IO APIC version: 0020
.... register #03: 00000001
.......     : Boot DT    : 1
.... IRQ redirection table:
 NR Log Phy Mask Trig IRR Pol Stat Dest Deli Vect:   
 00 001 01  1    1    0   1   0    1    1    C1
 01 000 00  1    0    0   0   0    0    0    00
 02 000 00  1    0    0   0   0    0    0    00
 03 000 00  1    0    0   0   0    0    0    00
 04 000 00  1    0    0   0   0    0    0    00
 05 000 00  1    0    0   0   0    0    0    00
 06 000 00  1    0    0   0   0    0    0    00
 07 000 00  1    0    0   0   0    0    0    00
 08 000 00  1    0    0   0   0    0    0    00
 09 000 00  1    0    0   0   0    0    0    00
 0a 000 00  1    0    0   0   0    0    0    00
 0b 000 00  1    0    0   0   0    0    0    00
 0c 000 00  1    0    0   0   0    0    0    00
 0d 000 00  1    0    0   0   0    0    0    00
 0e 000 00  1    0    0   0   0    0    0    00
 0f 000 00  1    0    0   0   0    0    0    00
 10 000 00  1    0    0   0   0    0    0    00
 11 000 00  1    0    0   0   0    0    0    00
 12 000 00  1    0    0   0   0    0    0    00
 13 000 00  1    0    0   0   0    0    0    00
 14 000 00  1    0    0   0   0    0    0    00
 15 000 00  1    0    0   0   0    0    0    00
 16 000 00  1    0    0   0   0    0    0    00
 17 000 00  1    0    0   0   0    0    0    00
IRQ to pin mappings:
IRQ0 -> 0:2
IRQ1 -> 0:1
IRQ3 -> 0:3
IRQ4 -> 0:4
IRQ6 -> 0:6
IRQ7 -> 0:7
IRQ8 -> 0:8
IRQ10 -> 0:10
IRQ11 -> 0:11
IRQ13 -> 0:13
IRQ14 -> 0:14
IRQ15 -> 0:15
IRQ16 -> 0:16
IRQ17 -> 0:17
IRQ18 -> 0:18
IRQ19 -> 0:19
IRQ21 -> 0:21
IRQ23 -> 0:23
IRQ24 -> 1:0
.................................... done.
Using local APIC timer interrupts.
calibrating APIC timer ...
..... CPU clock speed is 2500.0604 MHz.
..... host bus clock speed is 100.0024 MHz.
cpu: 0, clocks: 1000024, slice: 500012
CPU0<T0:1000016,T1:500000,D:4,S:500012,C:1000024>
zapping low mappings.
Process timing init...done.
Starting migration thread for cpu 0
PCI: PCI BIOS revision 2.10 entry at 0xface0, last bus=3
PCI: Using configuration type 1
PCI: Probing PCI hardware
PCI: Ignoring BAR0-3 of IDE controller 00:1f.1
Transparent bridge - Intel Corp. 82801BA/CA/DB/EB PCI Bridge
PCI: Using IRQ router PIIX [8086/25a1] at 00:1f.0
PCI->APIC IRQ transform: (B0,I29,P0) -> 16
PCI->APIC IRQ transform: (B0,I29,P1) -> 19
PCI->APIC IRQ transform: (B0,I29,P3) -> 23
PCI->APIC IRQ transform: (B0,I31,P0) -> 16
PCI->APIC IRQ transform: (B0,I31,P1) -> 17
PCI->APIC IRQ transform: (B1,I1,P0) -> 18
PCI->APIC IRQ transform: (B2,I3,P0) -> 24
PCI->APIC IRQ transform: (B3,I1,P0) -> 21
PCI->APIC IRQ transform: (B3,I2,P0) -> 17
Linux NET4.0 for Linux 2.4
Based upon Swansea University Computer Society NET3.039
Initializing RT netlink socket
IA-32 Microcode Update Driver: v1.13 <tigran@veritas.com>
apm: BIOS version 1.2 Flags 0x07 (Driver version 1.16)
BIOS EDD facility v0.09 2003-Jan-22, 1 devices found
Total HugeTLB memory allocated, 0
Starting kswapd
VFS: Disk quotas vdquot_6.5.1
aio_setup: num_physpages = 14336
aio_setup: sizeof(struct page) = 56
Journalled Block Device driver loaded
Hugetlbfs mounted.
Detected PS/2 Mouse Port.
pty: 2048 Unix98 ptys configured
Serial driver version 5.05c (2001-07-08) with MANY_PORTS SHARE_IRQ SERIAL_PCI enabled
ttyS0 at 0x03f8 (irq = 4) is a 16550A
ttyS1 at 0x02f8 (irq = 3) is a 16550A
ttyS2 at 0x03e8 (irq = 0) is a 16550A
ttyS3 at 0x02e8 (irq = 3) is a 16550A
Real Time Clock Driver v1.10e
FDC 0 is a post-1991 82077
RAMDISK driver initialized: 256 RAM disks of 4096K size 1024 blocksize
loop: loaded (max 8 devices)
Intel(R) PRO/1000 Network Driver - version 5.2.52-k3
Copyright (c) 1999-2004 Intel Corporation.
e1000: eth0: e1000_probe: Intel(R) PRO/1000 Network Connection
pcnet32.c:v1.27a 10.02.2002 tsbogend@alpha.franken.de
Uniform Multi-Platform E-IDE driver Revision: 7.00beta4-2.4
ide: Assuming 33MHz system bus speed for PIO modes; override with idebus=xx
ICH5: IDE controller at PCI slot 00:1f.1
ICH5: chipset revision 2
ICH5: not 100% native mode: will probe irqs later
    ide0: BM-DMA at 0xf000-0xf007, BIOS settings: hda:DMA, hdb:pio
    ide1: BM-DMA at 0xf008-0xf00f, BIOS settings: hdc:pio, hdd:pio
hda: HDS728080PLAT20, ATA DISK drive
blk: queue 02587e00, I/O limit 4095Mb (mask 0xffffffff)
ide2: ports already in use, skipping probe
ide0 at 0x1f0-0x1f7,0x3f6 on irq 14
hda: attached ide-disk driver.
hda: host protected area => 1
hda: 160836480 sectors (82348 MB) w/1719KiB Cache, CHS=10011/255/63, UDMA(100)
Partition check:
 hda: hda1 hda2 hda3 < hda5 hda6 hda7 hda8 hda9 > hda4 < hda10 hda11 hda12 hda13 hda14 >
SCSI subsystem driver Revision: 1.00
libata version 1.02 loaded.
i2c-core.o: i2c core module version 2.8.4 (20040207)
Initializing Cryptographic API
NET4: Linux TCP/IP 1.0 for NET4.0
IP: routing cache hash table of 2048 buckets, 16Kbytes
TCP: Hash tables configured (established 16384 bind 16384)
Linux IP multicast router 0.06 plus PIM-SM
Initializing IPsec netlink socket
ip_tables: (C) 2000-2002 Netfilter core team
NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
EXT3-fs: INFO: recovery required on readonly filesystem.
EXT3-fs: write access will be enabled during recovery.
kjournald starting.  Commit interval 5 seconds
EXT3-fs: ide0(3,5): orphan cleanup on readonly fs
ext3_orphan_cleanup: deleting unreferenced inode 134744
ext3_orphan_cleanup: deleting unreferenced inode 134743
EXT3-fs: ide0(3,5): 2 orphan inodes deleted
EXT3-fs: recovery complete.
EXT3-fs: mounted filesystem with ordered data mode.
VFS: Mounted root (ext3 filesystem) readonly.
Freeing unused kernel memory: 216k freed
EXT3 FS 2.4-0.9.19, 19 August 2002 on ide0(3,5), internal journal
Adding Swap: 3176040k swap-space (priority -1)
kjournald starting.  Commit interval 5 seconds
EXT3 FS 2.4-0.9.19, 19 August 2002 on ide0(3,7), internal journal
EXT3-fs: mounted filesystem with ordered data mode.
kjournald starting.  Commit interval 5 seconds
EXT3 FS 2.4-0.9.19, 19 August 2002 on ide0(3,8), internal journal
EXT3-fs: mounted filesystem with ordered data mode.
kjournald starting.  Commit interval 5 seconds
EXT3 FS 2.4-0.9.19, 19 August 2002 on ide0(3,9), internal journal
EXT3-fs: mounted filesystem with ordered data mode.
kjournald starting.  Commit interval 5 seconds
EXT3 FS 2.4-0.9.19, 19 August 2002 on ide0(3,1), internal journal
EXT3-fs: mounted filesystem with ordered data mode.
i2c-i801 version 2.8.5 (20040305)
i2c-dev.o: i2c /dev entries driver module version 2.8.4 (20040207)
i2c-dev.o: Registered 'SMBus I801 adapter at 0500' as minor 0
Non-volatile memory driver v1.2
IPv6 v0.8 for NET4.0
IPv6 over IPv4 tunneling driver
Disabled Privacy Extensions on device 0241da20(lo)
e1000: eth0: e1000_watchdog: NIC Link is Up 100 Mbps Full Duplex
eth0: no IPv6 routers present
Universal VNIC device driver v1.0.  Max packets per poll: 4096.
tmm0: no IPv6 routers present
external: no IPv6 routers present
internal: no IPv6 routers present
vlanTest: no IPv6 routers present
END


$responsesBigIP->{global} = <<'END';
bigpipe global
GLOBAL STATISTICS --

Client side
    (cur, max, tot) = (0, 0, 0)
    (pkts, bits) in = (0, 0), out = (0, 0)
    PVA (cur, max, tot) = (0, 0, 0)
    PVA (pkts, bits) in = (0, 0), out = (0, 0)
Server side
    (cur, max, tot) = (0, 0, 0)
    (pkts, bits) in = (0, 0), out = (0, 0)
    PVA (cur, max, tot) = (0, 0, 0)
    PVA (pkts, bits) in = (0, 0), out = (0, 0)
PVA connections (curr, tot) = (0, 0)
TMM cycles (total, idle, sleep) = (29.58P, 15.27P, 14.30P)
Denials (maint, addr full, serv full) = (0, 0, 0)
        (no serv, no listen, no mem, no lic) = (0, 0, 0, 0)
CPU (total, active, multi-mode) = (1, 1, UP)
Memory (total, used) = (768.0M, 207.5M)
Packets (drop, err in, err out) = (0, 0, 0)
HTTP requests = 0

Authorization --
    results (yes, no, defer, err) = (0, 0, 0, 0)
    sessions (cur, max, tot) = (0, 0, 0)

OneConnect (curr, max, reuse, new) = (0, 0, 0, 0)
Stream replacements = 0
XML profile errors = 0

END

$responsesBigIP->{hostname} = <<'END';
gethostname()=`bigip9.inside.eclyptic.com'
Resolving `bigip9.inside.eclyptic.com' ...
Result: h_name=`localhost.localdomain'
Result: h_aliases=`localhost'
Result: h_aliases=`bigip9.inside.eclyptic.com'
Result: h_addr_list=`127.0.0.1'
127.0.0.1

END

$responsesBigIP->{dd} = <<'END';
dd bs=65k count=10 skip=15 </dev/mem|strings|grep R 
EV
odTYAN Tomcat I7210 S5112 12152004 OBJ-0084-00 REV. I
10+0 records in
10+0 records out

END

$responsesBigIP->{uptime} = <<'END';
uptime
 19:58:03  up 136 days, 23:27,  1 user,  load average: 1.00, 1.00, 1.00
 
END


$responsesBigIP->{interfaces} = <<'END';
bigpipe interface show all
INTERFACE mgmt  00:01:D7:36:83:09  ENABLED  UP  MTU 1500
|    media auto (100baseTX full)   Aggregation detached
|    flow control tx rx (none)
|    (pkts,bits,errs) in = (15.24M, 9.468G, 0), out = (10.09M, 17.17G, 0)
|    (drop,mcast) in = (225, 0), out = (0, 0)    coll = 0

INTERFACE 1.1  00:01:D7:36:83:02  ENABLED  DOWN  MTU 1500
|    media auto (none)   Aggregation detached
|    flow control tx rx (tx rx)
|    (pkts,bits,errs) in = (0, 0, 0), out = (0, 0, 0)
|    (drop,mcast) in = (0, 0), out = (0, 0)    coll = 0

INTERFACE 1.2  00:01:D7:36:83:03  ENABLED  DOWN  MTU 1500
|    media auto (none)   Aggregation detached
|    flow control tx rx (tx rx)
|    (pkts,bits,errs) in = (0, 0, 0), out = (0, 0, 0)
|    (drop,mcast) in = (0, 0), out = (0, 0)    coll = 0

INTERFACE 1.3  00:01:D7:36:83:04  ENABLED  DOWN  MTU 1500
|    media 10baseT full (10baseT full)   Trunk TrunkTestRyan   Aggregation detached
|    flow control tx rx (tx rx)
|    (pkts,bits,errs) in = (0, 0, 0), out = (0, 0, 0)
|    (drop,mcast) in = (0, 0), out = (0, 0)    coll = 0

INTERFACE 1.4  00:01:D7:36:83:05  ENABLED  DOWN  MTU 1500
|    media 100baseTX full (100baseTX full)   Trunk TrunkTestRyan   Aggregation detached
|    flow control tx rx (tx rx)
|    (pkts,bits,errs) in = (0, 0, 0), out = (0, 0, 0)
|    (drop,mcast) in = (0, 0), out = (0, 0)    coll = 0

INTERFACE 2.1  00:01:D7:36:83:06  ENABLED  UNPOPULATED  MTU 1500
|    media auto (1000baseFX full)   Aggregation detached
|    STP instance 0   block
|    flow control tx rx (tx rx)
|    (pkts,bits,errs) in = (0, 0, 0), out = (0, 0, 0)
|    (drop,mcast) in = (0, 0), out = (0, 0)    coll = 0

INTERFACE 2.2  00:01:D7:36:83:07  ENABLED  UNPOPULATED  MTU 1500
|    media auto (1000baseFX full)   Aggregation detached
|    STP instance 0   block
|    flow control tx rx (tx rx)
|    (pkts,bits,errs) in = (0, 0, 0), out = (0, 0, 0)
|    (drop,mcast) in = (0, 0), out = (0, 0)    coll = 0

END

$responsesBigIP->{mgmt} = <<'END';
bigpipe mgmt show all
MGMT IP 10.100.4.7 - netmask 255.255.255.0

END

$responsesBigIP->{static_routes} = <<'END';
route -n
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
127.1.1.0       0.0.0.0         255.255.255.248 U     0      0        0 tmm0
192.168.0.0     0.0.0.0         255.255.255.0   U     0      0        0 internal
127.2.0.0       0.0.0.0         255.255.255.0   U     0      0        0 eth0
10.100.4.0      0.0.0.0         255.255.255.0   U     0      0        0 eth0
10.100.100.0    0.0.0.0         255.255.255.0   U     0      0        0 external
127.0.0.0       -               255.0.0.0       !     0      -        0 -
0.0.0.0         10.100.4.1      0.0.0.0         UG    1      0        0 eth0

END

$responsesBigIP->{vlans} = <<'END';
bigpipe vlan show all
VLAN Vlans_r_us   tag 4091    MTU 577
+-> VLAN MEMBER  2.2   tagged
|   +-> INTERFACE 2.2  00:01:D7:36:83:07  ENABLED  UNPOPULATED  MTU 1500
|       |    media auto (1000baseFX full)   Aggregation detached
|       |    STP instance 0   block
|       |    flow control tx rx (tx rx)
|       |    (pkts,bits,errs) in = (0, 0, 0), out = (0, 0, 0)
|       |    (drop,mcast) in = (0, 0), out = (0, 0)    coll = 0
+-> VLAN MEMBER  TrunkTestRyan   tagged
    +-> TRUNK TrunkTestRyan   00:01:D7:36:83:0E   LACP DISABLED
        |    (pkts,bits,errs) in = (0, 0, 0), out = (0, 0, 0)
        |    (drop,mcast) in = (0, 0), out = (0, 0)    coll = 0
        +-> INTERFACE 1.3  00:01:D7:36:83:04  ENABLED  DOWN  MTU 1500
        |   |    media 10baseT full (10baseT full)   Trunk TrunkTestRyan   Aggregation detached
        |   |    flow control tx rx (tx rx)
        |   |    (pkts,bits,errs) in = (0, 0, 0), out = (0, 0, 0)
        |   |    (drop,mcast) in = (0, 0), out = (0, 0)    coll = 0
        +-> INTERFACE 1.4  00:01:D7:36:83:05  ENABLED  DOWN  MTU 1500
            |    media 100baseTX full (100baseTX full)   Trunk TrunkTestRyan   Aggregation detached
            |    flow control tx rx (tx rx)
            |    (pkts,bits,errs) in = (0, 0, 0), out = (0, 0, 0)
            |    (drop,mcast) in = (0, 0), out = (0, 0)    coll = 0

VLAN internal   tag 4094    MTU 1500

VLAN external   tag 4093    MTU 1500

VLAN vlanTest   tag 4092    MTU 1500
+-> VLAN MEMBER  2.1   tagged
|   +-> INTERFACE 2.1  00:01:D7:36:83:06  ENABLED  UNPOPULATED  MTU 1500
|       |    media auto (1000baseFX full)   Aggregation detached
|       |    STP instance 0   block
|       |    flow control tx rx (tx rx)
|       |    (pkts,bits,errs) in = (0, 0, 0), out = (0, 0, 0)
|       |    (drop,mcast) in = (0, 0), out = (0, 0)    coll = 0
+-> VLAN MEMBER  2.2   tagged
    +-> INTERFACE 2.2  00:01:D7:36:83:07  ENABLED  UNPOPULATED  MTU 1500
        |    media auto (1000baseFX full)   Aggregation detached
        |    STP instance 0   block
        |    flow control tx rx (tx rx)
        |    (pkts,bits,errs) in = (0, 0, 0), out = (0, 0, 0)
        |    (drop,mcast) in = (0, 0), out = (0, 0)    coll = 0

END

$responsesBigIP->{stp} = <<'END';
bigpipe stp show all
STP   MODE stp
|        Forward delay 15   Hello time 2   Max. age 20   Transmit hold 6
+-> STP INSTANCE 0     priority 61440   root bridge 00:01:D7:36:83:00
    +-> STP VLAN 0 Vlans_r_us
    |   +-> STP 0 2.2 INTERFACE
    |   |   |    path cost 200000   priority 128   role disable
    |   |   |    state block (block)   link auto   edge - auto
    |   +-> STP 0 TrunkTestRyan TRUNK
    |       |    path cost 20000   priority 128   role disable
    |       |    state block (block)
    +-> STP VLAN 0 vlanTest
        +-> STP 0 2.1 INTERFACE
        |   |    path cost 200000   priority 128   role disable
        |   |    state block (block)   link auto   edge - auto
        +-> STP 0 2.2 INTERFACE
            |    path cost 200000   priority 128   role disable
            |    state block (block)   link auto   edge - auto
            
END
