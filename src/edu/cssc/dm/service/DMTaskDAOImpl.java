package edu.cssc.dm.service;

import java.util.List;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import edu.cssc.task.service.AbstractTask;
import edu.cssc.task.service.BaseTaskDAO;

/**数据挖掘任务持久化映射层的一个具体实现
 * @author zj
 *
 */
public class DMTaskDAOImpl extends HibernateDaoSupport implements BaseTaskDAO{

	public boolean addTask(AbstractTask task){
		getHibernateTemplate().save(task);
		return true;
	}
	
	public AbstractTask findTaskByID(String taskID){
		List li = getHibernateTemplate().find("FROM DMTask as t where t.taskID = ?", taskID);
		if(li != null && li.size() >= 1){
			return (AbstractTask)li.get(0);
		}
		return null;
	}
	
	@SuppressWarnings("unchecked")
	public List findTaskByUsername(String username){

		List li = getHibernateTemplate().find("FROM DMTask as c where c.username = ?", username);
		if(li != null && li.size() >= 1){
			return li;
		}
		return null;
	}
}
