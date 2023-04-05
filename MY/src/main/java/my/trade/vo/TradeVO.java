package my.trade.vo;

import org.springframework.web.multipart.MultipartFile;

public class TradeVO {
	private int tradeId;
	private String title;
	private String professor;
	private String contents;
	private String phone;
	private String price;
	private String nowdate;
	private String pwd;
	private String image;
	private MultipartFile uploadImage;
	
	public MultipartFile getUploadImage() {
		return uploadImage;
	}
	public void setUploadImage(MultipartFile uploadImage) {
		this.uploadImage = uploadImage;
	}
	public int getTradeId() {
		return tradeId;
	}
	public void setTradeId(int tradeId) {
		this.tradeId = tradeId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getProfessor() {
		return professor;
	}
	public void setProfessor(String professor) {
		this.professor = professor;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getNowdate() {
		return nowdate;
	}
	public void setNowdate(String nowdate) {
		this.nowdate = nowdate;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	@Override
	public String toString() {
		return "TradeVO [tradeId=" + tradeId + ", title=" + title + ", professor=" + professor + ", contents="
				+ contents + ", phone=" + phone + ", price=" + price + ", nowdate=" + nowdate + ", pwd=" + pwd
				+ ", image=" + image + "]";
	}
}
