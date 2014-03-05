package edu.cssc.dm.service;


/**封装基本数据挖掘参数，所有的特定数据挖掘算法的参数类都需要继承该类。
 * @author zj
 *
 */
public  class BaseDMParam {
	
	private String paramID;  //参数集ID
	
	private DMTask DMTask;   //参数集对应的数据挖掘任务

	//算法需要用到的本地以及HDFS文件参数
	private String hdfsDirPrefix;
	private String localDirPrefix;
	private String input_file;
	private String output_result;
	
	/**返回包含参数描述信息和参数值得数组
	 * @return
	 */
	public ParamDisc[] getParamValueArray(){
		return null;
	}

	/**处理算法文件目录参数
	 * @param task
	 */
	public void processDir(DMTask task){
	}

	public void setParamID(String paramID) {
		this.paramID = paramID;
	}


	public String getParamID() {
		return paramID;
	}
	public String getHdfsDirPrefix() {
		return hdfsDirPrefix;
	}


	public void setHdfsDirPrefix(String hdfsDirPrefix) {
		this.hdfsDirPrefix = hdfsDirPrefix;
	}


	public String getLocalDirPrefix() {
		return localDirPrefix;
	}


	public void setLocalDirPrefix(String localDirPrefix) {
		this.localDirPrefix = localDirPrefix;
	}


	public String getInput_file() {
		return input_file;
	}


	public void setInput_file(String inputFile) {
		input_file = inputFile;
	}


	public String getOutput_result() {
		return output_result;
	}


	public void setOutput_result(String outputResult) {
		output_result = outputResult;
	}

	public void setDMTask(DMTask dMTask) {
		DMTask = dMTask;
	}

	public DMTask getDMTask() {
		return DMTask;
	}


	
	
	
}
