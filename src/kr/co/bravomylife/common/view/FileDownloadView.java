package kr.co.bravomylife.common.view;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

/**
 * @version 1.0.0
 * @author cydgate4957@gmail.com
 * 
 * @since 2024-09-30
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
public class FileDownloadView extends AbstractView {
	
	/**
	 * @param map [Map]
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @throws Exception
	 * 
	 * @since 2024-09-30
	 * <p>DESCRIPTION: 해당 뷰 생성</p>
	 * <p>IMPORTANT: 파라미터는 데이터 타입 및 형식을 만족하여야 한다.</p>
	 * <p>EXAMPLE:</p>
	 */
	@Override
	protected void renderMergedOutputModel(Map<String, Object> map, HttpServletRequest request, HttpServletResponse response) throws Exception {
	
		super.setContentType("application/octet-stream");
		
		File file			= (File)map.get("file");
		String filename		= (String)map.get("filename");
		long filesize		= (Long)map.get("filesize");
		
		response.setContentType(getContentType());
		response.setContentLength((int)filesize);
		// 한글인 경우 글자가 깨지므로 깨지지 않도록 인코딩 설정
		filename = URLEncoder.encode(filename,"UTF-8");
		// 파일명에 공백이 있는 경우 +로 바뀌는 것 방지하기
		filename = filename.replaceAll("\\+","%20");
		// 변환된 파일명이 다운로드 창에 보이도록 설정
		response.setHeader("Content-Disposition","attachment;filename=" + filename);
		
		// 실제로 다운로드 하기(파일복사)
		// 클라이언트에 파일을 출력하기 위한 스트림
		OutputStream os		= response.getOutputStream();
		// 다운로드할 파일을 읽기위한 스트림
		FileInputStream fis	= new FileInputStream(file);
		// 파일 복사하기(클라이언트에 다운로드하기)
		FileCopyUtils.copy(fis,os);
		os.close();
		fis.close();
	}
}