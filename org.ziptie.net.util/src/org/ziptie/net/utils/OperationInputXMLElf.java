package org.ziptie.net.utils;

import java.io.StringWriter;
import java.util.List;

import javax.xml.transform.Result;
import javax.xml.transform.Source;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.ziptie.common.XPathElf;
import org.ziptie.credentials.Credential;
import org.ziptie.credentials.CredentialSet;
import org.ziptie.protocols.Protocol;
import org.ziptie.protocols.ProtocolProperty;
import org.ziptie.protocols.ProtocolSet;

/**
 * The {@link OperationInputXMLElf} class provides a variety of helper methods to generate an XML document that
 * represents a valid input XML for an adapter operation.  This class should only be used when wanting to generate an
 * XML document to pass as an argument to an adapter operation when one can not be generated by using web-services, such
 * as SOAP.
 * 
 * @author Dylan White (dylamite@ziptie.org)
 */
@SuppressWarnings("nls")
public final class OperationInputXMLElf
{
    // Specifies the names of elements and attributes used for the connection information XML
    private static final String ROOT_ELEMENT = "operationInputXML";
    private static final String CONNECTION_PATH_ELEMENT = "connectionPath";
    private static final String PROTOCOLS_ELEMENT = "protocols";
    private static final String PROTOCOL_ELEMENT = "protocol";
    private static final String PROPERTIES_ELEMENT = "properties";
    private static final String PROPERTY_ELEMENT = "property";
    private static final String CREDENTIALS_ELEMENT = "credentials";
    private static final String CREDENTIAL_ELEMENT = "credential";
    private static final String FILE_SERVERS_ELEMENT = "fileServers";
    private static final String FILE_SERVER_ELEMENT = "fileServer";
    private static final String NAME_ATTRIBUTE = "name";
    private static final String VALUE_ATTRIBUTE = "value";
    private static final String HOST_ATTRIBUTE = "host";
    private static final String IP_ATTRIBUTE = "ip";
    private static final String PORT_ATTRIBUTE = "port";
    private static final String ROOT_DIR_ATTRIBUTE = "rootDir";
    private static final String VALIDATED_ON_DEVICE = "validatedOnDevice";
    private static final String PROTOCOL_ATTRIBUTE = PROTOCOL_ELEMENT;

    /**
     * Private constructor to hide and public/default constructor for the {@link OperationInputXMLElf} class.
     */
    private OperationInputXMLElf()
    {
        // Do nothing.
    }

