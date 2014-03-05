package edu.cssc.data;

import java.io.File;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ActionContext;

/**处理用户通过ajax请求的一些文件操作，例如文件重命名和删除等。
 * @author zj
 *
 */
@SuppressWarnings("serial")
public class AjaxAction extends ActionSupport {

	private String path;
	private String act;
	private String newName;
	private String targetPath;
	private String rnd;
	
	private String json = null;

	public void setRnd(String rnd) {
		this.rnd = rnd;
	}

	public void setTargetPath(String targetPath) {
		this.targetPath = targetPath;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public void setAct(String act) {
		this.act = act;
	}

	public void setNewName(String newName) {
		this.newName = newName;
	}

	/**
	 * 客户端文件操作AJAX响应action：重命名、删除操作
	 * 
	 * @return
	 * @throws Exception
	 */
	public void han() throws Exception {
		
		String currentBase = (String) ActionContext.getContext().getSession().get("currentBase") + "input/";
		path = currentBase + path;
		File dir = new File(path);
		
		if ("han.rename".equals(act)) {

			String filePath = path.substring(0, path.lastIndexOf("/") + 1);
			filePath = filePath.concat(newName);
			
			if(dir.renameTo(new File(filePath)))
				json = "{\"msg\": \"success\",\"success\":true}";
			else{
				json = "{\"msg\": \"重命名失败！\",\"success\":false}";
			}

		} else if ("han.del".equals(act)) {
			if(deleteFile(dir))
				json = "{\"msg\": \"success\",\"success\":true}";
			else
				json = "{\"msg\": \"删除失败！\",\"success\":false}";
		}
		
		writeJSON(json);
	}

	/**
	 * 创建新文件夹
	 * 
	 * @return
	 * @throws Exception
	 */
	public void mk() throws Exception {

		String currentBase = (String) ActionContext.getContext().getSession().get("currentBase") + "input/";
		path = currentBase + path;

		File dir = new File(path + newName);
		if ("han.mkdir".equals(act)) {
			if (!dir.exists()) {
				if (!dir.mkdir())
					json = "{\"msg\": \"创建文件夹失败！\",\"success\":false}";
				else
					json = "{\"msg\": \"success\",\"success\":true}";
			}else
				json = "{\"msg\": \"文件夹已经存在！\",\"success\":false}";
		}
		
		writeJSON(json);
	}

	/**
	 * 文件和文件夹移动操作
	 * 
	 * @return
	 * @throws Exception
	 */
	public void move() throws Exception {

		String currentBase = (String) ActionContext.getContext().getSession().get("currentBase") + "input/";
		// 截取文件名
		String fileName = path.substring(path.lastIndexOf("/") + 1);
		path = currentBase + path;
		File dir = new File(path);

		if (!targetPath.endsWith("/"))
			targetPath += "/";
		if (!dir.renameTo(new File(currentBase + targetPath + fileName)))
			json = "{\"msg\": \"移动文件夹失败！\",\"success\":false}";
		else
			json = "{\"msg\": \"success\",\"success\":true}";

		writeJSON(json);
	}

	/**
	 * 文件解压
	 * 
	 * @return
	 * @throws Exception
	 */
	public void unp() throws Exception {
		json = "{\"msg\": \"success\",\"success\":true}";
		writeJSON(json);
	}

	/**函数：删除指定文件夹或文件
	 * @param file
	 * @return
	 */
	private boolean deleteFile(File file) {
		if (file.exists()) {
			if (file.isFile()) {
				file.delete();
			} else if (file.isDirectory()) {
				File files[] = file.listFiles();
				for (int i = 0; i < files.length; i++) {
					this.deleteFile(files[i]);
				}
				file.delete();
			}
			
		}else{
			return false;
		}
		return true;
	}
	
	/**返回JSON消息给客户端
	 * @param info
	 * @param response
	 */
	private void writeJSON(String info) {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("application/json; charset=utf-8"); 
		try {
		PrintWriter out = response.getWriter();
		out.write(info);
		out.close();
		} catch (Exception e) {
		e.printStackTrace();
		}
	}
}
