package kr.co.bravomylife.util.messenger;

import java.io.Serializable;
/**
 * @version 1.0.0
 * @author cydgate4957@gmail.com
 * 
 * @since 2024-09-30
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
public class MessageObject implements Serializable {
	
	/** Serial version UID */
	private static final long serialVersionUID = 20170614134100L;
	
	/** Name */
	protected String name;
	
	/** Message */
	protected String message;
	
	/** Control */
	protected int control;
	
	/**
	 * @param control [상태]
	 * @param name [이름]
	 * @param message [메시지]
	 * 
	 * @since 2024-09-30
	 * <p>DESCRIPTION:</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	public MessageObject(int control, String name, String message) {
		this.control	= control;
		this.name		= name;
		this.message	= message;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getMessage() {
		return message;
	}
	
	public void setMessage(String message) {
		this.message = message;
	}
	
	public int getControl() {
		return control;
	}
	
	public void setControl(int control) {
		this.control = control;
	}
}
