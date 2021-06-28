package tool82.spring.project.vo;

public class Email {

    protected String subject;
    protected String content;
    protected String receiver;

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getReceiver() {
        return receiver;
    }

    public void setReceiver(String receiver) {
        this.receiver = receiver;
    }

    @Override
    public String toString() {
        return "Email [subject=" + subject + ", content=" + content + ", receiver=" + receiver + "]";
    }
}
