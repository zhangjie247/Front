package edu.cssc.dm.service;

import java.io.InputStreamReader;
import java.io.LineNumberReader;


/**启动线程，执行数据挖掘任务。
 * @author zj
 *
 */
public class MiningThread extends Thread{
	
	/**Hadoop命令行脚本路径
	 * 
	 */
	public static final String hadoopDir = "/home/hadoop/HadoopInstall/hadoop/bin/hadoop"; 
	
	private String jarDir;
	private String username;
	private String method;
	
	public MiningThread(DMTask task){
		jarDir= "/home/hadoop/madoop/Madoop_1030_001_whl.jar";
		username = task.getUsername();
		method = task.getMethod();
	}
	
	public void run(){
		try{
			//调用hadoop脚本，将文件拷贝到分布式文件系统
			/*ParamDisc[] paramDisc = task.getParam().getParamValueArray();
			Process process;
			for(ParamDisc pd:paramDisc){
				if(pd.getType().equals("file") && pd.getInOrOutput().equals("input")){
					String ldir = task.getParam().getLocalDirPrefix() + pd.getValue();
					String hdir = task.getParam().getHdfsDirPrefix() + pd.getValue();
					process = Runtime.getRuntime().exec(hadoopDir + " dfs -put " + ldir + " " + hdir);
					process.waitFor();
					process = null;
				}
			}*/
		
		
			//调用hadoop脚本，运行mahout程序
			Process process_mh = Runtime.getRuntime().exec(hadoopDir + " jar " + jarDir + " " + username + " " + method);
			InputStreamReader ir_mh = new InputStreamReader(process_mh.getInputStream());
			LineNumberReader input_mh = new LineNumberReader(ir_mh);
			String line_mh;
			while ((line_mh = input_mh.readLine()) != null)
			input_mh.close();
			ir_mh.close();

		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
}
