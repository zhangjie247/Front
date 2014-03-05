package edu.cssc.task.service;

import java.util.List;

/**任务信息持久化映射类，所有具体的任务映射类都需要继承该类。
 * @author zj
 *
 */
public interface BaseTaskDAO {
	public boolean addTask(AbstractTask task);
	
	public AbstractTask findTaskByID(String taskID);
	
	public List findTaskByUsername(String username);
}
