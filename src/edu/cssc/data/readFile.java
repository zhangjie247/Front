
package edu.cssc.data;
import java.io.*;
import java.nio.charset.Charset;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
/**读取指定文件。
 * 
 * 
 * 
 */
@SuppressWarnings("serial")
public class readFile extends ActionSupport {
	private String filePath;
	private String fileContent ;
	
	public String getFilePath() {
		return filePath;
	}
	public String getFileContent() {
		return fileContent;
	}

	public void setFileContent(String fileContent) {
		this.fileContent = fileContent;
	}


	/**读取结果文件
	 * @return
	 */
	public String readOutputFile(){
		
		String filePath = (String)ActionContext.getContext().getSession().get("outputFilepath");
		ActionContext.getContext().getSession().remove("outputFilepath");
	    if(filePath == null || filePath.equals("")){
	    	return ERROR;
	    }
	    
		StringBuffer   buf=null;//the   intermediary,   mutable   buffer     
		BufferedReader   breader = null;//reader   for   the   template   files     
		try       
		{     
			breader = new BufferedReader(new InputStreamReader(new FileInputStream((filePath)),Charset.forName("utf-8")));  
			           
			buf   =   new   StringBuffer();     
			while(breader.ready())       
			     buf.append((char)breader.read());     
			     breader.close();     
		}//try     
		catch(Exception   e)       
		{     
			e.printStackTrace();  
			return ERROR;
		}//catch     
		
		fileContent = buf.toString(); 
	/*	fileContent = fileContent.replace('\u000A',"<br>");*/
		fileContent = fileContent.replace("\n\t", "<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
		
		ActionContext.getContext().getSession().put("fiFile", fileContent);
		return SUCCESS;
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		readFile rfFile = new readFile();
		//ActionContext.getContext().getSession().put("fiFile", rfFile);
		//System.out.println(rfFile.readOutputFile("C:\\formatter.log"));
		String filePath = "C:\\kmeans_result.result";
		System.out.println(rfFile.readOutputFile());
		System.out.println(rfFile.getFileContent());
	}

}
