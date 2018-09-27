package bean;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

// 메일전송에 사용되는 계정의 정보
public class MyAuthenticator extends Authenticator{ 
	PasswordAuthentication pa;

	public PasswordAuthentication getPasswordAuthentication() {
		String user = "ksnam0817@naver.com";
		String pwd = "sksmsskarltjd";
		pa = new PasswordAuthentication(user, pwd);
		
		return pa;
	}
}
