package dto;

public class NoticeDto {

	String no,title,attach,content,reg_name,reg_date;
	int hit;
	public NoticeDto(String no, String title, String attach, String content, String reg_name, String reg_date,
			int hit) {
		super();
		this.no = no;
		this.title = title;
		this.attach = attach;
		this.content = content;
		this.reg_name = reg_name;
		this.reg_date = reg_date;
		this.hit = hit;
	}
	
	
	public String getNo() {
		return no;
	}
	public String getTitle() {
		return title;
	}
	public String getAttach() {
		return attach;
	}
	public String getContent() {
		return content;
	}
	public String getReg_name() {
		return reg_name;
	}
	public String getReg_date() {
		return reg_date;
	}
	public int getHit() {
		return hit;
	}
	
	
}
