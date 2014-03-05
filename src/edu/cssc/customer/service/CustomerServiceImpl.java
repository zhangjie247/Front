package edu.cssc.customer.service;
import java.text.SimpleDateFormat;
import java.util.Date;

import edu.cssc.util.HashUtil;

import com.opensymphony.xwork2.ActionContext;

import edu.cssc.data.Fexplorer;

/**CustomerService的一个实现。
 * @author zj
 *
 */
public class CustomerServiceImpl implements CustomerService{
	private CustomerDAO customerDao;

	public void setCustomerDao(CustomerDAO customerDao) {
		this.customerDao = customerDao;
	}

	public boolean add(Customer customer){
		customer.setPassword(HashUtil.encrypt(customer.getPassword(), "md5"));
		Customer oldcustomer = customerDao.findUser(customer.getUserName());
		
		if(oldcustomer != null){
			return false;
		}
		
		customerDao.saveOrUpdateUser(customer);
		return true;
		
	}
	
	public Customer findUser(String username){
		Customer customer = customerDao.findUser(username);
		return customer;
	}
	
	public void lastLogin(String username){
		Customer customer = customerDao.findUser(username);
		if(customer != null){
			String longdateStr = Long.toString(new Date().getTime());
			customer.setLastLogin(longdateStr);
			customerDao.saveOrUpdateUser(customer);
		}
	}
	
	@Override
	public boolean login(String username, String password) {
		String pw_hash = HashUtil.encrypt(password, "md5");
		Customer customer = customerDao.findUser(username);
		if(customer != null && pw_hash.equals(customer.getPassword())){
			
			//处理登陆时间
			String lastLogin = customer.getLastLogin();
			String longdateStr = Long.toString(new Date().getTime());
			customer.setLastLogin(longdateStr);
			customerDao.saveOrUpdateUser(customer);
			
			if(lastLogin != null){
				SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				lastLogin = dateFormat.format(new Date(Long.parseLong(lastLogin.trim())));
				ActionContext.getContext().getSession().put("lastLogin", lastLogin);
			}
			
			//处理用户组
			String str, wg = customer.getWorkGroup();
			if(wg.equals("administrator"))
				str = "管理员";
			else
				str = "普通用户";
			
			
			/*//跳转url
			String url = (String)ActionContext.getContext().getSession().get("goingToUrl");
			url = url==null? "showMsg.action":url;
			ActionContext.getContext().getSession().put("goingToUrl", url);*/
			 
			ActionContext.getContext().getSession().put("workGroup", str);
			ActionContext.getContext().getSession().put("loginUser", customer.getUserName());
			ActionContext.getContext().getSession().put("currentBase", Fexplorer.basePath + "/" + customer.getUserName() + "/");
			return true;
		}
		return false;
	}
	
	public boolean checkUser(String username, String password){
		String pw_hash = HashUtil.encrypt(password, "md5");
		Customer customer = customerDao.findUser(username);
		if(customer != null && pw_hash.equals(customer.getPassword())){
			return true;
		}
		return false;
	}
	
	public boolean modifyPassword(String username, String oldPassword, String newPassword){
		oldPassword = HashUtil.encrypt(oldPassword, "md5");
		newPassword = HashUtil.encrypt(newPassword, "md5");
		Customer customer = customerDao.findUser(username);
		if(customer != null){
			if(oldPassword.equals(customer.getPassword())){
				customer.setPassword(newPassword);
				customerDao.saveOrUpdateUser(customer);
				return true;
			}
		}
		
		return false;
	}
	
	public boolean checkRegister(String username){
		
		Customer customer = customerDao.findUser(username);
		
		if(customer != null){
			return false;
		}
		
		return true;
	}


}
