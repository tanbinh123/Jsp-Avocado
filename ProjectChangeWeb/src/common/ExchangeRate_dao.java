package common;

import java.util.*;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import dto.ExchangeRate_dto;

public class ExchangeRate_dao {

	
	public ArrayList<ExchangeRate_dto> getExchangeRate() throws Exception{
		
		ArrayList<ExchangeRate_dto> arr = new ArrayList<ExchangeRate_dto>();
		
		WebConnection wc = new WebConnection();
		String json = wc.json;
		
		//json array 파싱하기
		JSONParser jsonParser = new JSONParser();
		JSONArray jsonArray = (JSONArray) jsonParser.parse(json);
		
		
		String CUR_NM="",CUR_UNIT="",TTB="",TTS="",DEAL_BAS_R="",BKPR="",YY_EFEE_R="",TEN_DD_EFEE_R="",KFTC_DEAL_BAS_R="",KFTC_BKPR="";
		
	for(int i=0;i<jsonArray.size();i++){
		JSONObject object = (JSONObject) jsonArray.get(i);
		CUR_NM = (String)object.get("cur_nm"); //국가
		CUR_UNIT = (String)object.get("cur_unit"); //통화코드
		TTB = (String)object.get("ttb"); //통화코드
		TTS = (String)object.get("tts"); //통화코드
		DEAL_BAS_R = (String)object.get("deal_bas_r");//매매 기준율
		BKPR = (String)object.get("bkpr");//장부가격
		YY_EFEE_R = (String)object.get("yy_efee_r");//년환가료율
		TEN_DD_EFEE_R = (String)object.get("ten_dd_efee_r");//10일환가료율
		KFTC_DEAL_BAS_R = (String)object.get("kftc_deal_bas_r");//서울외국환중계 매매기준율
		KFTC_BKPR = (String)object.get("kftc_bkpr");//서울외국환중계 장부가격
		
//		System.out.println("---------- "+(i+1)+"번째 검색 결과 ----------");
//		System.out.println("국가/통화명 : \t\t"+CUR_NM);
//		System.out.println("통화코드 : \t\t"+CUR_UNIT);
//		System.out.println("전신환(송금) 받으실때 : \t"+TTB);
//		System.out.println("전신환(송금) 보내실때 : \t"+TTS);
//		System.out.println("매매 기준율 : \t\t"+DEAL_BAS_R);
//		System.out.println("장부가격 : \t\t"+BKPR);
//		System.out.println("년환가료율 : \t\t"+YY_EFEE_R);
//		System.out.println("10일환가료율 : \t\t"+TEN_DD_EFEE_R);
//		System.out.println("서울외국환중계 매매기준율 : \t"+KFTC_DEAL_BAS_R);
//		System.out.println("서울외국환중계 장부가격 : \t"+KFTC_BKPR);
		
		ExchangeRate_dto dto = new ExchangeRate_dto(CUR_NM,CUR_UNIT,TTB,TTS,DEAL_BAS_R,BKPR,YY_EFEE_R,TEN_DD_EFEE_R,KFTC_DEAL_BAS_R,KFTC_BKPR);
		arr.add(dto);
	}
	
	return arr;
	}
}
