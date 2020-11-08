package common;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

/**
 * 한국 수출입 은행 환율 API
 * (https://www.koreaexim.go.kr/site/program/openapi/openApiView?menuid=001003002002001&apino=2&viewtype=O)
 * 
 * json형식 데이터를 파싱해 get방식으로 ExchangeRate_dao에서 데이터를 가져온다.
 * 
 */
public class ExchangeConnection {

  public String json;

  public ExchangeConnection() throws Exception {
    String address = "https://www.koreaexim.go.kr/site/program/financial/exchangeJSON?authkey=PlsinPhzDH3Z4EWpnCr8SiEoqB4EHI2s&searchdate=20201028&data=AP01";
    BufferedReader br;
    URL url;
    HttpURLConnection conn;
    String protocol = "GET";

    url = new URL(address);
    conn = (HttpURLConnection) url.openConnection();
    conn.setRequestMethod(protocol);
    br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

    json = br.readLine();
    // 테스트출력
    // System.out.println(json);
  }
}
