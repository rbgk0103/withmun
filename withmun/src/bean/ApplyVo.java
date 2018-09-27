/*
 * 1개 지원서(apply)에 해당하는 Vo 객체
 */

package bean;

public class ApplyVo {
	/*
	 * 필드
	 */
	
	// 기본정보
	int aNo = 0;
	String email = "";
	String pwd = "";;
	String field = "";
	String name = "";
	String jumin1 = "";
	String jumin2 = "";
	String addr = "";
	String zipCode = "";
	
	String tel = "";
	String tel1 = "";
	String tel2 = "";
	String tel3 = "";
	
	String mobile = "";
	String mobile1 = "";
	String mobile2 = "";
	String mobile3 = "";
	
	
	// 학업사항
	String highName = "";
	String highStart = "";
	String highFinish = "";
	String highJolUp = "";
	
	String colName = "";
	String colStart = "";
	String colFinish = "";
	String colMajor = "";
	String colGrade = "";
	String colJolUp = "";
	
	String univName = "";
	String univStart = "";
	String univFinish = "";
	String univMajor = "";
	String univGrade = "";
	String univJolUp = "";
	
	String gradName = "";
	String gradStart = "";
	String gradFinish = "";
	String gradMajor = "";
	String gradGrade = "";
	String gradJolUp = "";
	
	// 병역사항
	String gunByul = "";
	String gunByung = "";
	String gunGye = "";
	String gunStart = "";
	String gunFinish = "";
	String gunPil = "";
	String gunMiPilWhy = "";
	
	// 외국어
	String lang1Name = "";
	String lang1Score = "";
	String lang1Date = "";
	String lang2Name = "";
	String lang2Score = "";
	String lang2Date = "";
	
	// 자격면허
	String license1Name = "";
	String license1Date = "";
	String license1Org = "";
	String license2Name = "";
	String license2Date = "";
	String license2Org = "";
	
	// 동아리 및 봉사활동
	String activity1Content = "";
	String activity1Start = "";
	String activity1Finish = "";
	String activity1Org = "";
	String activity2Content = "";
	String activity2Start = "";
	String activity2Finish = "";
	String activity2Org = "";
	
	// 가족관계
	String family1Rel = "";
	String family1Name = "";
	String family1Birth = "";
	String family1Academic = "";
	String family1Job = "";
	String family1Company = "";
	String family1Position = "";
	String family1Livewith = "";
	
	String family2Rel = "";
	String family2Name = "";
	String family2Birth = "";
	String family2Academic = "";
	String family2Job = "";
	String family2Company = "";
	String family2Position = "";
	String family2Livewith = "";
	
	String family3Rel = "";
	String family3Name = "";
	String family3Birth = "";
	String family3Academic = "";
	String family3Job = "";
	String family3Company = "";
	String family3Position = "";
	String family3Livewith = "";
	
	String family4Rel = "";
	String family4Name = "";
	String family4Birth = "";
	String family4Academic = "";
	String family4Job = "";
	String family4Company = "";
	String family4Position = "";
	String family4Livewith = "";
	
	// 취미 등 기타사항
	String hobby = "";
	String special = "";
	String religion = "";
	String boHun = "";
	
	// 자기소개 (apply_introduce.jsp)
	String sungJang = "";
	String charact = "";
	String motive = "";
	String future = "";
	
	// 사진
	String photoC = "";
	String photoS = "";
	
	// 지원날짜
	String applyDate = "";
	
	// 검토여부
	int review = 0;
	
	/*
	 * Getters and Setters
	 */
	
	public int getaNo() {
		return aNo;
	}

