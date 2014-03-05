package edu.cssc.dm;

import java.text.SimpleDateFormat;
import java.util.Date;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import edu.cssc.data.Fexplorer;
import edu.cssc.dm.service.DMTask;
import edu.cssc.dm.service.ParamDisc;
import edu.cssc.dm.service.ParamFpgrowth;
import edu.cssc.dm.service.ParamItembased;
import edu.cssc.dm.service.ParamKmeans;

/**添加数据挖掘任务处理类<br>
 * addDMTask: 跳转到数据挖掘任务提交界面
 * processDMParam: 接受并处理提交的参数
 * @author zj
 *
 */
@SuppressWarnings("serial")
public class AddDMTask extends ActionSupport{
	
	private String username;

	//数据挖掘参数	
	private DMTask task;
	private ParamKmeans paramKmeans;
	private ParamFpgrowth paramFpgrowth;
	private ParamItembased paramItembased;
	
	
	/**判断并跳转到添加参数页面
	 * @return
	 * @throws Exception
	 */
	public String addDMTask() throws Exception{
		return SUCCESS;
	}

	/**接受并处理提交的参数
	 * @return
	 * @throws Exception
	 */
	public String processDMParam() throws Exception{
		if(task.getMethod().equals("kmeans")){
			task.setParam(paramKmeans);
		}else if(task.getMethod().equals("fpgrowth")){
			task.setParam(paramFpgrowth);
		}else if(task.getMethod().equals("itembased")){
			task.setParam(paramItembased);
		}else{
			return ERROR;
		}
		
		//日期
		Date date = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
		String dateStr = dateFormat.format(date);
		String longdateStr = Long.toString(date.getTime());
		
		username = (String)ActionContext.getContext().getSession().get("loginUser");
		
		//task参数
		task.setTaskID(username + dateStr);
		task.setAddingDate(longdateStr);
		task.setFinishDate("");
		task.setFee(0);
		task.setStatus("submit");
		task.setUsername(username);
		
		//Local dir prefix
		task.getParam().setLocalDirPrefix(Fexplorer.basePath + "/" + username + "/");
		
		//HDFS dir prefix
		task.getParam().setHdfsDirPrefix(username + "/");
		
		//处理数据挖掘算法参数
		task.getParam().processDir(task);
		
		task.prepareID();
		
		//task存入session
		ActionContext.getContext().getSession().put("task", task);
		
		return SUCCESS;
	}
	

	public String getUsername() {
		return username;
	}

	public DMTask getTask() {
		return task;
	}

	public void setTask(DMTask task) {
		this.task = task;
	}

	public ParamKmeans getParamKmeans() {
		return paramKmeans;
	}

	public void setParamKmeans(ParamKmeans paramKmeans) {
		this.paramKmeans = paramKmeans;
	}

	public ParamFpgrowth getParamFpgrowth() {
		return paramFpgrowth;
	}

	public void setParamFpgrowth(ParamFpgrowth paramFpgrowth) {
		this.paramFpgrowth = paramFpgrowth;
	}

	public ParamItembased getParamItembased() {
		return paramItembased;
	}

	public void setParamItembased(ParamItembased paramItembased) {
		this.paramItembased = paramItembased;
	}

	public ParamDisc[] getKmeansDisc(){
		return ParamKmeans.getParamSpec();		
	}
	
	public ParamDisc[] getFpgrowthDisc(){
		return ParamFpgrowth.getParamSpec();
	}
	
	public ParamDisc[] getItembasedDisc(){
		return ParamItembased.getParamSpec();
	}
	
	
}
