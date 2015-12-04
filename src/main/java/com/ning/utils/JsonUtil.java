package com.ning.utils;

import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.JavaType;
import org.codehaus.jackson.type.TypeReference;
import org.springframework.util.Assert;

import javax.servlet.http.HttpServletResponse;
import java.util.Calendar;
import java.util.Date;

public class JsonUtil {

	private static ObjectMapper mapper = new ObjectMapper();

	/**
	 * 将对象转换为JSON字符串
	 * 
	 * @param object
	 *            对象
	 */
	public static String toJson(Object object) {
		Assert.notNull(object);
		try {
			return mapper.writeValueAsString(object);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 将对象转换为JSON流
	 * 
	 * @param response
	 *            HttpServletResponse
	 * @param contentType
	 *            contentType
	 * @param object
	 *            对象
	 */
	public static void toJson(HttpServletResponse response, String contentType, Object value) {
		Assert.notNull(response);
		Assert.notNull(contentType);
		Assert.notNull(value);
		try {
			response.setContentType(contentType);
			mapper.writeValue(response.getWriter(), value);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 将对象转换为JSON流
	 * 
	 * @param response
	 *            HttpServletResponse
	 * @param object
	 *            对象
	 */
	public static void toJson(HttpServletResponse response, Object value) {
		Assert.notNull(response);
		Assert.notNull(value);
		try {
			// 修复繁体版输出json到页面问题, 请勿覆盖
			// mapper.writeValue(response.getWriter(), value);
            String content = mapper.writeValueAsString(value);
            response.getWriter().write(content);
            response.getWriter().flush();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 将JSON字符串转换为对象
	 * 
	 * @param json
	 *            JSON字符串
	 * @param valueType
	 *            对象类型
	 */
	public static <T> T toObject(String json, Class<T> valueType) {
		Assert.notNull(json);
		Assert.notNull(valueType);
		try {
			return mapper.readValue(json, valueType);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 将JSON字符串转换为对象
	 * 
	 * @param json
	 *            JSON字符串
	 * @param typeReference
	 *            对象类型
	 */
	public static <T> T toObject(String json, TypeReference<?> typeReference) {
		Assert.notNull(json);
		Assert.notNull(typeReference);
		try {
			return (T) mapper.readValue(json, typeReference);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 将JSON字符串转换为对象
	 * 
	 * @param json
	 *            JSON字符串
	 * @param javaType
	 *            对象类型
	 */
	public static <T> T toObject(String json, JavaType javaType) {
		Assert.notNull(json);
		Assert.notNull(javaType);
		try {
			return (T) mapper.readValue(json, javaType);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 
	 * 获取指定日期的下几天 返回类型为Date
	 * @param specifiedDay
	 * @param n
	 * @return
	 */
	public static Date getDateBySpecifyDayAfter(Date specifiedDay, int n) {
		Calendar c = Calendar.getInstance();
		c.setTime(specifiedDay);
		int day = c.get(Calendar.DATE);
		c.set(Calendar.DATE, day + n);
		return c.getTime();
	}

}