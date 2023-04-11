package my.trade.vo;

import org.springframework.web.multipart.MultipartFile;

public class TradeVO {
	private int tradeId;
	private String writerId;
	private String title;
	private String professor;
	private String contents;
	private String phone;
	private String price;
	private String nowdate;
	private String image;
	private MultipartFile uploadImage;
	public int getTradeId() {
		return tradeId;
	}
	public void setTradeId(int tradeId) {
		this.tradeId = tradeId;
	}
	public String getWriterId() {
		return writerId;
	}
	public void setWriterId(String writerId) {
		this.writerId = writerId;
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
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public MultipartFile getUploadImage() {
		return uploadImage;
	}
	public void setUploadImage(MultipartFile uploadImage) {
		this.uploadImage = uploadImage;
	}
	@Override
	public String toString() {
		return "TradeVO [tradeId=" + tradeId + ", writerId=" + writerId + ", title=" + title + ", professor="
				+ professor + ", contents=" + contents + ", phone=" + phone + ", price=" + price + ", nowdate="
				+ nowdate + ", image=" + image + "]";
	}
}
