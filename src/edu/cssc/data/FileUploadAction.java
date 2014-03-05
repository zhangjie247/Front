/**
* 文件名：FileUploadAction.java
*
* 版本信息：
* 日期：2012-5-14
* Copyright 华中科技大学通软中心 Corporation 2012 
* 版权所有
*
*/
package edu.cssc.data;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import com.davidjc.ajaxfileupload.multipart.ProgressMonitor;

import com.opensymphony.xwork2.ActionContext;


/**处理文件上传请求。
 * @author zj
 *
 */
public class FileUploadAction extends BaseAction {
    private static final long serialVersionUID = 572146812454l ;
    private static final int BUFFER_SIZE = 16 * 1024 ;
   
    private File myFile;
    private String contentType;
    private String fileName;
    private String imageFileName;
   
    public void setMyFileContentType(String contentType) {
        this .contentType = contentType;
   }
   
    public void setMyFileFileName(String fileName) {
        this .fileName = fileName;
   }
       
    public void setMyFile(File myFile) {
        this .myFile = myFile;
   }
   
    public String getImageFileName() {
        return imageFileName;
   }
   
    private static void copy(File src, File dst) {
        try {
           InputStream in = null ;
           OutputStream out = null ;
            try {                
               in = new BufferedInputStream( new FileInputStream(src), BUFFER_SIZE);
               out = new BufferedOutputStream( new FileOutputStream(dst), BUFFER_SIZE);
                byte [] buffer = new byte [BUFFER_SIZE];
                while (in.read(buffer) > 0 ) {
                   out.write(buffer);
               }
           } finally {
                if ( null != in) {
                   in.close();
               }
                if ( null != out) {
                   out.close();
               }
           }
       } catch (Exception e) {
           e.printStackTrace();
       }
   }
   
    private static String getExtention(String fileName) {
        int pos = fileName.lastIndexOf(".");
        return fileName.substring(pos);
   }
    /**
     * 上传文件
     * @return
     */
    public String fileUpload()     {
    	
    	sessionMap.remove("com.davidjc.ajaxfileupload.multipart.ProgressMonitor");
	   if(fileName == null){
		   return "fail";
	   }
	   
	   imageFileName = (String)sessionMap.get("currentBase") + "input/" + fileName;

       try{
    	   File imageFile = new File(imageFileName);
    	   if(! imageFile.exists()){
    		   myFile.renameTo(imageFile);
    	   }
    	   //System.out.println("{success:true,msg:'上传文件成功!'}");
           //response.getWriter().write("{\"success\":true,\"msg\":\"success\"}");
           //response.getWriter().flush();
       }catch (Exception ex){
    	   return ERROR;
       }
      
       return SUCCESS;
   }
   
   /**
	 * 上传进程控制
	 * @return
	 * @throws Exception 
	 */
	public String processController() throws Exception{
		
		double d = 0.00;
		//从session取出uploadPercentage
//		Object mon_obj = this.sessionMap.get("com.davidjc.ajaxfileupload.multipart.ProgressMonitor");
		Object mon_obj = ActionContext.getContext().getSession().get("com.davidjc.ajaxfileupload.multipart.ProgressMonitor");
		
		if (mon_obj != null) {
		      ProgressMonitor monitor = (ProgressMonitor)mon_obj;
		      d = ((double)monitor.getBytesRead()/(double)monitor.getBytesLength());
		  }
			System.out.println("******    "+Math.round(d * 100)+"     ********");
	    if(d<1){
	    //d<0
	        response.getWriter().write(Math.round(d * 100) +"");
	    }
	    else if(d>=1){
	        
	        this.sessionMap.remove("com.davidjc.ajaxfileupload.multipart.ProgressMonitor");
	        
	        response.getWriter().write("100");
	    }
	    response.getWriter().flush();

		return NONE;
	}
   
}
