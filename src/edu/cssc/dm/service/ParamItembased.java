package edu.cssc.dm.service;

import java.lang.reflect.Method;

import edu.cssc.util.TaskUtil;

public class ParamItembased extends BaseDMParam{
	
	public static final String itembasedSpecFile = "/home/hadoop/data/alogrithm/itembased.xml";
	//public static final String itembasedSpecFile = "f:\\itembased.xml";
	private static ParamDisc[] itembasedSpec;
	

	//算法特定文件
	private String itembased_usersFile;
	private String itembased_itemsFile;
	private String itembased_filterFile;

	//算法参数
	private String itembased_similarityClassname;
	private String itembased_booleanData;
	private String itembased_numRecommendations;
	private String itembased_maxPrefsPerUser;
	private String itembased_maxSimilaritiesPerItem;
	private String itembased_minPrefsPerUser;
	private String itembased_maxPrefsPerUserInItemSimilarity;
	private String itembased_threshold;
	
	/**返回包含参数描述信息的数组
	 * @return
	 */
	public static ParamDisc[] getParamSpec(){
		if(itembasedSpec != null){
			return itembasedSpec;
		}else{
			return TaskUtil.getParamDiscByType(itembasedSpecFile);
		}
	}
	
	/**返回包含参数描述信息和参数值得数组
	 * @return
	 */
	public ParamDisc[] getParamValueArray(){
		ParamDisc[] paramValueArray = ParamItembased.getParamSpec().clone();
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
		output_result = (output_result==null)?"_itembased_result":output_result;
		this.setOutput_result("output/" + task.getTaskID() + "_" + output_result);
		
		this.itembased_usersFile = "input/" + itembased_usersFile;
		this.itembased_itemsFile = "input/" + itembased_itemsFile;
		this.itembased_filterFile = "input/" + itembased_filterFile;
		
	}
	


	public String getItembased_usersFile() {
		return itembased_usersFile;
	}


	public void setItembased_usersFile(String itembasedUsersFile) {
		itembased_usersFile = itembasedUsersFile;
	}


	public String getItembased_itemsFile() {
		return itembased_itemsFile;
	}


	public void setItembased_itemsFile(String itembasedItemsFile) {
		itembased_itemsFile = itembasedItemsFile;
	}


	public String getItembased_filterFile() {
		return itembased_filterFile;
	}


	public void setItembased_filterFile(String itembasedFilterFile) {
		itembased_filterFile = itembasedFilterFile;
	}



	public String getItembased_similarityClassname() {
		return itembased_similarityClassname;
	}


	public void setItembased_similarityClassname(String itembasedSimilarityClassname) {
		itembased_similarityClassname = itembasedSimilarityClassname;
	}


	public String getItembased_booleanData() {
		return itembased_booleanData;
	}


	public void setItembased_booleanData(String itembasedBooleanData) {
		itembased_booleanData = itembasedBooleanData;
	}


	public String getItembased_numRecommendations() {
		return itembased_numRecommendations;
	}


	public void setItembased_numRecommendations(String itembasedNumRecommendations) {
		itembased_numRecommendations = itembasedNumRecommendations;
	}


	public String getItembased_maxPrefsPerUser() {
		return itembased_maxPrefsPerUser;
	}


	public void setItembased_maxPrefsPerUser(String itembasedMaxPrefsPerUser) {
		itembased_maxPrefsPerUser = itembasedMaxPrefsPerUser;
	}


	public String getItembased_maxSimilaritiesPerItem() {
		return itembased_maxSimilaritiesPerItem;
	}


	public void setItembased_maxSimilaritiesPerItem(
			String itembasedMaxSimilaritiesPerItem) {
		itembased_maxSimilaritiesPerItem = itembasedMaxSimilaritiesPerItem;
	}


	public String getItembased_minPrefsPerUser() {
		return itembased_minPrefsPerUser;
	}


	public void setItembased_minPrefsPerUser(String itembasedMinPrefsPerUser) {
		itembased_minPrefsPerUser = itembasedMinPrefsPerUser;
	}


	public String getItembased_maxPrefsPerUserInItemSimilarity() {
		return itembased_maxPrefsPerUserInItemSimilarity;
	}


	public void setItembased_maxPrefsPerUserInItemSimilarity(
			String itembasedMaxPrefsPerUserInItemSimilarity) {
		itembased_maxPrefsPerUserInItemSimilarity = itembasedMaxPrefsPerUserInItemSimilarity;
	}


	public String getItembased_threshold() {
		return itembased_threshold;
	}


	public void setItembased_threshold(String itembasedThreshold) {
		itembased_threshold = itembasedThreshold;
	}


}
