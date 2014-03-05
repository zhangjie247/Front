package edu.cssc.customer.service;

/**用户管理服务接口
 * 用户管理相关的action应该调用此接口完成具体的服务,例如判断用户输入的用户名密码是否正确。
 * @author zj
 *
 */
public interface CustomerService {

	/**
	 * 添加用户
	 * @param customer
	 * @return
	 */
	public boolean add(Customer customer);
	
	
	/**查找用户
	 * @param username  用户名
	 * @return
	 */
	public Customer findUser(String username);
	

	/**修改用户密码
	 * @param username 用户名
	 * @param oldPassword 旧密码
	 * @param newPassword 新密码
	 * @return
	 */
	public boolean modifyPassword(String username, String oldPassword, String newPassword);
	
	

	/**保存当前登陆记录
	 * @param username 用户名
	 * @return 用户上一次登陆时间戳
	 */
	public void lastLogin(String username);
	
	
	/**用户登陆及处理，用户信息保存在session中。
	 * @param username
	 * @param password
	 * @return
	 */
	public boolean login(String username, String password);
	
	
	/**
	 * 检查用户名、密码对是否存在，登陆处理使用login()函数。
	 * @param username
	 * @param password
	 * @return
	 * @see {@link #login(String, String)}
	 */
	public boolean checkUser(String username, String password);
	
	
	/**
	 * 检查用户名是否已注册
	 * @param username
	 * @return
	 */
	public boolean checkRegister(String username);
	
}
