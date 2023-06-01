package com.wasp.chaser;

import static org.junit.Assert.*;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

import lombok.extern.log4j.Log4j;

@Log4j
public class OracleConnectionTest {

	private static final String DRIVER = "oracle.jdbc.driver.OracleDriver";
	private static final String URL = "jdbc:log4jdbc:oracle:thin:@project-db-stu.smhrd.com:1524:XE";
	private static final String USER = "campus_c_230531_3";
	private static final String PW = "smhrd3";

	static {
		try {
			Class.forName(DRIVER);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	@Test
	public void test() {
		try(Connection con = DriverManager.getConnection(URL, USER, PW)){
			log.info(""+con);
			System.out.println(con);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
}
