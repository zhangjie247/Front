package edu.cssc.dm;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import edu.cssc.dm.service.DMTask;
import edu.cssc.task.service.BaseTaskService;

/**提交数据挖掘任务到持久化存储和运行线程。
 * @author zj
 *
 */
@SuppressWarnings("serial")
public class SubmitDMTask extends ActionSupport{

	//数据挖掘参数	
	private DMTask task;
	private BaseTaskService DMTaskService;
	
	public void setDMTaskService(BaseTaskService dMTaskService) {
		DMTaskService = dMTaskService;
	}

	/**提交数据挖掘任务
	 * @return
	 * @throws Exception
	 */
	public String taskSubmit() throws Exception{	
		
		task = (DMTask)ActionContext.getContext().getSession().get("task");
		ActionContext.getContext().getSession().remove("task");
		
		if(DMTaskService.addTask(task))
			return SUCCESS;
		
		return ERROR;
	}
}
