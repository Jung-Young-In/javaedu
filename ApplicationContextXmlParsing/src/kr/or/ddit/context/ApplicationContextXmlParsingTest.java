package kr.or.ddit.context;

import java.io.IOException;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

public class ApplicationContextXmlParsingTest {
	public static void main(String[] args) throws ParserConfigurationException, SAXException, IOException {
		
		DocumentBuilderFactory documentBuilderFactory = DocumentBuilderFactory.newInstance();
		
		DocumentBuilder documentBuilder = documentBuilderFactory.newDocumentBuilder();
		
		Document document = documentBuilder.parse("D:\\A_TeachingMaterial\\6.JspSpring\\workspace\\ApplicationContextXmlParsing\\src\\kr\\or\\ddit\\context\\application-context.xml");
		
		Element element = document.getDocumentElement();
		
		NodeList nodeList = element.getChildNodes();
		
		for (int i = 0; i < nodeList.getLength(); i++) {
			Node node = nodeList.item(i);
			
			if (node.getNodeType() == Node.ELEMENT_NODE) {
				Element element2 = (Element) node;
				
				String nodeName = element2.getNodeName();
				
				System.out.println("============================================");
				System.out.println("KEY : " + nodeName);
				
				if (nodeName.equals("bean")) {
					System.out.println("ID : " + element2.getAttribute("id"));
					System.out.println("VALUE : " + element2.getAttribute("class"));
					
					NodeList nodeList2 = element2.getChildNodes();
					
					for (int j = 0; j < nodeList2.getLength(); j++) {
						Node node2 = nodeList2.item(j);
						
						if (node2.getNodeType() == Node.ELEMENT_NODE) {
							Element element3 = (Element) node2;
							
							String nodeName2 = element3.getNodeName();
							
							System.out.println("CHILDNODENAME : " + nodeName2);
							System.out.println("NAME : " + element3.getAttribute("name"));
							System.out.println("REF-VALUE : " + element3.getAttribute("ref-value"));
						}
					}
				}
			}
		}
	}
}
