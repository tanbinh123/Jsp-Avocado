package common;

public class commonJDBC {

  /**
   * 실행중인 메소드 이름을 취득
   * 
   * @return 메소드명
   */
  public String getMethodName() {
    return Thread.currentThread().getStackTrace()[3].getMethodName();
  }


  /**
   * SQL 오류시 메세지 출력
   * 
   * @param methodName 대상 메소드 이름
   * @param query 오류 쿼리문 출력
   */
  public void printSQLExceptionError(String query) {
    System.out.println("[ERROR]" + getMethodName() + " query error: " + query);
  }

  /**
   * 오류시 메세지 출력
   * 
   * @param methodName 대상 메소드 이름
   */
  public void printExceptionError() {
    System.out.println("[ERROR]" + getMethodName());
  }
}
