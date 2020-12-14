package notice;

import java.util.Scanner;

import dao.MemberDao;
import dto.MemberDto;

public class NoticeCRUDTest {

  public static void main(String[] args) {
    // TODO Auto-generated method stub
    //NoticeDao dao = new NoticeDao();
    MemberDao memberDao = new MemberDao();
    
    Scanner sc = new Scanner(System.in);
   
    //memberDao.getMethodName();
    
    
    //이메일중복검사테스트
    //System.out.println(memberDao.idCheckCount("abc@gmail.com"));
    
    
   //로그인테스트
    //System.out.println(memberDao.getLoginName("abc@gmail.com", "sex"));
    
    
    //회원가입 테스트
   /* String no = sc.next();
    String name = sc.next();
    String email = sc.next();
    String phone = sc.next();
    String pw = sc.next();
    
    MemberDto dto = new MemberDto(no, name, email, phone, pw);
    int result = memberDao.saveMember(dto);
    if (result == 1) { 
    	System.out.println("등록성공~");
    }else if (result == 0) {
    	System.out.println("실패");
    }*/
    
    
    
  //디비테스트
    /*int menu = -1;
    
    do {
      
    
    System.out.println("1 조회, 2 등록, 3수정, 4삭제, 0종료");
    menu = sc.nextInt();

    if (menu == 1) {
      ArrayList<NoticeDto> arr = dao.getNoticeList("", "");
      for (int i = 0; i < arr.size(); i++) {
        System.out.println(arr.get(i).getNo() + " " + arr.get(i).getTitle() + " " + arr.get(i).getAttach() + " " + arr.get(i).getContent() + " " + arr.get(i).getReg_name() + " " + arr.get(i).getReg_date() + " " + arr.get(i).getHit());
      }
    }
    if (menu == 2) {
      System.out.print("번호 입력 : ");
      String no = sc.next();
      String title = "titletest";
      String content = "contenttest";
      String attach = "aa";
      String reg_name = "me";
      String reg_date = "2020-11-09";
      int hit = 0;

      NoticeDto dto = new NoticeDto(no, title, attach, content, reg_name, reg_date, hit);
      int result = dao.saveNotice(dto);
      if (result == 1) {
        System.out.println("등록완료");
      }
    }
    if(menu == 3) {

    }
    if(menu == 4) {
      System.out.print("삭제할 번호 입력 : ");
      String no = sc.next();
      int result = dao.deleteNotice(no);
      if (result == 1) {
        System.out.println("삭제완료");
      }
      
    }
    } while (menu != 0);*/
  }

}
