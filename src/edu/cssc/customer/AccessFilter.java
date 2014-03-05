package edu.cssc.customer;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**访问权限过滤器。用户未登陆时不允许直接访问登陆和主页之外的jsp页面
 * @author zj
 *
 */
public class AccessFilter implements Filter {
/**
* @author zhangjie
*/
    
    public void destroy() {
     }
    public void doFilter(ServletRequest arg0, ServletResponse arg1,
             FilterChain filterChain) throws IOException, ServletException {
         HttpServletRequest request = (HttpServletRequest)arg0;
         HttpServletResponse response = (HttpServletResponse)arg1;
         HttpSession session = request.getSession();
         StringBuffer uri = request.getRequestURL();
         String last = uri.substring(uri.length() - 6);
        if(session.getAttribute("loginUser")== null
        		&& ! last.contains("Front")
        		&& uri.indexOf("register") == -1
        		&& uri.indexOf("login")==-1
        		&& uri.indexOf("index")==-1){
             response.sendRedirect(request.getContextPath() + "/login.jsp");
             return ;
         }
         filterChain.doFilter(arg0, arg1);
     }
    public void init(FilterConfig arg0) throws ServletException {
     }
}