package edu.cssc.util;

import java.security.MessageDigest;

public class HashUtil {

	/**加密函数
	 * @param inputText
	 * @param algorithmName
	 * @return
	 */
	public static String encrypt(String inputText, String algorithmName) {  
        if (inputText == null || "".equals(inputText.trim())) {  
            throw new IllegalArgumentException("请输入要加密的内容");  
        }  
        if (algorithmName == null || "".equals(algorithmName.trim())) {  
            algorithmName = "md5";  
        }  
        String encryptText = null;  
        try {  
            MessageDigest m = MessageDigest.getInstance(algorithmName);  
            m.update(inputText.getBytes("UTF8"));  
            byte s[] = m.digest();  
            //m.digest(inputText.getBytes("UTF8"));  
            return hex(s);  
        } catch (Exception e) {  
            e.printStackTrace();  
        } 
        return encryptText;  
    }  
	
	public static String hex(byte[] arr) {  
        StringBuffer sb = new StringBuffer();  
        for (int i = 0; i < arr.length; ++i) {  
            sb.append(Integer.toHexString((arr[i] & 0xFF) | 0x100).substring(1,  
                    3));  
        }  
        return sb.toString();  
    }  
	
}
