package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class customer {
	String username,password,name;

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	public boolean insert()
	{
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/customerdb","root","");
			String sql;
			sql="insert into customerinfo values(?,?,?)";
			PreparedStatement st=con.prepareStatement(sql);
			st.setString(1, name);
			st.setString(2, username);
			st.setString(3,password);
			int x=st.executeUpdate();
			if(x>0)
			{
				return true;
			}
			else
			{
				return false;
			}
		}catch(Exception e)
		{}
		return false;
	}
	

}
