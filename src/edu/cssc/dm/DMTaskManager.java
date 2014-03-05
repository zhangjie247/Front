package edu.cssc.dm;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import edu.cssc.dm.service.DMTask;
import edu.cssc.task.BaseTaskManager;
import edu.cssc.task.service.BaseTaskService;

/**处理数据挖掘任务，例如查看和删除历史任务。添加和提交数据挖掘任务分别由
 * ADDDMTask类和SubmitDMTask类完成。
 * @author zj
 *
 */
@SuppressWarnings("serial")
public class DMTaskManager extends ActionSupport implements BaseTaskManager{

	private String username;
	private String taskID;
	private BaseTaskService DMTaskService;
	private DMTask task;
	private List<DMTask> tasklist;
	private String fileName;
	
    public InputStream getInputStream() throws Exception {
        return new FileInputStream(task.getParam().getLocalDirPrefix() + fileName);
    }
    
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getTaskID() {
		return taskID;
	}
	public void setTaskID(String taskID) {
		this.taskID = taskID;
	}
	public void setDMTaskService(BaseTaskService taskService) {
		this.DMTaskService = taskService;
	}

	public DMTask getTask() {
		return task;
	}

	public List<DMTask> getTasklist() {
		return tasklist;
	}
	
	public String addTask(){
		return "addDMTask";
	}
    
	public String list() throws Exception{
		
		String username = (String)ActionContext.getContext().getSession().get("loginUser");
		tasklist = (List<DMTask>)DMTaskService.findTaskByUsername(username);
		
		return "list";
	}
	

	public String detail() throws Exception{
		
		
		return "detail";
	}
	
	public String result() throws Exception{
		
		String filePath;
		task = (DMTask) DMTaskService.findTaskByID(taskID);
		filePath = task.getParam().getLocalDirPrefix() + task.getOutput_result();

		ActionContext.getContext().getSession().remove("outputFilepath");
		ActionContext.getContext().getSession().put("outputFilepath", filePath);
		
		return "result";
	}
	
	public String download() throws Exception{
		username = (String)ActionContext.getContext().getSession().get("loginUser");
		task = (DMTask) DMTaskService.findTaskByID(taskID);
		fileName = task.getOutput_result();
		return "download";
	}
	
	public String stop() throws Exception{
		
		return "stop";
	}

	public String del() throws Exception{
		
		return "del";
	}
}
