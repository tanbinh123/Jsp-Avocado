package common;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

public class WebConnection {
	String json;
	public WebConnection() throws Exception{
		String address = "https://www.koreaexim.go.kr/site/program/financial/exchangeJSON?authkey=PlsinPhzDH3Z4EWpnCr8SiEoqB4EHI2s&searchdate=20201028&data=AP01";
		BufferedReader br;
		URL url;
		HttpURLConnection conn;
		String protocol = "GET";

		url = new URL(address);
		conn = (HttpURLConnection)url.openConnection();
		conn.setRequestMethod(protocol);
		br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

		json = br.readLine();
        //테스트출력
		//System.out.println(json);
	}
}
