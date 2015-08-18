package com.distributor.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class HomeController extends BaseController{
	
	@RequestMapping("go")
	@ResponseBody
	public String go(){
		return "ok";
	}
	
	@RequestMapping("index")
	public String index(){
		return "index";
	}
	
}
