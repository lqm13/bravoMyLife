package kr.co.bravomylife.util.property;

import java.io.FileInputStream;
import java.util.Properties;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * @version 1.0.0
 * @author cydgate4957@gmail.com
 * 
 * @since 2024-09-30
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
public class PropertyLoader {
	
	/** Logger */
	private static Logger logger					= LoggerFactory.getLogger(PropertyLoader.class);
	/** Property Loader */
	private static PropertyLoader propertyLoader	= null;
	/** Properties */
	private Properties properties					= null;
	
	/**
	 * @since 2024-09-30
	 * <p>DESCRIPTION: 생성자(Constructor)</p>
	 * <p>IMPORTANT: 파라미터는 데이터 타입 및 형식을 만족하여야 한다.</p>
	 * <p>EXAMPLE:</p>
	 */
	private PropertyLoader() {
		this.properties = new Properties();
	}
	
	/**
	 * @return synchronized
	 * 
	 * @since 2024-09-30
	 * <p>DESCRIPTION: 인스턴스 얻기(Get instance)</p>
	 * <p>IMPORTANT: 파라미터는 데이터 타입 및 형식을 만족하여야 한다.</p>
	 * <p>EXAMPLE:</p>
	 */
	public static synchronized PropertyLoader getInstance() {
		if (propertyLoader == null)
			propertyLoader = new PropertyLoader();
		return propertyLoader;
	}
	
	/**
	 * @param file [파일]
	 * @throws Exception [예외]
	 * 
	 * @since 2024-09-30
	 * <p>DESCRIPTION: 속성 지정(Set properties)</p>
	 * <p>IMPORTANT: 파라미터는 데이터 타입 및 형식을 만족하여야 한다.</p>
	 * <p>EXAMPLE:</p>
	 */
	public void setProperties(String[] file) throws Exception {
		
		this.properties.clear();
		
		for (int count = 0; count < file.length; count++) {
			FileInputStream fileInputStream = null;
			try {
				fileInputStream = new FileInputStream(file[count]);
				properties.load(fileInputStream);
				fileInputStream.close();
				logger.info("[" + this.getClass().getName() + ".setProperties()] " + file[count] + "is loaded.");
				
			}
			catch (Exception e) {
				logger.error("[" + this.getClass().getName() + ".setProperties()] Can't load " + file[count] + ": " + e.getMessage(), e);
			}
			finally {
				if (fileInputStream != null) {
					fileInputStream.close();
				}
			}
		}
	}
	
	/**
	 * @return Properties
	 * 
	 * @since 2024-09-30
	 * <p>DESCRIPTION: 속성 얻기(Get Properties)</p>
	 * <p>IMPORTANT: 파라미터는 데이터 타입 및 형식을 만족하여야 한다.</p>
	 * <p>EXAMPLE:</p>
	 */
	protected Properties getProperties() {
		return this.properties;
	}
}
