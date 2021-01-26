package dto;

public class QnaDto {
	String qna_no, qna_title, qna_content, qna_regName, qna_regDate,reg_email ,qna_attach;
	int qna_hit, qna_like;
	
	//DBqnaSave attach 생성자
	public QnaDto(String qna_no, String qna_title, String qna_content, String qna_regName,
			String qna_regDate, String qna_attach, int qna_hit) {
		super();
		this.qna_no = qna_no;
		this.qna_title = qna_title;
		this.qna_content = qna_content;
		this.qna_regName = qna_regName;
		this.qna_regDate = qna_regDate;
		this.qna_attach = qna_attach;
		this.qna_hit = qna_hit;
	}
	
	//DBqnaSave attach 생성자2
    public QnaDto(String qna_no, String qna_title, String qna_content, String qna_regName,
            String qna_regDate, String qna_attach, int qna_hit, int qna_like) {
        super();
        this.qna_no = qna_no;
        this.qna_title = qna_title;
        this.qna_content = qna_content;
        this.qna_regName = qna_regName;
        this.qna_regDate = qna_regDate;
        this.qna_attach = qna_attach;
        this.qna_hit = qna_hit;
        this.qna_like = qna_like;
    }
	
	//qnaView 생성자
	public QnaDto(String qna_no, String qna_title, String qna_content, String qna_attach, String qna_regName,
			String qna_regDate, int qna_hit, String reg_email, int qna_like) {
		super();
		this.qna_no = qna_no;
		this.qna_title = qna_title;
		this.qna_content = qna_content;
		this.qna_attach = qna_attach;
		this.qna_regName = qna_regName;
		this.qna_regDate = qna_regDate;
		this.qna_hit = qna_hit;
		this.reg_email = reg_email;
		this.qna_like = qna_like;
	}
	
	   public QnaDto(String qna_no, String qna_title, String qna_content,String qna_attach) {
	        super();
	        this.qna_no = qna_no;
	        this.qna_title = qna_title;
	        this.qna_content = qna_content;
	        this.qna_attach = qna_attach;
	    }
	   
//	public qnaDto(String qna_no, String qna_title, String qna_content) {
//		super();
//		this.qna_no = qna_no;
//		this.qna_title = qna_title;
//		this.qna_content = qna_content;
//	}

	public QnaDto(String qna_no, String qna_title, String qna_content, String qna_regName,
			String qna_regDate, int qna_hit) {
		super();
		this.qna_no = qna_no;
		this.qna_title = qna_title;
		this.qna_content = qna_content;
		this.qna_regName = qna_regName;
		this.qna_regDate = qna_regDate;
		this.qna_hit = qna_hit;
	}
	
	

	public String getqna_no() {
		return qna_no;
	}
	public String getqna_title() {
		return qna_title;
	}
	public String getqna_content() {
		return qna_content;
	}
	public String getqna_regName() {
		return qna_regName;
	}
	public String getqna_regDate() {
		return qna_regDate;
	}
	public int getqna_hit() {
		return qna_hit;
	}
	public String getReg_email() {
		return reg_email;
	}
	public int getqna_like() {
		return qna_like;
	}
	public String getqna_attach() {
		return qna_attach;
	}
}
