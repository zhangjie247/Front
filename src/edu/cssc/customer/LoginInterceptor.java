package edu.cssc.customer;

import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

import edu.cssc.customer.service.CustomerService;

/**用户登陆拦截器，用户未登陆时不允许访问除登陆和注册外的其它页面。
 * @author zj
 *
 */
@SuppressWarnings("serial")
public class LoginInterceptor extends AbstractInterceptor{
	private CustomerService customerService;

	@SuppressWarnings("unchecked")
	public String intercept(ActionInvocation invocation) throws Exception{
		ActionContext actcon = invocation.getInvocationContext();
		HttpServletRequest request = ServletActionContext.getRequest();
		Map session = actcon.getSession();
		
		String loginUser = (String)session.get("loginUser");
		
		//判断用户是否已经登陆
		if(loginUser != null && ! loginUser.equals("")){
			return invocation.invoke();
		}
		
		Cookie[] cookies = request.getCookies();
		if (cookies!=null) {  
            for (Cookie cookie : cookies) {  
                if ("rememberMe".equals(cookie.getName())) {  
                    String value = cookie.getValue();  
                    if (value != null && ! value.equals("")) {  
                        String[] split = value.split(",");  
                        String userName = split[0];  
                        String password = split[1]; 
                        try {  
                            customerService.login(userName, password);
                        } catch (Exception e) {  
                            return Action.LOGIN;  
                        }
                    } else {  
                        return Action.LOGIN;   
                    }  
                    return invocation.invoke();  
                }  
            }  
        }
        return Action.LOGIN; 

	}
	
/*	private void setGoingToURL(Map session, ActionInvocation invocation){  
        String url = "";  
        String namespace = invocation.getProxy().getNamespace();  
        if (namespace != null && ! namespace.equals("") && !namespace.equals("/")){  
            url = url + namespace;  
        }  
        String actionName = invocation.getProxy().getActionName();  
        if (actionName != null && ! actionName.equals("")){  
            url = url + "/" + actionName + ".action";  
        }  
        session.put("goingToUrl", url);  
    }  
*/
	public void setCustomerService(CustomerService customerService) {
		this.customerService = customerService;
	}

	public CustomerService getCustomerService() {
		return customerService;
	}

}
