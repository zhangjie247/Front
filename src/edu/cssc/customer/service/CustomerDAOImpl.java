package edu.cssc.customer.service;
import java.util.List;


import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**CustomerDAO的一个实现。
 * @author zj
 *
 */
public class CustomerDAOImpl extends HibernateDaoSupport implements CustomerDAO{

	@SuppressWarnings("unchecked")
	public Customer findUser(String username){
		List li = getHibernateTemplate().find("FROM Customer as c where c.userName = ?", username);
		if(li != null && li.size() >= 1){
			return (Customer)li.get(0);
		}
		return null;
		
	}
	
	
	public void saveOrUpdateUser(Customer customer){
		getHibernateTemplate().saveOrUpdate(customer);
	}

}
