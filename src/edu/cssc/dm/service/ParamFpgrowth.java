package edu.cssc.dm.service;

import java.lang.reflect.Method;

import edu.cssc.util.TaskUtil;

/**Fpgrowth算法的参数类。
 * @author zj
 *
 */
public class ParamFpgrowth extends BaseDMParam{
	
	public static final String fpgrowthSpecFile = "/home/hadoop/data/alogrithm/fpgrowth.xml";
	//public static final String fpgrowthSpecFile = "f:\\fpgrowth.xml";
	private static ParamDisc[] fpgrowthSpec;
	
	//算法 参数
	private String fpgrowth_minSupport;
	private String fpgrowth_maxHeapSize;
	private String fpgrowth_numGroups;
	private String fpgrowth_splitterPattern;
	private String fpgrowth_numTreeCacheEntries;
	private String fpgrowth_method;
	private String fpgrowth_encoding;
	private String fpgrowth_useFP2;
	private String fpgrowth_seqFile;
	
	/**返回包含参数描述信息的数组
	 * @return
	 */
	public static ParamDisc[] getParamSpec(){
		if(fpgrowthSpec != null){
			return fpgrowthSpec;
		}else{
			return TaskUtil.getParamDiscByType(fpgrowthSpecFile);
		}
	}
	
	/**返回包含参数描述信息和参数值得数组
	 * @return
	 */
	public ParamDisc[] getParamValueArray(){
		ParamDisc[] paramValueArray = ParamFpgrowth.getParamSpec().clone();
		try{
			Class<?> cls = this.getClass();
			Method method = null;
			for(ParamDisc pd:paramValueArray){
				String field = pd.getName();
				field = field.replaceFirst(field.substring(0,1),field.substring(0,1).toUpperCase());
				method = cls.getMethod("get" + field);
				pd.setValue((String)method.invoke(this));
				method = null;
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return paramValueArray;
	}

	
	public void processDir(DMTask task){
		this.setInput_file("input/" + this.getInput_file());
		
		String output_result = this.getOutput_result();
		output_result = (output_result==null)?"_fpgrowth_result":output_result;
		this.setOutput_result("output/" + task.getTaskID() + "_" + output_result);
		
		fpgrowth_seqFile = this.getHdfsDirPrefix() + "/frequentpatterns/part-r-00000";
	}
	
	public String getFpgrowth_minSupport() {
		return fpgrowth_minSupport;
	}

	public void setFpgrowth_minSupport(String fpgrowthMinSupport) {
		fpgrowth_minSupport = fpgrowthMinSupport;
	}

	public String getFpgrowth_maxHeapSize() {
		return fpgrowth_maxHeapSize;
	}

	public void setFpgrowth_maxHeapSize(String fpgrowthMaxHeapSize) {
		fpgrowth_maxHeapSize = fpgrowthMaxHeapSize;
	}

	public String getFpgrowth_numGroups() {
		return fpgrowth_numGroups;
	}

	public void setFpgrowth_numGroups(String fpgrowthNumGroups) {
		fpgrowth_numGroups = fpgrowthNumGroups;
	}

	public String getFpgrowth_splitterPattern() {
		return fpgrowth_splitterPattern;
	}

	public void setFpgrowth_splitterPattern(String fpgrowthSplitterPattern) {
		fpgrowth_splitterPattern = fpgrowthSplitterPattern;
	}

	public String getFpgrowth_numTreeCacheEntries() {
		return fpgrowth_numTreeCacheEntries;
	}

	public void setFpgrowth_numTreeCacheEntries(String fpgrowthNumTreeCacheEntries) {
		fpgrowth_numTreeCacheEntries = fpgrowthNumTreeCacheEntries;
	}

	public String getFpgrowth_method() {
		return fpgrowth_method;
	}

	public void setFpgrowth_method(String fpgrowthMethod) {
		fpgrowth_method = fpgrowthMethod;
	}

	public String getFpgrowth_encoding() {
		return fpgrowth_encoding;
	}

	public void setFpgrowth_encoding(String fpgrowthEncoding) {
		fpgrowth_encoding = fpgrowthEncoding;
	}

	public String getFpgrowth_useFP2() {
		return fpgrowth_useFP2;
	}

	public void setFpgrowth_useFP2(String fpgrowthUseFP2) {
		fpgrowth_useFP2 = fpgrowthUseFP2;
	}

	public String getFpgrowth_seqFile() {
		return fpgrowth_seqFile;
	}

	public void setFpgrowth_seqFile(String fpgrowthSeqFile) {
		fpgrowth_seqFile = fpgrowthSeqFile;
	}

}
