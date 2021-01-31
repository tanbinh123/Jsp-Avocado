package unused;

public class ExchangeRate_dto {

	String CUR_NM,CUR_UNIT,TTB,TTS,DEAL_BAS_R,BKPR,YY_EFEE_R,TEN_DD_EFEE_R,KFTC_DEAL_BAS_R,KFTC_BKPR;

	public ExchangeRate_dto(String cUR_NM, String cUR_UNIT, String tTB, String tTS, String dEAL_BAS_R, String bKPR,
			String yY_EFEE_R, String tEN_DD_EFEE_R, String kFTC_DEAL_BAS_R, String kFTC_BKPR) {
		super();
		CUR_NM = cUR_NM;
		CUR_UNIT = cUR_UNIT;
		TTB = tTB;
		TTS = tTS;
		DEAL_BAS_R = dEAL_BAS_R;
		BKPR = bKPR;
		YY_EFEE_R = yY_EFEE_R;
		TEN_DD_EFEE_R = tEN_DD_EFEE_R;
		KFTC_DEAL_BAS_R = kFTC_DEAL_BAS_R;
		KFTC_BKPR = kFTC_BKPR;
	}

	public String getCUR_NM() {
		return CUR_NM;
	}

	public String getCUR_UNIT() {
		return CUR_UNIT;
	}

	public String getTTB() {
		return TTB;
	}

	public String getTTS() {
		return TTS;
	}

	public String getDEAL_BAS_R() {
		return DEAL_BAS_R;
	}

	public String getBKPR() {
		return BKPR;
	}

	public String getYY_EFEE_R() {
		return YY_EFEE_R;
	}

	public String getTEN_DD_EFEE_R() {
		return TEN_DD_EFEE_R;
	}

	public String getKFTC_DEAL_BAS_R() {
		return KFTC_DEAL_BAS_R;
	}

	public String getKFTC_BKPR() {
		return KFTC_BKPR;
	}
	
	
}
