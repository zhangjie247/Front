package edu.cssc.task.service;

import java.util.List;


/**描述一个任务服务必须实现的操作。包括添加任务和查找任务等。
 * @author zj
 *
 */
public interface BaseTaskService {
	/**按以下步骤添加一个任务：
	 * <br>&nbsp;&nbsp;任务信息写入数据库
	 * <br>&nbsp;&nbsp;任务信息写入xml文件
	 * <br>&nbsp;&nbsp;启动任务。
	 * @param task
	 * @return
	 */
	public boolean addTask(AbstractTask task);
	
	public AbstractTask findTaskByID(String taskID);
	
	public List findTaskByUsername(String username);
}
