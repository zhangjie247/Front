package edu.cssc.customer.service;

/**用户类。
 * @author zj
 * @since version 0.1
 * 
 */
public class Customer {

	private String userName;
	private String password;
	private int age;
	private String email;
	private String workGroup;
	private String lastLogin;

	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getWorkGroup() {
		return workGroup;
	}
	public void setWorkGroup(String workGroup) {
		this.workGroup = workGroup;
	}
	public String getLastLogin() {
		return lastLogin;
	}
	public void setLastLogin(String lastLogin) {
		this.lastLogin = lastLogin;
	}

	
	public String toString(){
		
		return "userName:" + userName
		+ "   password:" + password
		+ "   age:" +  age
		+ "   email:" + email
		+ "   group:" + workGroup;
	}

}
