package kr.co.bravomylife.front.common.dto;

/**
 * @version 1.0.0
 * @author cydgate4957@gmail.com
 * 
 * @since 2024-10-01
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
public class PagingListDto {
	
	private PagingDto paging	= null;
	private Object list			= null;
	
	
	public PagingDto getPaging() {
		return paging;
	}
	public void setPaging(PagingDto paging) {
		this.paging = paging;
	}
	public Object getList() {
		return list;
	}
	public void setList(Object list) {
		this.list = list;
	}
}