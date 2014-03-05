package edu.cssc.data;

import java.util.Date;

/**文件属性描述类。
 * @author zj
 *
 */
public class FileDiscriptor {
	private String fileName;
	private String size;
	private Date lastModified;
	private String isDirectory;
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public Date getLastModified() {
		return lastModified;
	}
	public void setLastModified(Date lastModified) {
		this.lastModified = lastModified;
	}
	public void setIsDirectory(String isDirectory) {
		this.isDirectory = isDirectory;
	}
	public String getIsDirectory() {
		return isDirectory;
	}
	public String toString(){
		return fileName + " " 
		+ size + " "
		+ lastModified + " "
		+ isDirectory;
	}
}
