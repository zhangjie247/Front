package edu.cssc.customer;

import java.io.File;
import java.util.Date;
import javax.servlet.http.Cookie;
import org.apache.struts2.ServletActionContext;

import edu.cssc.customer.service.Customer;
import edu.cssc.customer.service.CustomerService;
import edu.cssc.data.Fexplorer;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ActionContext;

/**用户管理实现类，具体Action包括：<br>
 * loginIn:转入登陆界面<br>
 * login：用户登陆判断和处理<br>
 * registerIn:转入用户注册页面<br>
 * register:用户注册<br>
 * modifyPassword:用户修改密码<br>
 * showMsg:显示基本用户信息和任务信息
 * 
 * @author zj
 *
 */
@SuppressWarnings("serial")
public class CustomerManager extends ActionSupport{

	private Customer customer;
	private CustomerService customerService;	
	private boolean rememberMe;
	private String oldPassword;
	private String newPassword;

	private boolean readPolicy;
	@SuppressWarnings("unused")
	private String confirmPassword;
	

	/**若用户选择记住登陆信息，转入查看信息页面，否则转入用户登陆界面
	 * @return
	 * @throws Exception
	 */
	public String loginIn() throws Exception{
		String username = (String)ActionContext.getContext().getSession().get("loginUser");
		if(username != null && ! username.equals("")){
			return SUCCESS;
		}
		return LOGIN;
	}
	
	/**用户登陆判断和处理
	 * @return
	 * @throws Exception
	 */
	public String login() throws Exception{
		//添加缓存
		if (rememberMe) {   
	        Cookie cookie = new Cookie("rememberMe", customer.getUserName() + "," + customer.getPassword());   
	        cookie.setMaxAge(60 * 60 * 24 * 30);   
	        ServletActionContext.getResponse().addCookie(cookie);   
	    }
		//
		if(!customerService.login(customer.getUserName(), customer.getPassword())){
			addActionError("登录失败");
		}else{
			return SUCCESS;
		}
		return INPUT;
	}
	
	
	/**修改密码
	 * @return
	 * @throws Exception
	 */
	public String modifyPassword() throws Exception{
		if(!customerService.modifyPassword((String)ActionContext.getContext().getSession().get("loginUser"), oldPassword, newPassword) ){
			addActionError("修改密码失败");
		}else{
			
			return SUCCESS;
		}
		
		return INPUT;
	}
	
	public String execute() throws Exception{
		
		return SUCCESS;
	}
	
	/**转入用户注册页面
	 * @return
	 * @throws Exception
	 */
	public String registerIn() throws Exception{
		ActionContext.getContext().getSession().remove("currentMenu");
		return "register";
	}
	
	/**用户注册
	 * @return
	 * @throws Exception
	 */
	public String register() throws Exception{
		if(readPolicy != true || customerService.add(customer) != true){
			addActionError("注册失败");
		}else{
			String userDir = Fexplorer.basePath + "/" + customer.getUserName();
			File userBase = new File(userDir);
			if(! userBase.exists() || ! userBase.isDirectory()){
				userBase.mkdir();
			}
			File input = new File(userDir + "/input");
			if(! input.exists() || ! input.isDirectory())
				input.mkdir();
			File output = new File(userDir + "/output");
			if(! output.exists() || ! output.isDirectory())
				output.mkdir();
			
			return "register_success";
		}
		
		return "register";
	}
	
	/**显示用户信息
	 * @return
	 * @throws Exception
	 */
	public String showMsg() throws Exception{
		
		String username = (String)ActionContext.getContext().getSession().get("loginUser");
		customer = customerService.findUser(username);
		if(customer == null){
			return ERROR;
		}
		
		return SUCCESS;
	}


	public boolean isRememberMe() {
		return rememberMe;
	}

	public void setRememberMe(boolean rememberMe) {
		this.rememberMe = rememberMe;
	}

	public void setCustomerService(CustomerService customerService) {
		this.customerService = customerService;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	
	public void setOldPassword(String oldPassword) {
		this.oldPassword = oldPassword;
	}

	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}
	public void setReadPolicy(boolean readPolicy) {
		this.readPolicy = readPolicy;
	}

	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}
	public Date getCurrentTime(){
		return new Date();
	}


	

}
