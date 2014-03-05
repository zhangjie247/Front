package edu.cssc.task.service;

import java.text.SimpleDateFormat;
import java.util.Date;

/**所有任务(例如数据挖掘任务)的基类。当需要添加一个模块时，继承该类以描述一个特定的可运行的任务。
 * @author zj
 *
 */
public abstract class AbstractTask {

	private String taskID;
	private String username;
	private String addingDate;
	private String finishDate;
	private float fee;
	private String status;
	
		
	public String getTaskID() {
		return taskID;
	}
	public void setTaskID(String taskID) {
		this.taskID = taskID;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getAddingDate() {
		return addingDate;
	}
	public void setAddingDate(String addingDate) {
		this.addingDate = addingDate;
	}
	public String getFinishDate() {
		return finishDate;
	}
	public void setFinishDate(String finishDate) {
		this.finishDate = finishDate;
	}
	public float getFee() {
		return fee;
	}
	public void setFee(float fee) {
		this.fee = fee;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}

	public String getAddingDateStr(){
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return dateFormat.format(new Date(Long.parseLong(addingDate.trim())));
	}
	
	public String getFinishDateStr(){
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return dateFormat.format(new Date(Long.parseLong(finishDate.trim())));
	}
}
