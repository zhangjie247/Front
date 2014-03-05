package edu.cssc.customer.service;

/**用户对象ORM(object/Relation Mapping)接口
 * @author zj
 *
 */
public interface CustomerDAO {

	/**根据用户名查找一个用户
	 * @param username
	 * @return
	 */
	public Customer findUser(String username);
	
	/**保存或修改一个用户
	 * @param customer
	 */
	public void saveOrUpdateUser(Customer customer);
}
