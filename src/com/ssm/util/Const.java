package com.ssm.util;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Const {
	public static String ROOT = "/campusHelp/";
	public static String ROOT_ADMIN = "/sys/admin";
	public static Integer PAGESIZE = 6;

	public static String getFullTime() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return sdf.format(new Date());
	}

	public static String getTime() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		return sdf.format(new Date());
	}
	public static String getIds() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		return sdf.format(new Date());
	}


}
