package stu.gx.jdbc;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.sql.DataSource;

import com.mchange.v2.c3p0.ComboPooledDataSource;

public class C3P0Util {

	
	private static ComboPooledDataSource ds 
	= new ComboPooledDataSource();
	
	
	public static DataSource getDataSource() 
	{
		return ds;
	}
	
	public static Connection getConnection() throws Exception
	{

		Connection conn=null;
		System.out.println(conn);
		//2、获取与数据库的连接:Connection
		conn =  ds.getConnection();
		
		return conn;
	}
	
	public static void MySetAutoCommit(boolean b) throws Exception
	{
		
		Connection con =  getConnection();
		System.out.println("MySetAutoCommit"+con);
		con.setAutoCommit(b);	
	}
	
	
	public static void MyCommit() throws Exception
	{
		
		Connection con =  getConnection();
		System.out.println("MyCommit"+con);
		con.commit();
	}
	
	public static void release(ResultSet rs,Statement stmt,Connection conn)
	{
		//6、释放占用的资源
		 if (rs != null) try { rs.close(); } catch(Exception e) {} rs=null;
        if (stmt != null) try { stmt.close(); } catch(Exception e) {}stmt=null;
        if (conn != null) try { conn.close(); } catch(Exception e) {}
		
	}
	
}
