package edu.cssc.data;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.io.File;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**接收用户文件浏览请求，返回一个包含请求的文件地址及其操作的页面。
 * @author zj
 *
 */
@SuppressWarnings("serial")
public class Fexplorer extends ActionSupport{

	public static final String basePath = "/home/hadoop/data";
	private String currPath;
	private String path;
	private String act;
	private String pre;
	private String in_output;
	private List<FileDiscriptor> fileDisc;
	
	/**浏览文件目录。<br>
	 * currentBase变量维护用户当前的基础路径(例如当输入时，基础路径为/home/hadoop/data/admin/)，
	 * in_output变量维护input/output中间文件夹，客户端脚本维护当前路径(通过变量path输入)，形如pro002/，
	 * 三者相加为请求的绝对路径。
	 * @return
	 * @throws Exception
	 */
	public String exp() throws Exception{
		
		path = path==null? "":path;
		act = act==null? "f":act;
		pre = pre==null? "no":pre;
	
		//处理文件路径
		String currentBase = (String)ActionContext.getContext().getSession().get("currentBase");
		//区分input/output文件夹
		in_output = act.equals("o")? "output":"input";
		currentBase += in_output + "/";
		
		File dir = new File(currentBase + path);
		if(dir == null || ! dir.exists())
			return ERROR;
		
		
		/*返回上级目录*/
		if("yes".equals(pre)){
			/*访问越界保护*/
			if(! "".equals(path))
				dir = dir.getParentFile();
		}
		String absPath = dir.getAbsolutePath() + "/";
		currPath = absPath.substring(currentBase.length());	
		
		/*由于直接获取到的文件列表没有排序，这里将文件夹放在所有文件之前，同时文件和文件
		 * 夹按字母顺序排序。
		*/
		
		//存储文件夹和普通文件的list
		List<String> directoryList = new ArrayList<String>();
		List<String> fileList = new ArrayList<String>();
		//文件名和文件的hashMap
		Map<String, File> map= new HashMap<String, File>();
		
		//根据文件类型将文件名存入对应list
		File[] dirList = dir.listFiles();
		for(File item:dirList){
			if(item.isFile()){
				fileList.add(item.getName());
			}
			else{
				directoryList.add(item.getName());
			}	
			map.put(item.getName(), item);
		}
		//对文件和文件夹按名称排序
		Collections.sort(directoryList, String.CASE_INSENSITIVE_ORDER);
		Collections.sort(fileList, String.CASE_INSENSITIVE_ORDER);
			
		//最后将文件和文件夹描述信息添加到目录描述数组
		fileDisc = new ArrayList<FileDiscriptor>();
		File tempFile = null;
		for(String item:directoryList){
			tempFile = (File)map.get(item);
			FileDiscriptor fd = new FileDiscriptor();
			fd.setFileName(tempFile.getName());
			fd.setSize(Long.toString(tempFile.length()));
			fd.setIsDirectory("true");
			fd.setLastModified(new Date(tempFile.lastModified()));
			fileDisc.add(fd);
		}
		for(String item:fileList){
			tempFile = (File)map.get(item);
			FileDiscriptor fd = new FileDiscriptor();
			fd.setFileName(tempFile.getName());
			fd.setSize(Long.toString(tempFile.length()));
			fd.setIsDirectory("false");
			fd.setLastModified(new Date(tempFile.lastModified()));
			fileDisc.add(fd);
		}
		
		return SUCCESS;
	}

	//getters and setters
	public String getIn_output() {
		return in_output;
	}
	public String getCurrPath() {
		return currPath;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public String getAct() {
		return act;
	}
	public void setAct(String act) {
		this.act = act;
	}	
	public String getPre() {
		return pre;
	}
	public void setPre(String pre) {
		this.pre = pre;
	}	
	public List<FileDiscriptor> getFileDisc() {
		return fileDisc;
	}
	

}
