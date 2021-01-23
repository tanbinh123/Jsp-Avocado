package dto;

public class FreeboardDto {
	String freeboard_no, freeboard_title, freeboard_content, freeboard_regName, freeboard_regDate,reg_email ,freeboard_attach;
	int freeboard_hit, freeboard_like;
	
	//DBFreeboardSave attach 생성자
	public FreeboardDto(String freeboard_no, String freeboard_title, String freeboard_content, String freeboard_regName,
			String freeboard_regDate, String freeboard_attach, int freeboard_hit) {
		super();
		this.freeboard_no = freeboard_no;
		this.freeboard_title = freeboard_title;
		this.freeboard_content = freeboard_content;
		this.freeboard_regName = freeboard_regName;
		this.freeboard_regDate = freeboard_regDate;
		this.freeboard_attach = freeboard_attach;
		this.freeboard_hit = freeboard_hit;
	}
	
	//DBFreeboardSave attach 생성자2
    public FreeboardDto(String freeboard_no, String freeboard_title, String freeboard_content, String freeboard_regName,
            String freeboard_regDate, String freeboard_attach, int freeboard_hit, int freeboard_like) {
        super();
        this.freeboard_no = freeboard_no;
        this.freeboard_title = freeboard_title;
        this.freeboard_content = freeboard_content;
        this.freeboard_regName = freeboard_regName;
        this.freeboard_regDate = freeboard_regDate;
        this.freeboard_attach = freeboard_attach;
        this.freeboard_hit = freeboard_hit;
        this.freeboard_like = freeboard_like;
    }
	
	//FreeboardView 생성자
	public FreeboardDto(String freeboard_no, String freeboard_title, String freeboard_content, String freeboard_attach, String freeboard_regName,
			String freeboard_regDate, int freeboard_hit, String reg_email, int freeboard_like) {
		super();
		this.freeboard_no = freeboard_no;
		this.freeboard_title = freeboard_title;
		this.freeboard_content = freeboard_content;
		this.freeboard_attach = freeboard_attach;
		this.freeboard_regName = freeboard_regName;
		this.freeboard_regDate = freeboard_regDate;
		this.freeboard_hit = freeboard_hit;
		this.reg_email = reg_email;
		this.freeboard_like = freeboard_like;
	}
	
	   public FreeboardDto(String freeboard_no, String freeboard_title, String freeboard_content,String freeboard_attach) {
	        super();
	        this.freeboard_no = freeboard_no;
	        this.freeboard_title = freeboard_title;
	        this.freeboard_content = freeboard_content;
	        this.freeboard_attach = freeboard_attach;
	    }
	   
//	public FreeboardDto(String freeboard_no, String freeboard_title, String freeboard_content) {
//		super();
//		this.freeboard_no = freeboard_no;
//		this.freeboard_title = freeboard_title;
//		this.freeboard_content = freeboard_content;
//	}

	public FreeboardDto(String freeboard_no, String freeboard_title, String freeboard_content, String freeboard_regName,
			String freeboard_regDate, int freeboard_hit) {
		super();
		this.freeboard_no = freeboard_no;
		this.freeboard_title = freeboard_title;
		this.freeboard_content = freeboard_content;
		this.freeboard_regName = freeboard_regName;
		this.freeboard_regDate = freeboard_regDate;
		this.freeboard_hit = freeboard_hit;
	}
	
	

	public String getFreeboard_no() {
		return freeboard_no;
	}
	public String getFreeboard_title() {
		return freeboard_title;
	}
	public String getFreeboard_content() {
		return freeboard_content;
	}
	public String getFreeboard_regName() {
		return freeboard_regName;
	}
	public String getFreeboard_regDate() {
		return freeboard_regDate;
	}
	public int getFreeboard_hit() {
		return freeboard_hit;
	}
	public String getReg_email() {
		return reg_email;
	}
	public int getFreeboard_like() {
		return freeboard_like;
	}
	public String getFreeboard_attach() {
		return freeboard_attach;
	}
}
