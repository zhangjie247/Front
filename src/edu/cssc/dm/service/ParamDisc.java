package edu.cssc.dm.service;

/**数据挖掘算法中对参数的描述，例如该参数的名称、是否必须和默认值等。
 * @author zj
 *
 */
public class ParamDisc {

	private String name;
	private String defaultValue;
	private String tip;
	private String required;
	private String type;
	private String inOrOutput;
	private String directory;
	private String value;
	
	public String getRequired() {
		return required;
	}
	public void setRequired(String required) {
		this.required = required;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDefaultValue() {
		return defaultValue;
	}
	public void setDefaultValue(String defaultValue) {
		this.defaultValue = defaultValue;
	}
	public String getTip() {
		return tip;
	}
	public void setTip(String tip) {
		this.tip = tip;
	}

	public String toString(){
		return "name: " + name 
			+ " defaultValue: " + defaultValue
			+ " tip: " + tip
			+ " required: " + required;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getType() {
		return type;
	}
	public void setInOrOutput(String inOrOutput) {
		this.inOrOutput = inOrOutput;
	}
	public String getInOrOutput() {
		return inOrOutput;
	}
	public void setValue(String value) {
		this.value = value;
	}
	public String getValue() {
		return value;
	}
	public void setDirectory(String directory) {
		this.directory = directory;
	}
	public String getDirectory() {
		return directory;
	}
}
