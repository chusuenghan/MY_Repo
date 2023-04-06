package my.user.vo;

public class UserVO {
	private String userId;
	private String pwd;
	private String name;
	private String phone;
	private String used;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getUsed() {
		return used;
	}
	public void setUsed(String used) {
		this.used = used;
	}
	
	@Override
	public String toString() {
		return "UserVO [userId=" + userId + ", pwd=" + pwd + ", name=" + name + ", phone=" + phone + ", used=" + used
				+ "]";
	}
	
}