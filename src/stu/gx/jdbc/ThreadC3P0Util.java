package stu.gx.jdbc;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.sql.DataSource;

import com.mchange.v2.c3p0.ComboPooledDataSource;

public class ThreadC3P0Util {

	private static ComboPooledDataSource ds 
	= new ComboPooledDataSource();
	
	
	public static DataSource getDataSource() 
	{
		return ds;
	}
	
	private static  ThreadLocal<Connection> tl = 
			new ThreadLocal<Connection>();
	
	
	public static Connection getConnection() throws Exception
	{

		Connection conn=tl.get();
		if(conn==null)
		{
			conn =  ds.getConnection();
			tl.set(conn);
		}
	
		return conn;
	}
	
	public static void MySetAutoCommit(boolean b) throws Exception
	{
		Connection conn=tl.get();
		System.out.println("MySetAutoCommit"+conn);
		if(conn==null)
		{
			conn =  ds.getConnection();
			System.out.println("MySetAutoCommit"+conn);
			tl.set(conn);
			conn.setAutoCommit(b);
		}
		
		
		//Connection con =  getConnection();
		
		
		
	}
	
	
	public static void MyCommit() throws Exception
	{
		Connection conn=tl.get();
		System.out.println("MyCommit"+conn);
		if(conn==null)
		{
			conn =  ds.getConnection();
			tl.set(conn);
			

			conn.commit();
		}
		//Connection con =  getConnection();
		//con.commit();
		
		
	}
	
	public static void MyRollback() throws Exception
	{
		Connection conn=tl.get();
		if(conn==null)
		{
			conn =  ds.getConnection();
			tl.set(conn);
			conn.rollback();
		}
		//Connection con =  getConnection();
		//con.commit();
		
		
	}
	
	
	
}
