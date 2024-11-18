package kr.co.bravomylife.backoffice.common.dto;

/**
 * @version 1.0.0
 * @author cydgate4957@gmail.com
 * 
 * @since 2024-10-01
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
public class PagingDto {
	
	private int totalLine		= 0;
	private int totalPage		= 0;
	private int linePerPage	= 10;
	private int currentPage	= 1;
	
	private String searchKey				= "";
	private String searchWord				= "";
	private String searchKeyState			= "";
	private String searchKeyPay			= "";
	private String searchKeyDelivery	= "";
	
	private Integer cd_bbs_type	= 0;
	private int cd_ctg			= 0;
	private int register		= 0;
	
	private Integer seq_sle		= 0;
	private Integer	seq_mbr		= 0;
	private String cd_ctg_m		= "";
	private String cd_ctg_b		= "";
	private String filter		= "";
	private String corp_nm		= "";
	private String prd_type		= "";
	private String cd_state_sale= "";
	private String cd_state				= "";
	private String cd_state_pay			= "";
	private String cd_state_delivery	= "";
	
	private String mbr_nm		= "";
	
	
	public String getMbr_nm() {
		return mbr_nm;
	}
	public void setMbr_nm(String mbr_nm) {
		this.mbr_nm = mbr_nm;
	}
	public String getCd_state() {
		return cd_state;
	}
	public void setCd_state(String cd_state) {
		this.cd_state = cd_state;
	}
	public String getCd_state_pay() {
		return cd_state_pay;
	}
	public void setCd_state_pay(String cd_state_pay) {
		this.cd_state_pay = cd_state_pay;
	}
	public String getCd_state_delivery() {
		return cd_state_delivery;
	}
	public void setCd_state_delivery(String cd_state_delivery) {
		this.cd_state_delivery = cd_state_delivery;
	}
	public String getSearchKeyState() {
		return searchKeyState;
	}
	public void setSearchKeyState(String searchKeyState) {
		this.searchKeyState = searchKeyState;
	}
	public String getSearchKeyPay() {
		return searchKeyPay;
	}
	public void setSearchKeyPay(String searchKeyPay) {
		this.searchKeyPay = searchKeyPay;
	}
	public String getSearchKeyDelivery() {
		return searchKeyDelivery;
	}
	public void setSearchKeyDelivery(String searchKeyDelivery) {
		this.searchKeyDelivery = searchKeyDelivery;
	}
	public int getTotalLine() {
		return totalLine;
	}
	public void setTotalLine(int totalLine) {
		this.totalLine = totalLine;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getLinePerPage() {
		return linePerPage;
	}
	public void setLinePerPage(int linePerPage) {
		this.linePerPage = linePerPage;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public String getSearchKey() {
		return searchKey;
	}
	public void setSearchKey(String searchKey) {
		this.searchKey = searchKey;
	}
	public String getSearchWord() {
		return searchWord;
	}
	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}
	public Integer getCd_bbs_type() {
		return cd_bbs_type;
	}
	public void setCd_bbs_type(Integer cd_bbs_type) {
		this.cd_bbs_type = cd_bbs_type;
	}
	public int getCd_ctg() {
		return cd_ctg;
	}
	public void setCd_ctg(int cd_ctg) {
		this.cd_ctg = cd_ctg;
	}
	public int getRegister() {
		return register;
	}
	public void setRegister(int register) {
		this.register = register;
	}
	public Integer getSeq_sle() {
		return seq_sle;
	}
	public void setSeq_sle(Integer seq_sle) {
		this.seq_sle = seq_sle;
	}
	public Integer getSeq_mbr() {
		return seq_mbr;
	}
	public void setSeq_mbr(Integer seq_mbr) {
		this.seq_mbr = seq_mbr;
	}
	public String getCd_ctg_m() {
		return cd_ctg_m;
	}
	public void setCd_ctg_m(String cd_ctg_m) {
		this.cd_ctg_m = cd_ctg_m;
	}
	public String getCd_ctg_b() {
		return cd_ctg_b;
	}
	public void setCd_ctg_b(String cd_ctg_b) {
		this.cd_ctg_b = cd_ctg_b;
	}
	public String getFilter() {
		return filter;
	}
	public void setFilter(String filter) {
		this.filter = filter;
	}
	public String getCorp_nm() {
		return corp_nm;
	}
	public void setCorp_nm(String corp_nm) {
		this.corp_nm = corp_nm;
	}
	public String getPrd_type() {
		return prd_type;
	}
	public void setPrd_type(String prd_type) {
		this.prd_type = prd_type;
	}
	public String getCd_state_sale() {
		return cd_state_sale;
	}
	public void setCd_state_sale(String cd_state_sale) {
		this.cd_state_sale = cd_state_sale;
	}
	
}