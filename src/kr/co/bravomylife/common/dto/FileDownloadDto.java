package kr.co.bravomylife.common.dto;

/**
 * @version 1.0.0
 * @author cydgate4957@gmail.com
 * 
 * @since 2024-08-08
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
public class FileDownloadDto {
	
	private String file_original	= "";
	private String file_save		= "";
	private long file_size			= 0;
	
	
	public String getFile_original() {
		return file_original;
	}
	public void setFile_original(String file_original) {
		this.file_original = file_original;
	}
	public String getFile_save() {
		return file_save;
	}
	public void setFile_save(String file_save) {
		this.file_save = file_save;
	}
	public long getFile_size() {
		return file_size;
	}
	public void setFile_size(long file_size) {
		this.file_size = file_size;
	}
}