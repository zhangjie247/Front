package edu.cssc.task;

/**描述任务所支持的操作。
 * @author zj
 *
 */
public interface BaseTaskManager {

	/**列出指定用户的任务信息(若未指定用户，默认显示当前已登录用户任务信息)
	 * @return
	 * @throws Exception 
	 */
	public String list() throws Exception;
	
	/**显示给定ID的任务详细信息
	 * @return
	 * @throws Exception
	 */
	public String detail() throws Exception;
	
	/**显示已完成任务的输出结果
	 * @return
	 * @throws Exception
	 */
	public String result() throws Exception;
	
	/**停止选定任务
	 * @return
	 * @throws Exception
	 */
	public String stop() throws Exception;
	
	/**删除历史任务
	 * @return
	 * @throws Exception
	 */
	public String del() throws Exception;
}
