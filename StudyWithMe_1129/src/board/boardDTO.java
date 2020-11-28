package board;

public class boardDTO {

    private int num;
    private String head;
    private String subject;
    private String title;
    private String text;
    private String user;
    private String date;

    //ID
    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    //Head
    public String getHead() {
        return head;
    }

    public void setHead(String head) {
        this.head = head;
    }    
    
    //subject
    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }  
    
    //tile
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }  
    
    //text
    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }  
    
    //user
    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }  
    
    //date 
    public String getDate () {
        return user;
    }

    public void setDate (String date ) {
        this.date = date;
    }  
}