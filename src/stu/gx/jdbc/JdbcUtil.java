package stu.gx.jdbc;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Properties;


public class JdbcUtil {
	
	private static String className;
	private static String url;
	private static String user;
	private static String password;
	
	
	static
	{

		try{
			InputStream in = JdbcUtil.class.getClassLoader().getResourceAsStream("dbinfo.properties");
			Properties props = new Properties();
			props.load(in);
			className = props.getProperty("className");
			url = props.getProperty("url");
			user = props.getProperty("user");
			password = props.getProperty("password");
			//1、加载驱动程序并注册驱动
			Class.forName(className);
			
		}
		catch(Exception e)
		{
			throw new RuntimeException(e);
		}
		
		
	}
	

	public static Connection getConnection() throws Exception
	{

		Connection conn=null;
	
		//2、获取与数据库的连接:Connection
		conn =  DriverManager.getConnection(url, user, password);
		
		return conn;
	}
	
	
	public static void release(ResultSet rs,Statement stmt,Connection conn)
	{
		//6、释放占用的资源
		 if (rs != null) try { rs.close(); } catch(Exception e) {} rs=null;
        if (stmt != null) try { stmt.close(); } catch(Exception e) {}stmt=null;
        if (conn != null) try { conn.close(); } catch(Exception e) {}
		
	}

	
	
	
	
	
	
}