    /**
     * Generates a DOM {@link Document} object that represents the connection path XML based on the specified host,
     * protocol set, credential set, and optional file server information.
     * 
     * @param host The host name or IP address of the device that the ZipTie adapter operation will be performed against.
     * @param configuredProtocols A {@link ProtocolSet} object representing all of the protocols that will be used to successfully
     * perform a ZipTie adapter operation.
     * @param credentials A {@link CredentialSet} object containing all of the credentials that will be needed to successfully
     * authenticate with the device to perform a ZipTie adapter operation.
     * @param fileServerInfoList A {@link List} containing all of {@link FileServerInfo} objects that define the external
     * file servers to use.
     * @param validatedProtocols if there are working protocols for this host, provide them here
     * 
     * @return A {@link Document} representing an operation input XML document that can be used by a ZipTie adapter operation to successfully
     * connect to a device and perform what it needs to.
     */
    public static Document generateXMLDoc(String host, ProtocolSet configuredProtocols, CredentialSet credentials, List<FileServerInfo> fileServerInfoList)
    {
        Document xmlDoc = XPathElf.newDocument();

        // Create our root element
        Element rootElem = xmlDoc.createElement(ROOT_ELEMENT);
        xmlDoc.appendChild(rootElem);

        // Create our "connectionPath" element and add it to our root element
        Element connectionPathElem = xmlDoc.createElement(CONNECTION_PATH_ELEMENT);
        rootElem.appendChild(connectionPathElem);

        // Add the host as an attribute to the connection element
        connectionPathElem.setAttribute(HOST_ATTRIBUTE, host);

        // Create a "protocols" element to house all the "protocol" sub elements and add it to our
        // "connectionPath" element
        Element protocolsElem = xmlDoc.createElement(PROTOCOLS_ELEMENT);
        connectionPathElem.appendChild(protocolsElem);

        // Add all of the protocols
        for (Protocol protocol : configuredProtocols.getProtocols())
        {
            // Create the current "protocol" element and add it to the "protocols" element
            Element currProtocolElem = xmlDoc.createElement(PROTOCOL_ELEMENT);
            protocolsElem.appendChild(currProtocolElem);

            currProtocolElem.setAttribute(VALIDATED_ON_DEVICE, Boolean.toString(protocol.isValidatedOnDevice()));

            // Add the protocol's name as an attribute
            currProtocolElem.setAttribute(NAME_ATTRIBUTE, protocol.getName());

            // Add the protocol's port as an attribute
            currProtocolElem.setAttribute(PORT_ATTRIBUTE, Integer.toString(protocol.getPort()));

            // Add all of the protocol properties if there are any
            Element propertiesElement = xmlDoc.createElement(PROPERTIES_ELEMENT);
            currProtocolElem.appendChild(propertiesElement);

            List<ProtocolProperty> properties = protocol.getProperties();
            for (ProtocolProperty protocolProp : properties)
            {
                // Create current "property" element
                Element currPropertyElem = xmlDoc.createElement(PROPERTY_ELEMENT);

                // Add the key-value pair as a "name" and "value" pair of attributes
                currPropertyElem.setAttribute(NAME_ATTRIBUTE, protocolProp.getKey());
                currPropertyElem.setAttribute(VALUE_ATTRIBUTE, protocolProp.getValue());

                // Add the current "property" element to the current "protocol" element
                propertiesElement.appendChild(currPropertyElem);
            }
        }

        // Create a "credentials" element to house all the "credential" sub elements and add it to our
        // "connectionPath" element
        Element credentialsElem = xmlDoc.createElement(CREDENTIALS_ELEMENT);
        connectionPathElem.appendChild(credentialsElem);

        for (Credential credential : credentials.getCredentials())
        {
            // Create the current "credential" element and add it to the "credentials" element
            Element credentialElem = xmlDoc.createElement(CREDENTIAL_ELEMENT);
            credentialsElem.appendChild(credentialElem);

            // Add the credential's name as an attribute
            credentialElem.setAttribute(NAME_ATTRIBUTE, credential.getName());

            // Add the credential's value as an attribute
            credentialElem.setAttribute(VALUE_ATTRIBUTE, credential.getValue());
        }

        // Create a "fileServers" element to house all the "fileServer" sub elements and add it to our
        // "connectionPath" element
        Element fileServersElem = xmlDoc.createElement(FILE_SERVERS_ELEMENT);
        connectionPathElem.appendChild(fileServersElem);

        if (fileServerInfoList != null)
        {
            for (FileServerInfo fileServerInfo : fileServerInfoList)
            {
                // Create a new "fileServer" element to encapsulate the file server data and add it
                // to the "fileServers" element
                Element fileServerElem = xmlDoc.createElement(FILE_SERVER_ELEMENT);
                fileServersElem.appendChild(fileServerElem);

                // Add the "protocol" attribute
                fileServerElem.setAttribute(PROTOCOL_ATTRIBUTE, fileServerInfo.getProtocolName());

                // Add the file server's IP address as a property
                fileServerElem.setAttribute(IP_ATTRIBUTE, fileServerInfo.getIp());

                // Add the file server's port as a property
                fileServerElem.setAttribute(PORT_ATTRIBUTE, Integer.toString(fileServerInfo.getPort()));

                // Add the file server's root/home directory as a property
                fileServerElem.setAttribute(ROOT_DIR_ATTRIBUTE, fileServerInfo.getRootDir());
            }
        }

        // Return XML DOM Document
        return xmlDoc;
    }

    /**
     * Returns true if the protocol is a member of the validatedProtocols
     * 
     * @param validatedProtocols the set to search in
     * @param protocol the protocol to search for
     * @return true if found
     */
    private static boolean protocolSetContains(ProtocolSet validatedProtocols, Protocol protocol)
    {
        for (Protocol left : validatedProtocols.getProtocols())
        {
            if (left.getName().equals(protocol.getName()))
            {
                return true;
            }
        }
        return false;
    }

    /**
     * @param host The host name or IP address of the device that the ZipTie adapter operation will be performed against.
     * @param enabledProtocols A {@link ProtocolSet} object representing all of the protocols that will be used to successfully
     * perform a ZipTie adapter operation.
     * @param credentials A {@link CredentialSet} object containing all of the credentials that will be needed to successfully
     * authenticate with the device to perform a ZipTie adapter operation.
     * @param fileServers A {@link List} containing all of {@link FileServerInfo} objects that define the external
     * file servers to use.
     * @return An string representing an operation input XML document that can be used by a ZipTie adapter operation to successfully
     * connect to a device and perform what it needs to.
     */
    public static String generateXMLString(String host, ProtocolSet enabledProtocols, CredentialSet credentials, List<FileServerInfo> fileServers)
    {
        Document xmlDoc = generateXMLDoc(host, enabledProtocols, credentials, fileServers);
        return docToXmlString(xmlDoc);
    }

    private static String docToXmlString(Document xmlDoc)
    {
        // Generate a string containing the XML that the DOM Document represents
        //
        // Create a new Source object from the DOM document that represents our connection information XML
        Source source = new DOMSource(xmlDoc);

        // Create a StringWriter object that can store the contents of the DOM as it is transformed
        StringWriter stringOutput = new StringWriter();

        // Create a Result object that specified the StringWriter as the destination for the contents of the DOM after it
        // has been transformed
        Result result = new StreamResult(stringOutput);

        // Transform the DOM document into a string by streaming it into the StringWriter
        try
        {
            TransformerFactory.newInstance().newTransformer().transform(source, result);
        }
        catch (Exception e)
        {
            throw new RuntimeException(e);
        }

        // Return the string contents that resulted from the successful transformation
        return stringOutput.toString();
    }

}
