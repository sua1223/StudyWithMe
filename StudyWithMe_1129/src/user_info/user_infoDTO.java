package user_info;

public class user_infoDTO {

	private String id;
	private String pw;
	private String e_mail;
	private String school;
	private String major;
	private String profile_url;
	private String timetable_url;
	
	 //ID
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
    
    //PW
    public String getPw() {
        return pw;
    }

    public void setPw(String pw) {
        this.pw = pw;
    }
    
    //E_mail
    public String getEmail() {
        return e_mail;
    }

    public void setEmail(String e_mail) {
        this.e_mail = e_mail;
    }
    
    //School
    public String getSchool() {
        return school;
    }

    public void setSchool(String school) {
        this.school = school;
    }
    
    //Major
    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major;
    }
    
    //Profile_url
    public String getProfile_url() {
        return profile_url;
    }

    public void setProfile_url(String profile_url) {
        this.profile_url = profile_url;
    }
    
    //Timetable_url
    public String getTimetable_url() {
        return timetable_url;
    }

    public void setTimetable_url(String timetable_url) {
        this.timetable_url = timetable_url;
    }
	
}
