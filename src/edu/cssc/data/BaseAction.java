/**
* 文件名：BaseAction.java
*
* 版本信息：
* 日期：2012-5-14
* Copyright 华中科技大学通软中心 Corporation 2012 
* 版权所有
*
*/
package edu.cssc.data;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

/**处理文件上传的基类。
 * @author zj
 *
 */
@SuppressWarnings("serial")
public abstract class BaseAction extends ActionSupport implements SessionAware,ServletRequestAware, ServletResponseAware{

	protected HttpServletRequest request;

	protected HttpServletResponse response;

	@SuppressWarnings("unchecked")
	protected Map sessionMap;


	public void setServletRequest(HttpServletRequest arg0) {
		this.request = arg0;
		
	}

	public void setServletResponse(HttpServletResponse arg0) {
		this.response = arg0;
	}

	public void setSession(Map arg0) {
		this.sessionMap = arg0;
	}
}

