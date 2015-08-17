package com.distributor.controller;

import java.util.HashMap;
import java.util.Map;

public class BaseController {
	
	public Map<String, Object> success(){
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("success", true);
		return result;
	}
	
	public Map<String,Object> success(Object obj){
		Map<String, Object> result = success();
		if (result != null){
			result.put("content", obj);
		}
		return result;
	}
	
	public Map<String, Object> fail(){
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("success", false);
		return result;
	}
	
	public Map<String, Object> fail(Object obj){
		Map<String, Object> result = fail();
		result.put("content", obj);
		return result;
	}
	
}
