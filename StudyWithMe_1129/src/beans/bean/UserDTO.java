package beans.bean;

public class UserDTO {
	private String id;
	private String pw;
	private String e_mail;
	private String shool;
	private String major;
	private String profile_url;
	private String timetable_url;
	
	public UserDTO() {}
	public UserDTO(String id, String pw, String e_mail, String shool, String major, String profile_url, String timetable_url) {
		this.id = id;
		this.pw = pw;
		this.e_mail = e_mail;
		this.shool = shool;
		this.major = major;
		this.profile_url = profile_url;
		this.timetable_url = timetable_url;
	}
	
	//id
	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	
	//pw
	public String getPw() {
		return pw;
	}
	
	public void setPw(String pw) {
		this.pw = pw;
	}
	
	//e_mail
	public String getE_mail() {
		return e_mail;
	}
	
	public void setE_mail(String e_mail) {
		this.e_mail = e_mail;
	}
	
	//shool
	public String getShool() {
		return shool;
	}
	
	public void setShool(String shool) {
		this.shool = shool;
	}
	
	//major
	public String getMajor() {
		return major;
	}
	
	public void setMajor(String major) {
		this.major = major;
	}
	
	//profile_url
	public String getProfile_url() {
		return profile_url;
	}
	
	public void setProfile_url(String profile_url) {
		this.profile_url = profile_url;
	}
	
	//timetable_url
	public String getTimetable_url() {
		return timetable_url;
	}
	
	public void setTimetable_url(String timetable_url) {
		this.timetable_url = timetable_url;
	}
}
