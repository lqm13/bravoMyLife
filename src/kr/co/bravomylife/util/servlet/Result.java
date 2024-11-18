package kr.co.bravomylife.util.servlet;

import java.io.IOException;
import java.io.Writer;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.bravomylife.util.Strings;

/**
 * @version 1.0.0
 * @author cydgate4957@gmail.com
 * 
 * @since 2024-09-30
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
public class Result extends HttpServlet {
	
	/** Serial version UID */
	private static final long serialVersionUID = 20150225000009L;
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @throws ServletException
	 * @throws IOException
	 * 
	 * @since 2024-09-30
	 * <p>DESCRIPTION: Get은 Post로 처리</p>
	 * <p>IMPORTANT: 파라미터는 데이터 타입 및 형식을 만족하여야 한다.</p>
	 * <p>EXAMPLE:</p>
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @throws ServletException
	 * @throws IOException
	 * 
	 * @since 2024-09-30
	 * <p>DESCRIPTION: Post 처리</p>
	 * <p>IMPORTANT: 파라미터는 데이터 타입 및 형식을 만족하여야 한다.</p>
	 * <p>EXAMPLE: charset, scriptSRC, message, script, target, redirect, back, close, post</p>
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String charset = Strings.getString(request.getAttribute("charset"));
		
		if (charset.length() > 0) {
			response.setContentType("text/html; charset=" + charset);
		}
		else {
			response.setContentType("text/html; charset=UTF-8");
			response.setCharacterEncoding("UTF-8");
		}
		
		Writer out = response.getWriter();
		
		//out.write("<!DOCTYPE html>\n");
		out.write("<html>\n");
		out.write("<head>\n");
		
		if (charset.length() > 0) {
			out.write("<meta http-equiv=\"content-type\" content=\"text/html; " + charset + "\" />\n");
		}
		else {
			//out.write("<meta charset=\"UTF-8\">\n");
			out.write("<meta http-equiv=\"content-type\" content=\"text/html; charset=UTF-8\" />\n");
		}
		// **************************************************
		// Script SRC
		// **************************************************
		String scriptSRC = Strings.getString(request.getAttribute("scriptSRC"));
		if (scriptSRC.length() > 0)
			out.write(scriptSRC + "\n");
		
		// **************************************************
		// # Script Start
		// **************************************************
		out.write("<script>\n");
		
		// Script Message
		String message = Strings.getString(request.getAttribute("message"));
		if (message.length() > 0)
			out.write("alert(\"" + message + "\");\n");
		
		// Script Code
		String script = Strings.getString(request.getAttribute("script"));
		if (script.length() > 0)
			out.write(script + "\n");
		
		// HTML Target & Redirect
		String target = Strings.getString(request.getAttribute("target"));
		String redirect = Strings.getString(request.getAttribute("redirect"));
		if (redirect.length() > 0) {
			if (target.length() > 0)
				out.write(target + ".window.location.href=\"" + redirect + "\";\n");
			else
				out.write("window.location.href=\"" + redirect + "\";\n");
		}
		
		// Script Back
		String back = Strings.getString(request.getAttribute("back"));
		if (back.equalsIgnoreCase("true"))
			out.write("window.history.back();\n");
		
		// Script Close
		String close = Strings.getString(request.getAttribute("close"));
		if (close.equalsIgnoreCase("true"))
			out.write("top.window.self.close();\n");
		
		out.write("</script>\n");
		// **************************************************
		// # Script End
		// **************************************************
		out.write("</head>\n");
		out.write("<body>\n");
		
		// Post
		String post = Strings.getString(request.getAttribute("post"));
		if (post.length() > 0) {
			
			out.write("<form name=\"frmPost\" id=\"frmPost\" method=\"post\" action=\""
					+ Strings.getString(request.getAttribute("post")) + "\">\n");
			
			String[] name = (String[]) request.getAttribute("name");
			String[] value = (String[]) request.getAttribute("value");
			
			for (int nLoop = 0; nLoop < name.length; nLoop++) {
				out.write("<input type=\"hidden\" name=\"" + Strings.getString(name[nLoop]) + "\" id=\""
						+ Strings.getString(name[nLoop]) + "\" value=\"" + Strings.getString(value[nLoop]) + "\" />\n");
			}
			out.write("<script>document.getElementById(\"frmPost\").submit();</script>");
		}
		out.write("</body>\n");
		out.write("</html>\n");
	}
}
