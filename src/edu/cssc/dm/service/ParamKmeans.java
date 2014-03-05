package edu.cssc.dm.service;

import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Map;

import edu.cssc.util.TaskUtil;

public class ParamKmeans extends BaseDMParam{
	
	public static final String kmeansSpecFile = "/home/hadoop/data/alogrithm/kmeans.xml";
	//public static final String kmeansSpecFile = "f:\\kmeans.xml";
	private static ParamDisc[] kmeansSpec;
		
	//算法参数
	private String kmeans_vectorClassName;
	private String kmeans_clustersIn;
	private String kmeans_distanceMeasure;
	private String kmeans_k;
	private String kmeans_convergenceDelta;
	private String kmeans_maxIterations;
	private String kmeans_overwrite;
	private String kmeans_runClustering;
	private String kmeans_runSequential;
	private String kmeans_clusterClientOutputFormat;
	
	
	/**返回包含参数描述信息的数组
	 * @return
	 */
	public static ParamDisc[] getParamSpec(){
		if(kmeansSpec != null){
			return kmeansSpec;
		}else{
			return TaskUtil.getParamDiscByType(kmeansSpecFile);
		}
	}
	
	/**返回包含参数描述信息和参数值得数组
	 * @return
	 */
	public ParamDisc[] getParamValueArray(){
		ParamDisc[] paramValueArray = ParamKmeans.getParamSpec().clone();
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
	
	/*@SuppressWarnings("unchecked")
	public Map getFileMap(){
		Map<String,String> map = new HashMap<String,String>();
		map.put("hdfsDirPrefix", hdfsDirPrefix);
		map.put("localDirPrefix", localDirPrefix);
		map.put("input_file", input_file);
		map.put("output_result", output_result);
		
		return map;
	}*/
	
	
	@SuppressWarnings("unchecked")
	public Map getParamMap(){
		Map<String,String> map = new HashMap<String,String>();
		
		map.put("kmeans_vectorClassName", kmeans_vectorClassName);
		map.put("kmeans_clustersIn", kmeans_clustersIn);
		map.put("kmeans_distanceMeasure", kmeans_distanceMeasure);
		map.put("kmeans_k", kmeans_k);
		map.put("kmeans_convergenceDelta", kmeans_convergenceDelta);
		map.put("kmeans_maxIterations", kmeans_maxIterations);
		map.put("kmeans_overwrite", kmeans_overwrite);
		map.put("kmeans_runClustering", kmeans_runClustering);
		map.put("kmeans_runSequential", kmeans_runSequential);
		map.put("kmeans_clusterClientOutputFormat", kmeans_clusterClientOutputFormat);
		
		return map;
	}
	
	public void processDir(DMTask task){
		
		this.setInput_file("input/" + this.getInput_file());
		
		String output_result = this.getOutput_result();
		output_result = (output_result==null)?"_fpgrowth_result":output_result;
		this.setOutput_result("output/" + task.getTaskID() + "_" + output_result);
	}
	

	public String getKmeans_vectorClassName() {
		return kmeans_vectorClassName;
	}

	public void setKmeans_vectorClassName(String kmeansVectorClassName) {
		kmeans_vectorClassName = kmeansVectorClassName;
	}

	public String getKmeans_clustersIn() {
		return kmeans_clustersIn;
	}

	public void setKmeans_clustersIn(String kmeansClustersIn) {
		kmeans_clustersIn = kmeansClustersIn;
	}

	public String getKmeans_distanceMeasure() {
		return kmeans_distanceMeasure;
	}

	public void setKmeans_distanceMeasure(String kmeansDistanceMeasure) {
		kmeans_distanceMeasure = kmeansDistanceMeasure;
	}

	public String getKmeans_k() {
		return kmeans_k;
	}

	public void setKmeans_k(String kmeansK) {
		kmeans_k = kmeansK;
	}

	public String getKmeans_convergenceDelta() {
		return kmeans_convergenceDelta;
	}

	public void setKmeans_convergenceDelta(String kmeansConvergenceDelta) {
		kmeans_convergenceDelta = kmeansConvergenceDelta;
	}

	public String getKmeans_maxIterations() {
		return kmeans_maxIterations;
	}

	public void setKmeans_maxIterations(String kmeansMaxIterations) {
		kmeans_maxIterations = kmeansMaxIterations;
	}

	public String getKmeans_overwrite() {
		return kmeans_overwrite;
	}

	public void setKmeans_overwrite(String kmeansOverwrite) {
		kmeans_overwrite = kmeansOverwrite;
	}

	public String getKmeans_runClustering() {
		return kmeans_runClustering;
	}

	public void setKmeans_runClustering(String kmeansRunClustering) {
		kmeans_runClustering = kmeansRunClustering;
	}

	public String getKmeans_runSequential() {
		return kmeans_runSequential;
	}

	public void setKmeans_runSequential(String kmeansRunSequential) {
		kmeans_runSequential = kmeansRunSequential;
	}

	public String getKmeans_clusterClientOutputFormat() {
		return kmeans_clusterClientOutputFormat;
	}

	public void setKmeans_clusterClientOutputFormat(
			String kmeansClusterClientOutputFormat) {
		kmeans_clusterClientOutputFormat = kmeansClusterClientOutputFormat;
	}




}
