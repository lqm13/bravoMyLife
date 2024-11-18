package kr.co.bravomylife.common.dto;

/**
 * @version 1.0.0
 * @author cydgate4957@gmail.com
 * 
 * @since 2024-09-30
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
public class EmailDto {
	
	private String sender			= "";		// 발신자
	private String[] to				= null;		// 수신자들	[REPORT: 메일만 배열 사용 가능]
	private String[] cc				= null;		// 참조자들	[REPORT: 메일만 사용 가능]
	private String[] bc				= null;		// 숨은자들	[REPORT: 메일만 사용 가능]
	private String subject			= "";		// 제목		[REPORT: 메일 또는 LMS 등만 사용 가능]
	private String message			= "";		// 메시지
	
	
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public String[] getTo() {
		return to;
	}
	public void setTo(String[] to) {
		this.to = to;
	}
	public String[] getCc() {
		return cc;
	}
	public void setCc(String[] cc) {
		this.cc = cc;
	}
	public String[] getBc() {
		return bc;
	}
	public void setBc(String[] bc) {
		this.bc = bc;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
}
