/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package xmldomparser;

import java.io.File;
import java.io.IOException;
import javax.swing.text.Document;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

/**
 *
 * @author admin
 */
public class XMLDOMParser {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws ParserConfigurationException, SAXException, IOException {
        // TODO code application logic here
        File xmlFile = new File("E:\\SEM-VII\\DC\\XMLDOMParser\\src\\xmldomparser\\company.xml");
    /* obtain an instance of a factory that can give instance of document builder
    */
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        DocumentBuilder dBuilder = factory.newDocumentBuilder();

        /*DocumentBuilder contains the API to obtain DOM Document instances
        from an XML document. The parse() method parses the XML file into a
        Document. */
        org.w3c.dom.Document doc =  dBuilder.parse(xmlFile);
        doc.getDocumentElement().normalize();

        // get the root element of the document
        System.out.println("Root element: " +
        doc.getDocumentElement().getNodeName());

        /* get a NodeList of user elements in the document
        with getElementsByTagName() */
        NodeList nList = doc.getElementsByTagName("employee");
        
        for (int i = 0; i < nList.getLength(); i++) {
            Node nNode = nList.item(i);
            System.out.println("\nCurrent Element: " + nNode.getNodeName());

                if (nNode.getNodeType() == Node.ELEMENT_NODE) {
                Element elem = (Element) nNode;
                // get the text content of the three subelements of the user element
                Node node1 = elem.getElementsByTagName("Name").item(0);
                String Name = node1.getTextContent();
                Node node2 = elem.getElementsByTagName("Mobile").item(0);
                String Mobile = node2.getTextContent();

                System.out.printf("Name: %s%n", Name);
                System.out.printf("Mobile: %s%n", Mobile);
            }
        }
    } 
}
