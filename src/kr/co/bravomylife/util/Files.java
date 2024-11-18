package kr.co.bravomylife.util;

import java.io.File;

import java.util.UUID;

/**
 * @version 1.0.0
 * @author cydgate4957@gmail.com
 * 
 * @since 2024-09-30
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
public class Files {
	
	/**
	 * @param pathBase [베이스 경로]
	 * @return String
	 * 
	 * @since 2024-09-30
	 * <p>DESCRIPTION: 폴더명(yyyyMMddHH 형태) 얻기</p>
	 * <p>IMPORTANT: 파라미터는 데이터 타입 및 형식을 만족하여야 한다.</p>
	 * <p>EXAMPLE:</p>
	 */
	public static String getFolderName(String pathBase) {
		
		String folderName	= Datetime.getNow("yyyyMMdd");
		String pathSave		= pathBase + File.separator + folderName;
		
		File dirExists 	= new File(pathSave);
		if(!dirExists.exists()) {
			dirExists.mkdirs();
		}
		
		return folderName;
	}
	
	/**
	 * @param fileSrcName [파일 원본명]
	 * @return String
	 * 
	 * @since 2024-09-30
	 * <p>DESCRIPTION: 파일명(원본 파일명 + yyyyMMddHHmmss 형태) 얻기</p>
	 * <p>IMPORTANT: 파라미터는 데이터 타입 및 형식을 만족하여야 한다.</p>
	 * <p>EXAMPLE:</p>
	 */
	public static String getFileSveName(String fileSrcName) {
		
		String fileSveName	= fileSrcName;
		String fileExt		= fileSveName.substring(fileSveName.lastIndexOf("."));
		// fileSveName		= Datetime.getNow("yyyyMMddHHmmss") + "_" + UUID.randomUUID() + fileExt.toLowerCase();
		fileSveName			= UUID.randomUUID() + fileExt.toLowerCase();
		
		return fileSveName;
	}
	
	/**
	 * @param fileName [파일명]
	 * @return String
	 * 
	 * @since 2024-09-30
	 * <p>DESCRIPTION:</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	public static String getFileExtention(String fileName) {
		return fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();
	}
}
