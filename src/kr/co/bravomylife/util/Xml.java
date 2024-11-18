package kr.co.bravomylife.util;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Node;

/**
 * @version 1.0.0
 * @author cydgate4957@gmail.com
 * 
 * @since 2023-12-01
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
public class Xml {
	
	/**
	 * @param node [노드명]
	 * @return String
	 * @throws Exception [예외]
	 * 
	 * @since 2024-09-30
	 * <p>DESCRIPTION: 노드 값 얻기</p>
	 * <p>IMPORTANT: 파라미터는 데이터 타입과 형식을 만족하여야 한다.</p>
	 * <p>EXAMPLE:</p>
	 */
	public static String getNodeValue(Node node) throws Exception {

		if (node != null) {
			Node nodeCdata = node.getNextSibling();
			if ((nodeCdata != null) && (nodeCdata.getNodeType() == Node.CDATA_SECTION_NODE)) {
				return nodeCdata.getNodeValue();
			}
			else {
				// node.getTextContent().trim();
				return node.getNodeValue();
			}
		}
		return "";
	}
	
	/**
	 * @param filePath [경로 및 파일명]
	 * @return Document
	 * @throws Exception [예외]
	 * 
	 * @since 2024-09-30
	 * <p>DESCRIPTION: XML 파일 얻기</p>
	 * <p>IMPORTANT: 파라미터는 데이터 타입과 형식을 만족하여야 한다.</p>
	 * <p>EXAMPLE:</p>
	 */
	public static Document getXmlFromFile(String filePath) throws Exception {

		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
		DocumentBuilder builder = factory.newDocumentBuilder();

		filePath = Strings.replace(filePath, "\\", "/");

		int isWindows = filePath.indexOf(":");

		if (isWindows != -1) {
			filePath = "/" + filePath;
		}

		Document document = builder.parse(filePath);

		return document;
	}
}
