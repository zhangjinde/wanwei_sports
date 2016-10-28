package com.park.common.constant;

import com.park.common.util.CustomizedPropertyConfigurer;


/*
 * 自定义常量
 */
public interface IPlatformConstant {
	
	public static final String SUCCESS_CODE = "1";
	
	public static final String SUCCESS_MESSAGE = "操作成功";
	
	public static final String FAIL_CODE = "-1";
	
	public static final String FAIL_MESSAGE = "操作失败";
	
	public static final String REQUEST_JSON = "request_json";
	
	public final String time00 = " 00:00:00";
	
    public final String time24 = " 23:59:59";
    
    public final String LOGIN_USER = "loginUser";
	
	public static final String APP_ID = (String) CustomizedPropertyConfigurer.getContextProperty("app_id"); //appid
	
	public static final String APP_SECRET = (String) CustomizedPropertyConfigurer.getContextProperty("appsecret"); //密钥
	
}