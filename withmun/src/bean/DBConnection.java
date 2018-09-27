/*
 * DB에 연결할 Connection을 반환할 목적
 */

package bean;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
   // 필드
/*
 * 
 *오라클
	String driver = "oracle.jdbc.driver.OracleDriver";         // oracle JDBC 드라이버 문자열 상수
   String dbUrl = "jdbc:oracle:thin:@192.168.0.7:1521:xe";   // withmun
   
   
   String dbUser = "withmun";
   String dbPwd = "withmun";
*/ 
	//MYSQL
	String driver = "com.mysql.jdbc.Driver";
	String dbUrl = "jdbc:mysql://ksnam0817.cafe24.com:3306/ksnam0817";
	String dbUser = "ksnam0817";
	String dbPwd = "dlsxjsotusjf1201";
	
	Connection conn;
   
   // 생성자
   public DBConnection() {
      try {
         // driver loading
         Class.forName(driver);
         conn = DriverManager.getConnection(dbUrl, dbUser, dbPwd);
         
         
      }catch(Exception ex) {
         ex.printStackTrace();
         
      }
   }

   // getter
   public Connection getConn() {
      return conn;
   }
   
}