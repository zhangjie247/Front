package edu.cssc.util;
import org.hibernate.cfg.Configuration;
import org.hibernate.tool.hbm2ddl.SchemaExport;

/**根据hibernate配置文件创建空表。注意，会清空所有已存在的表！
 * @author zj
 *
 */
public class CreatDB {
	public static void main(String[] args){
		Configuration cfg = new Configuration().configure();
		SchemaExport sExport = new SchemaExport(cfg);
	
		sExport.create(true, true);
	}
}
