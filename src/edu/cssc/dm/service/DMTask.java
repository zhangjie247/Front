package edu.cssc.dm.service;

import java.util.Date;

import edu.cssc.task.service.AbstractTask;

/**描述一个数据挖掘任务。注意！该任务的参数大部分存储在BaseDMParam类中。
 * @author zj
 *
 */
public class DMTask extends AbstractTask{
	
	private String method;

	//算法需要用到的特定参数集
	private BaseDMParam param;

	public String getOutput_result() {
		return param.getOutput_result();
	}

	/**在处理task的最后调用此函数。<br>
	 * 为数据挖掘参数集生成一个ID描述符
	 */
	public void prepareID(){
		Date date = new Date();
		param.setParamID(this.getUsername() + Long.toString(date.getTime()));
	}
	
	public String getMethod() {
		return method;
	}
	public void setMethod(String method) {
		this.method = method;
	}
	
	public BaseDMParam getParam() {
		return param;
	}
	public void setParam(BaseDMParam param) {
		this.param = param;
	}
	
}
