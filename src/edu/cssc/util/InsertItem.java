package edu.cssc.util;

import edu.cssc.util.HashUtil;

import org.hibernate.Session;
import org.hibernate.Transaction;

import edu.cssc.customer.service.Customer;
import edu.cssc.dm.service.DMTask;
import edu.cssc.dm.service.DMTaskDAOImpl;
import edu.cssc.dm.service.ParamFpgrowth;
import edu.cssc.dm.service.ParamKmeans;

/**作测试用途！直接向数据库表中插入数据。
 * @author zj
 *
 */
public class InsertItem{
	
	private Session session;
	private Transaction transaction;
	
	/**插入一个用户
	 * 
	 */
	public void InsertUser(){

		Customer customer = new Customer();
		customer.setUserName("yueli");
		customer.setPassword(HashUtil.encrypt("yueli", "md5"));
		customer.setAge(20);
		customer.setWorkGroup("administrator");
		customer.setEmail("yueli@hust.edu.cn");
		
		session = HibernateUtil.getSessionFactory().openSession();
		transaction = session.beginTransaction();
		
		session.save(customer);
		
		transaction.commit();
		session.close();
	}
	
	
	/**插入数据挖掘任务(仅作测试用途)
	 * 
	 */
	public void InsertDMTask(){
		ParamKmeans pk = new ParamKmeans();
		pk.setParamID("01327");
		pk.setInput_file("input/synthetic_control.data");
		pk.setHdfsDirPrefix("input/");
		pk.setOutput_result("output/whl20121028065436_kmeans_result");
		pk.setKmeans_clusterClientOutputFormat("text");
		pk.setKmeans_clustersIn("RandomSeedGenerator");
		pk.setKmeans_convergenceDelta("0.5");
		pk.setKmeans_distanceMeasure("EuclideanDistanceMeasure");
		
		DMTask task1 = new DMTask();
		task1.setTaskID("00001");
		task1.setParam(pk);
		
		ParamFpgrowth pf = new ParamFpgrowth();
		pf.setParamID("01331");
		
		DMTask task2 = new DMTask();
		task2.setTaskID("00002");
		task2.setParam(pf);
		
		session = HibernateUtil.getSessionFactory().openSession();
		transaction = session.beginTransaction();
		
		session.save(task1);
		session.save(task2);
		
		DMTask dmtask = (DMTask)session.get(DMTask.class, "qinsi20121031013332");
		try{
			ParamKmeans p2 = (ParamKmeans)dmtask.getParam();
			System.out.println(p2.getParamID());
		}catch(ClassCastException e){
			System.out.println("类型转换错误");
		}
		
		transaction.commit();
		session.close();
	}
	
	/**测试数据库读取task对象
	 * @param taskID
	 */
	public void findTask(String taskID){
		session = HibernateUtil.getSessionFactory().openSession();
		transaction = session.beginTransaction();
		
		/*DMTask dmtask = (DMTask)session.get(DMTask.class, taskID);

		System.out.println(dmtask.getParam().getLocalDirPrefix() + "   "
				+ dmtask.getOutput_result());*/
		DMTaskDAOImpl DMTaskDao = new DMTaskDAOImpl();
		DMTask task2 = (DMTask)DMTaskDao.findTaskByID(taskID);
		
		System.out.println(task2.getParam().getParamID());
		
		transaction.commit();
		session.close();
		
	}
	
	public static void main(String[] args){
		
		new InsertItem().findTask("qinsi20121031013332");
	}
}
