package edu.cssc.util;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.Writer;
import java.util.ArrayList;
import java.util.List;

import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;
import org.dom4j.io.XMLWriter;

import edu.cssc.dm.service.DMTask;
import edu.cssc.dm.service.ParamDisc;

public class TaskUtil {

	/**获取算法参数描述信息
	 * @param specFile 算法配置xml文件路径
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static ParamDisc[] getParamDiscByType(String specFile){
		List<ParamDisc> pd = new ArrayList<ParamDisc>();
		ParamDisc paramDisc;
		
		SAXReader reader = new SAXReader();
		try{
			Document document = reader.read(new File(specFile));
			Element root = document.getRootElement();

			Element fileSet = (Element)root.element("file-set");
			List<Element> files = fileSet.elements("file");
			for(Element elem:files){
				paramDisc = new ParamDisc();
				paramDisc.setName(elem.attributeValue("name"));
				paramDisc.setType("file");
				paramDisc.setInOrOutput(elem.attributeValue("type"));
				paramDisc.setDirectory(elem.attributeValue("directory"));
				pd.add(paramDisc);
				paramDisc = null;
			}

			Element ParamSet = (Element)root.element("param-set");
			List<Element> params = ParamSet.elements("param");
			for(Element elem:params){
				paramDisc = new ParamDisc();
				paramDisc.setName(elem.attributeValue("name"));
				paramDisc.setType("param");
				paramDisc.setDefaultValue(elem.attributeValue("defaultValue"));
				paramDisc.setTip(elem.attributeValue("tip"));
				paramDisc.setRequired(elem.attributeValue("required"));
				pd.add(paramDisc);
				paramDisc = null;
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return pd.toArray(new ParamDisc[pd.size()]);
	}
	
	/**写任务xml配置文件
	 * @param task
	 * @return
	 */
	public static boolean task2XML(DMTask task){
		
		Document document = DocumentHelper.createDocument();
		document.addDocType("datamining", "", "/home/hadoop/data/alogrithm/datamining.dtd");
		Element xmlBody=document.addElement("datamining");   
		
		if(task.getTaskID() != null){
			Element taskID =xmlBody.addElement("taskID"); 
			taskID.setText(task.getTaskID());
		}
		if(task.getParam().getParamID() != null){
			Element paramID = xmlBody.addElement("paramID");
			paramID.setText(task.getParam().getParamID());
		}
		if(task.getUsername() != null){
			Element username =xmlBody.addElement("username"); 
			username.setText(task.getUsername());
		}
		
		ParamDisc[] paramDisc = task.getParam().getParamValueArray();
		
		//kmeans
			
			Element element;
			Element file_mapping = null;
			Element alogrithm = null;
			for(ParamDisc pd:paramDisc){
				if(pd.getType().equals("file")){
					if(file_mapping == null){
						file_mapping = xmlBody.addElement("file-mapping");
						file_mapping.addAttribute("lprefix", task.getParam().getLocalDirPrefix());
						file_mapping.addAttribute("hprefix", task.getParam().getHdfsDirPrefix());
					}
					element = file_mapping.addElement("file");
					element.addAttribute("name", pd.getName());
					element.addText(pd.getValue());
					element.addAttribute("type", pd.getInOrOutput());
					element.addAttribute("directory", pd.getDirectory());
					element = null;
				}else if(pd.getType().equals("param")){
					if(alogrithm == null){
						alogrithm = xmlBody.addElement("alogrithm");
						alogrithm.addAttribute("name", task.getMethod());
					}
					element = alogrithm.addElement("param");
					element.addAttribute("name", pd.getName());
					element.addText(pd.getValue());
					element = null;
				}
			}		
			
		try {   
			String path = task.getParam().getLocalDirPrefix() + "input/";
			String fileName = path + task.getUsername() + "_" + task.getMethod() + ".xml";
			Writer fileWriter=new FileWriter(fileName); 
			//Writer fileWriter=new FileWriter("f:\\test.xml");
			XMLWriter xmlWriter=new XMLWriter(fileWriter);   
			xmlWriter.write(document);   
			xmlWriter.close();   
			} 
		catch (IOException e) {   
				System.out.println(e.getMessage());   
			}   

		return true;
	}
}
