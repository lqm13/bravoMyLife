package kr.co.bravomylife.front.common.dto;

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
	private int linePerPage		= 10;
	private int currentPage		= 1;
	
	private String searchKey	= "";
	private String searchWord	= "";
	private String sSearchKey	= "";
	private String sSearchWord	= "";
	
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
	private int point_stack		= 0;
	private int point_value		= 0;
	private String mbr_nm		= "";
	private int count			= 0;
	private int seq_sle_count	= 0;
	private int total_price_sum	= 0;
	private int total_point_sum	= 0;
	private int review_count	= 0;
	private String cd_state		="";
	
	private String sle_nm			= "";
	private String img				= "";
	private int price_sale			= 0;
	private int discount_sale		= 0;
	private int rnum				= 0;
	private int seq_like			= 0;
	private String flg_delete		= "";
	private String dt_upt			= "";
	private int updater				= 0;
	private String flg_like			= "";
	private int discount			= 0;
	
	
	public String getsSearchKey() {
		return sSearchKey;
	}
	public void setsSearchKey(String sSearchKey) {
		this.sSearchKey = sSearchKey;
	}
	public String getsSearchWord() {
		return sSearchWord;
	}
	public void setsSearchWord(String sSearchWord) {
		this.sSearchWord = sSearchWord;
	}
	public String getCd_state() {
		return cd_state;
	}
	public void setCd_state(String cd_state) {
		this.cd_state = cd_state;
	}
	public int getDiscount() {
		return discount;
	}
	public void setDiscount(int discount) {
		this.discount = discount;
	}
	public int getReview_count() {
		return review_count;
	}
	public void setReview_count(int review_count) {
		this.review_count = review_count;
	}
	public String getSle_nm() {
		return sle_nm;
	}
	public void setSle_nm(String sle_nm) {
		this.sle_nm = sle_nm;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public int getPrice_sale() {
		return price_sale;
	}
	public void setPrice_sale(int price_sale) {
		this.price_sale = price_sale;
	}
	public int getDiscount_sale() {
		return discount_sale;
	}
	public void setDiscount_sale(int discount_sale) {
		this.discount_sale = discount_sale;
	}
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public int getSeq_like() {
		return seq_like;
	}
	public void setSeq_like(int seq_like) {
		this.seq_like = seq_like;
	}
	public String getFlg_delete() {
		return flg_delete;
	}
	public void setFlg_delete(String flg_delete) {
		this.flg_delete = flg_delete;
	}
	public String getDt_upt() {
		return dt_upt;
	}
	public void setDt_upt(String dt_upt) {
		this.dt_upt = dt_upt;
	}
	public int getUpdater() {
		return updater;
	}
	public void setUpdater(int updater) {
		this.updater = updater;
	}
	public String getFlg_like() {
		return flg_like;
	}
	public void setFlg_like(String flg_like) {
		this.flg_like = flg_like;
	}
	public int getTotal_point_sum() {
		return total_point_sum;
	}
	public void setTotal_point_sum(int total_point_sum) {
		this.total_point_sum = total_point_sum;
	}
	public int getSeq_sle_count() {
		return seq_sle_count;
	}
	public void setSeq_sle_count(int seq_sle_count) {
		this.seq_sle_count = seq_sle_count;
	}
	public int getTotal_price_sum() {
		return total_price_sum;
	}
	public void setTotal_price_sum(int total_price_sum) {
		this.total_price_sum = total_price_sum;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getPoint_value() {
		return point_value;
	}
	public void setPoint_value(int point_value) {
		this.point_value = point_value;
	}
	public String getMbr_nm() {
		return mbr_nm;
	}
	public void setMbr_nm(String mbr_nm) {
		this.mbr_nm = mbr_nm;
	}
	public int getPoint_stack() {
		return point_stack;
	}
	public void setPoint_stack(int point_stack) {
		this.point_stack = point_stack;
	}
	public Integer getSeq_mbr() {
		return seq_mbr;
	}
	public void setSeq_mbr(Integer seq_mbr) {
		this.seq_mbr = seq_mbr;
	}
	public String getCd_ctg_b() {
		return cd_ctg_b;
	}
	public void setCd_ctg_b(String cd_ctg_b) {
		this.cd_ctg_b = cd_ctg_b;
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
	public String getCd_ctg_m() {
		return cd_ctg_m;
	}
	public void setCd_ctg_m(String cd_ctg_m) {
		this.cd_ctg_m = cd_ctg_m;
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
}