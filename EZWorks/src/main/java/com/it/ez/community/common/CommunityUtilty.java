package com.it.ez.community.common;

import javax.servlet.http.HttpServletRequest;

public class CommunityUtilty {
	public static String getFileInfo(String fileName, long fileSize,
			HttpServletRequest request) {
		String result="";
		if(fileName!=null && !fileName.isEmpty()) {
			double dFileSize = fileSize/1000.0;
			dFileSize = Math.round(dFileSize*10)/10.0;
			
			result="<span class=\"fa-fw select-all fas\"></span> ";
			result += fileName + " ("+dFileSize+"KB)";
		}
		return result;
	}
}
