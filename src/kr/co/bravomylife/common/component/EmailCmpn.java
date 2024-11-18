package kr.co.bravomylife.common.component;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.MessageSourceAccessor;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

import kr.co.bravomylife.common.dto.EmailDto;

/**
 * @version 1.0.0
 * @author cydgate4957@gmail.com
 * 
 * @since 2024-09-30
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
@Component("kr.co.bravomylife.common.component.EmailCmpn")
public class EmailCmpn {
	
	/** Logger */
	private static Logger logger = LoggerFactory.getLogger(EmailCmpn.class);
	
	@Autowired
	private MessageSourceAccessor dynamicProperties;
	
	@Autowired
	private JavaMailSender mailSender;

	/**
	 * @param emailDto [메시지 빈(Bean)]
	 * @throws Exception
	 * @return Boolean
	 * 
	 * @since 2024-09-30
	 * <p>DESCRIPTION:</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	public Boolean send(EmailDto emailDto) throws Exception {
		
		// 발신자 메일(네이버는 필수 설정이 필요하며 SMTP 계정과 동일 메일만 허용 vs. 구글은 설정된 SMTP 계정으로만 자동 설정됨)
		emailDto.setSender(dynamicProperties.getMessage("email.sender.mail", "[UNDEFINED]"));
		boolean result = false;
		
		try {
			MimeMessage mimeMessage		= mailSender.createMimeMessage();
			MimeMessageHelper helper	= new MimeMessageHelper(mimeMessage, false, "UTF-8");
			
			helper.setFrom(new InternetAddress(emailDto.getSender(), dynamicProperties.getMessage("email.sender.name", "[UNDEFINED]")));
			helper.setTo(emailDto.getTo());
			helper.setSubject(emailDto.getSubject());
			helper.setText(emailDto.getMessage(), true);
			
			// 실제 발송
			if (dynamicProperties.getMessage("email.sender.isSending", "[UNDEFINED]").equals("true")) {
				mailSender.send(mimeMessage);
				// 발송 로그: [서비스 일련번호][메일 수신자(0)][메일 제목][상용 vs. 개발]
				logger.info("[COM.BRAVOMYLIFE.MESSAGE.EMAIL] "
						+ "[" + emailDto.getTo()[0] + "...]"
						+ "[" + emailDto.getSubject() + "]"
						+ "[N/A]" + "\n");
			}
			else logger.info("[COM.BRAVOMYLIFE.MESSAGE.EMAIL] "
					+ "[" + emailDto.getTo()[0] + "...]"
					+ "[" + emailDto.getSubject() + "]"
					+ "[Test Success!]" + "\n");
			
			result = true;
			
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".send()] " + e.getMessage(), e);
		}
		
		return result;
	}

}
