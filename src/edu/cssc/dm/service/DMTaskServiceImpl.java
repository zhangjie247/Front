package edu.cssc.dm.service;

import java.util.List;

import edu.cssc.task.service.AbstractTask;
import edu.cssc.task.service.BaseTaskDAO;
import edu.cssc.task.service.BaseTaskService;
import edu.cssc.util.TaskUtil;

/**数据挖掘任务服务(TaskService)的一个具体实现。
 * @author zj
 *
 */
public class DMTaskServiceImpl implements BaseTaskService{

	private BaseTaskDAO DMTaskDao;

	public void setDMTaskDao(BaseTaskDAO taskDao) {
		this.DMTaskDao = taskDao;
	}
	
	public boolean addTask(AbstractTask task){
		//任务信息存入数据库
		if(! DMTaskDao.addTask(task))
			return false;
		
		//任务信息写入xml文件
		if(! TaskUtil.task2XML((DMTask)task))
			return false;
		
		//启动新线程，开始执行任务
		MiningThread mThread = new MiningThread((DMTask) task);
		mThread.start();
		
		return true;
	}
	
	public DMTask findTaskByID(String taskID){
		DMTask task  = (DMTask) DMTaskDao.findTaskByID(taskID);
		return task;
	}
	
	public List findTaskByUsername(String username){
		List li = DMTaskDao.findTaskByUsername(username);
		return li;
	}


}
