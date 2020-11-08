package dao;

import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import common.ExchangeConnection;
import dto.ExchangeRate_dto;

public class ExchangeRate_dao {

  /**
   * 한국 수출입 은행 환율 API
   * 
   * 호출 시 ExchangeConnection에서 가져온 json을 get방식으로 파싱해 데이터를 변수에 담고, for문을 돌면서 리스트를 생성해 각 dto를 만들어준다.
   *
   *
   * 요청URL (Request URL) https://www.koreaexim.go.kr/site/program/financial/exchangeJSON
   *
   * 요청변수 (Requester Parameter) 변수명 타입 변수설명 값설명 authkey String(필수) 인증키 OpenAPI 신청시 발급된 인증키
   * searchdate String 검색요청날짜 ex) 2015-01-01, 20150101, (DEFAULT)현재일 data String(필수) 검색요청API타입 AP01
   * : 환율, AP02 : 대출금리, AP03 : 국제금리
   *
   * 출력결과 (Response Element) 변수명 타입 변수설명 값설명 RESULT Integer 조회 결과 1 : 성공, 2 : DATA코드 오류, 3 : 인증코드
   * 오류, 4 : 일일제한횟수 마감 CUR_UNIT String 통화코드 CUR_NM String 국가/통화명 TTB String 전신환(송금)받으실때 TTS String
   * 전신환(송금)보내실때 DEAL_BAS_R String 매매 기준율 BKPR String 장부가격 YY_EFEE_R String 년환가료율 TEN_DD_EFEE_R
   * String 10일환가료율 KFTC_DEAL_BAS_R String 서울외국환중개매매기준율 KFTC_BKPR String 서울외국환중개장부가격
   *
   * 이용시 유의사항 비영업일의 데이터, 혹은 영업당일 11시 이전에 해당일의 데이터를 요청할 경우 null 값이 반환
   *
   * @param
   * @return ArrayList<ExchangeRate_dto>
   * @throws 비영업일의 데이터, 혹은 영업당일 11시 이전에 해당일의 데이터를 요청할 경우 null 값이 반환
   * @deprecated 1.8
   * @author thyoondev
   */
  public ArrayList<ExchangeRate_dto> getExchangeRate() throws Exception {

    ArrayList<ExchangeRate_dto> arr = new ArrayList<ExchangeRate_dto>();
    ExchangeConnection wc = new ExchangeConnection();

    String json = wc.json;

    // json array 파싱하기
    JSONParser jsonParser = new JSONParser();
    JSONArray jsonArray = (JSONArray) jsonParser.parse(json);

    // 변수 초기화
    String CUR_NM = "", CUR_UNIT = "", TTB = "", TTS = "", DEAL_BAS_R = "", BKPR = "",
        YY_EFEE_R = "", TEN_DD_EFEE_R = "", KFTC_DEAL_BAS_R = "", KFTC_BKPR = "";

    for (int i = 0; i < jsonArray.size(); i++) {
      JSONObject object = (JSONObject) jsonArray.get(i);
      CUR_NM = (String) object.get("cur_nm"); // 국가
      CUR_UNIT = (String) object.get("cur_unit"); // 통화코드
      TTB = (String) object.get("ttb"); // 통화코드
      TTS = (String) object.get("tts"); // 통화코드
      DEAL_BAS_R = (String) object.get("deal_bas_r");// 매매 기준율
      BKPR = (String) object.get("bkpr");// 장부가격
      YY_EFEE_R = (String) object.get("yy_efee_r");// 년환가료율
      TEN_DD_EFEE_R = (String) object.get("ten_dd_efee_r");// 10일환가료율
      KFTC_DEAL_BAS_R = (String) object.get("kftc_deal_bas_r");// 서울외국환중계 매매기준율
      KFTC_BKPR = (String) object.get("kftc_bkpr");// 서울외국환중계 장부가격

      ExchangeRate_dto dto = new ExchangeRate_dto(CUR_NM, CUR_UNIT, TTB, TTS, DEAL_BAS_R, BKPR,YY_EFEE_R, TEN_DD_EFEE_R, KFTC_DEAL_BAS_R, KFTC_BKPR);
      arr.add(dto);
    }

    return arr;
  }


}