	public void setaNo(int aNo) {
		this.aNo = aNo;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getField() {
		return field;
	}

	public void setField(String field) {
		this.field = field;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getJumin1() {
		return jumin1;
	}

	public void setJumin1(String jumin1) {
		this.jumin1 = jumin1;
	}

	public String getJumin2() {
		return jumin2;
	}

	public void setJumin2(String jumin2) {
		this.jumin2 = jumin2;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getZipCode() {
		return zipCode;
	}

	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getTel1() {
		return tel1;
	}

	public void setTel1(String tel1) {
		this.tel1 = tel1;
	}

	public String getTel2() {
		return tel2;
	}

	public void setTel2(String tel2) {
		this.tel2 = tel2;
	}

	public String getTel3() {
		return tel3;
	}

	public void setTel3(String tel3) {
		this.tel3 = tel3;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getMobile1() {
		return mobile1;
	}

	public void setMobile1(String mobile1) {
		this.mobile1 = mobile1;
	}

	public String getMobile2() {
		return mobile2;
	}

	public void setMobile2(String mobile2) {
		this.mobile2 = mobile2;
	}

	public String getMobile3() {
		return mobile3;
	}

	public void setMobile3(String mobile3) {
		this.mobile3 = mobile3;
	}

	public String getHighName() {
		return highName;
	}

	public void setHighName(String highName) {
		this.highName = highName;
	}

	public String getHighStart() {
		return highStart;
	}

	public void setHighStart(String highStart) {
		this.highStart = highStart;
	}

	public String getHighFinish() {
		return highFinish;
	}

	public void setHighFinish(String highFinish) {
		this.highFinish = highFinish;
	}

	public String getHighJolUp() {
		return highJolUp;
	}

	public void setHighJolUp(String highJolUp) {
		this.highJolUp = highJolUp;
	}

	public String getColName() {
		return colName;
	}

	public void setColName(String colName) {
		this.colName = colName;
	}

	public String getColStart() {
		return colStart;
	}

	public void setColStart(String colStart) {
		this.colStart = colStart;
	}

	public String getColFinish() {
		return colFinish;
	}

	public void setColFinish(String colFinish) {
		this.colFinish = colFinish;
	}

	public String getColMajor() {
		return colMajor;
	}

	public void setColMajor(String colMajor) {
		this.colMajor = colMajor;
	}

	public String getColGrade() {
		return colGrade;
	}

	public void setColGrade(String colGrade) {
		this.colGrade = colGrade;
	}

	public String getColJolUp() {
		return colJolUp;
	}

	public void setColJolUp(String colJolUp) {
		this.colJolUp = colJolUp;
	}

	public String getUnivName() {
		return univName;
	}

	public void setUnivName(String univName) {
		this.univName = univName;
	}

	public String getUnivStart() {
		return univStart;
	}

	public void setUnivStart(String univStart) {
		this.univStart = univStart;
	}

	public String getUnivFinish() {
		return univFinish;
	}

	public void setUnivFinish(String univFinish) {
		this.univFinish = univFinish;
	}

	public String getUnivMajor() {
		return univMajor;
	}

	public void setUnivMajor(String univMajor) {
		this.univMajor = univMajor;
	}

	public String getUnivGrade() {
		return univGrade;
	}

	public void setUnivGrade(String univGrade) {
		this.univGrade = univGrade;
	}

	public String getUnivJolUp() {
		return univJolUp;
	}

	public void setUnivJolUp(String univJolUp) {
		this.univJolUp = univJolUp;
	}

	public String getGradName() {
		return gradName;
	}

	public void setGradName(String gradName) {
		this.gradName = gradName;
	}

	public String getGradStart() {
		return gradStart;
	}

	public void setGradStart(String gradStart) {
		this.gradStart = gradStart;
	}

	public String getGradFinish() {
		return gradFinish;
	}

	public void setGradFinish(String gradFinish) {
		this.gradFinish = gradFinish;
	}

	public String getGradMajor() {
		return gradMajor;
	}

	public void setGradMajor(String gradMajor) {
		this.gradMajor = gradMajor;
	}

	public String getGradGrade() {
		return gradGrade;
	}

	public void setGradGrade(String gradGrade) {
		this.gradGrade = gradGrade;
	}

	public String getGradJolUp() {
		return gradJolUp;
	}

	public void setGradJolUp(String gradJolUp) {
		this.gradJolUp = gradJolUp;
	}

	public String getGunByul() {
		return gunByul;
	}

	public void setGunByul(String gunByul) {
		this.gunByul = gunByul;
	}

	public String getGunByung() {
		return gunByung;
	}

	public void setGunByung(String gunByung) {
		this.gunByung = gunByung;
	}

	public String getGunGye() {
		return gunGye;
	}

	public void setGunGye(String gunGye) {
		this.gunGye = gunGye;
	}

	public String getGunStart() {
		return gunStart;
	}

	public void setGunStart(String gunStart) {
		this.gunStart = gunStart;
	}

	public String getGunFinish() {
		return gunFinish;
	}

	public void setGunFinish(String gunFinish) {
		this.gunFinish = gunFinish;
	}

	public String getGunPil() {
		return gunPil;
	}

	public void setGunPil(String gunPil) {
		this.gunPil = gunPil;
	}

	public String getGunMiPilWhy() {
		return gunMiPilWhy;
	}

	public void setGunMiPilWhy(String gunMiPilWhy) {
		this.gunMiPilWhy = gunMiPilWhy;
	}

	public String getLang1Name() {
		return lang1Name;
	}

	public void setLang1Name(String lang1Name) {
		this.lang1Name = lang1Name;
	}

	public String getLang1Score() {
		return lang1Score;
	}

	public void setLang1Score(String lang1Score) {
		this.lang1Score = lang1Score;
	}

	public String getLang1Date() {
		return lang1Date;
	}

	public void setLang1Date(String lang1Date) {
		this.lang1Date = lang1Date;
	}

	public String getLang2Name() {
		return lang2Name;
	}

	public void setLang2Name(String lang2Name) {
		this.lang2Name = lang2Name;
	}

	public String getLang2Score() {
		return lang2Score;
	}

	public void setLang2Score(String lang2Score) {
		this.lang2Score = lang2Score;
	}

	public String getLang2Date() {
		return lang2Date;
	}

	public void setLang2Date(String lang2Date) {
		this.lang2Date = lang2Date;
	}

	public String getLicense1Name() {
		return license1Name;
	}

	public void setLicense1Name(String license1Name) {
		this.license1Name = license1Name;
	}

	public String getLicense1Date() {
		return license1Date;
	}

	public void setLicense1Date(String license1Date) {
		this.license1Date = license1Date;
	}

	public String getLicense1Org() {
		return license1Org;
	}

	public void setLicense1Org(String license1Org) {
		this.license1Org = license1Org;
	}

	public String getLicense2Name() {
		return license2Name;
	}

	public void setLicense2Name(String license2Name) {
		this.license2Name = license2Name;
	}

	public String getLicense2Date() {
		return license2Date;
	}

	public void setLicense2Date(String license2Date) {
		this.license2Date = license2Date;
	}

	public String getLicense2Org() {
		return license2Org;
	}

	public void setLicense2Org(String license2Org) {
		this.license2Org = license2Org;
	}

	public String getActivity1Content() {
		return activity1Content;
	}

	public void setActivity1Content(String activity1Content) {
		this.activity1Content = activity1Content;
	}

	public String getActivity1Start() {
		return activity1Start;
	}

	public void setActivity1Start(String activity1Start) {
		this.activity1Start = activity1Start;
	}

	public String getActivity1Finish() {
		return activity1Finish;
	}

	public void setActivity1Finish(String activity1Finish) {
		this.activity1Finish = activity1Finish;
	}

	public String getActivity1Org() {
		return activity1Org;
	}

	public void setActivity1Org(String activity1Org) {
		this.activity1Org = activity1Org;
	}

	public String getActivity2Content() {
		return activity2Content;
	}

	public void setActivity2Content(String activity2Content) {
		this.activity2Content = activity2Content;
	}

	public String getActivity2Start() {
		return activity2Start;
	}

	public void setActivity2Start(String activity2Start) {
		this.activity2Start = activity2Start;
	}

	public String getActivity2Finish() {
		return activity2Finish;
	}

	public void setActivity2Finish(String activity2Finish) {
		this.activity2Finish = activity2Finish;
	}

	public String getActivity2Org() {
		return activity2Org;
	}

	public void setActivity2Org(String activity2Org) {
		this.activity2Org = activity2Org;
	}

	public String getFamily1Rel() {
		return family1Rel;
	}

	public void setFamily1Rel(String family1Rel) {
		this.family1Rel = family1Rel;
	}

	public String getFamily1Name() {
		return family1Name;
	}

	public void setFamily1Name(String family1Name) {
		this.family1Name = family1Name;
	}

	public String getFamily1Birth() {
		return family1Birth;
	}

	public void setFamily1Birth(String family1Birth) {
		this.family1Birth = family1Birth;
	}

	public String getFamily1Academic() {
		return family1Academic;
	}

	public void setFamily1Academic(String family1Academic) {
		this.family1Academic = family1Academic;
	}

	public String getFamily1Job() {
		return family1Job;
	}

	public void setFamily1Job(String family1Job) {
		this.family1Job = family1Job;
	}

	public String getFamily1Company() {
		return family1Company;
	}

	public void setFamily1Company(String family1Company) {
		this.family1Company = family1Company;
	}

	public String getFamily1Position() {
		return family1Position;
	}

	public void setFamily1Position(String family1Position) {
		this.family1Position = family1Position;
	}

	public String getFamily1Livewith() {
		return family1Livewith;
	}

	public void setFamily1Livewith(String family1Livewith) {
		this.family1Livewith = family1Livewith;
	}

	public String getFamily2Rel() {
		return family2Rel;
	}

	public void setFamily2Rel(String family2Rel) {
		this.family2Rel = family2Rel;
	}

	public String getFamily2Name() {
		return family2Name;
	}

	public void setFamily2Name(String family2Name) {
		this.family2Name = family2Name;
	}

	public String getFamily2Birth() {
		return family2Birth;
	}

	public void setFamily2Birth(String family2Birth) {
		this.family2Birth = family2Birth;
	}

	public String getFamily2Academic() {
		return family2Academic;
	}

	public void setFamily2Academic(String family2Academic) {
		this.family2Academic = family2Academic;
	}

	public String getFamily2Job() {
		return family2Job;
	}

	public void setFamily2Job(String family2Job) {
		this.family2Job = family2Job;
	}

	public String getFamily2Company() {
		return family2Company;
	}

	public void setFamily2Company(String family2Company) {
		this.family2Company = family2Company;
	}

	public String getFamily2Position() {
		return family2Position;
	}

	public void setFamily2Position(String family2Position) {
		this.family2Position = family2Position;
	}

	public String getFamily2Livewith() {
		return family2Livewith;
	}

	public void setFamily2Livewith(String family2Livewith) {
		this.family2Livewith = family2Livewith;
	}

	public String getFamily3Rel() {
		return family3Rel;
	}

	public void setFamily3Rel(String family3Rel) {
		this.family3Rel = family3Rel;
	}

	public String getFamily3Name() {
		return family3Name;
	}

	public void setFamily3Name(String family3Name) {
		this.family3Name = family3Name;
	}

	public String getFamily3Birth() {
		return family3Birth;
	}

	public void setFamily3Birth(String family3Birth) {
		this.family3Birth = family3Birth;
	}

	public String getFamily3Academic() {
		return family3Academic;
	}

	public void setFamily3Academic(String family3Academic) {
		this.family3Academic = family3Academic;
	}

	public String getFamily3Job() {
		return family3Job;
	}

	public void setFamily3Job(String family3Job) {
		this.family3Job = family3Job;
	}

	public String getFamily3Company() {
		return family3Company;
	}

	public void setFamily3Company(String family3Company) {
		this.family3Company = family3Company;
	}

	public String getFamily3Position() {
		return family3Position;
	}

	public void setFamily3Position(String family3Position) {
		this.family3Position = family3Position;
	}

	public String getFamily3Livewith() {
		return family3Livewith;
	}

	public void setFamily3Livewith(String family3Livewith) {
		this.family3Livewith = family3Livewith;
	}

	public String getFamily4Rel() {
		return family4Rel;
	}

	public void setFamily4Rel(String family4Rel) {
		this.family4Rel = family4Rel;
	}

	public String getFamily4Name() {
		return family4Name;
	}

	public void setFamily4Name(String family4Name) {
		this.family4Name = family4Name;
	}

	public String getFamily4Birth() {
		return family4Birth;
	}

	public void setFamily4Birth(String family4Birth) {
		this.family4Birth = family4Birth;
	}

	public String getFamily4Academic() {
		return family4Academic;
	}

	public void setFamily4Academic(String family4Academic) {
		this.family4Academic = family4Academic;
	}

	public String getFamily4Job() {
		return family4Job;
	}

	public void setFamily4Job(String family4Job) {
		this.family4Job = family4Job;
	}

	public String getFamily4Company() {
		return family4Company;
	}

	public void setFamily4Company(String family4Company) {
		this.family4Company = family4Company;
	}

	public String getFamily4Position() {
		return family4Position;
	}

	public void setFamily4Position(String family4Position) {
		this.family4Position = family4Position;
	}

	public String getFamily4Livewith() {
		return family4Livewith;
	}

	public void setFamily4Livewith(String family4Livewith) {
		this.family4Livewith = family4Livewith;
	}

	public String getHobby() {
		return hobby;
	}

	public void setHobby(String hobby) {
		this.hobby = hobby;
	}

	public String getSpecial() {
		return special;
	}

	public void setSpecial(String special) {
		this.special = special;
	}

	public String getReligion() {
		return religion;
	}

	public void setReligion(String religion) {
		this.religion = religion;
	}

	public String getBoHun() {
		return boHun;
	}

	public void setBoHun(String boHun) {
		this.boHun = boHun;
	}

	public String getSungJang() {
		return sungJang;
	}

	public void setSungJang(String sungJang) {
		this.sungJang = sungJang;
	}

	public String getCharact() {
		return charact;
	}

	public void setCharact(String charact) {
		this.charact = charact;
	}

	public String getMotive() {
		return motive;
	}

	public void setMotive(String motive) {
		this.motive = motive;
	}

	public String getFuture() {
		return future;
	}

	public void setFuture(String future) {
		this.future = future;
	}

	public String getPhotoC() {
		return photoC;
	}

	public void setPhotoC(String photoC) {
		this.photoC = photoC;
	}

	public String getPhotoS() {
		return photoS;
	}

	public void setPhotoS(String photoS) {
		this.photoS = photoS;
	}

	public String getApplyDate() {
		return applyDate;
	}

	public void setApplyDate(String applyDate) {
		this.applyDate = applyDate;
	}

	public int getReview() {
		return review;
	}

	public void setReview(int review) {
		this.review = review;
	}


	
	
	
	
	
	
}
