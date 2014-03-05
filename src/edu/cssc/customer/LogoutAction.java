package edu.cssc.customer;

import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;
import com.opensymphony.xwork2.ActionSupport;
/**处理用户登出操作
 * @author zj
 *
 */
@SuppressWarnings("serial")
public class LogoutAction extends ActionSupport{

	public String execute() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		request.getSession().invalidate();
		return SUCCESS;
	}
}
