package com.distributor.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.distributor.mapper.SystemLogMapper;
import com.distributor.mapper.UserMapper;
import com.distributor.model.SystemLog;
import com.distributor.model.User;
import com.distributor.utils.ConstantVariable;
import com.distributor.utils.IdGenerator;

@Controller
public class UserController extends BaseController{
	@Autowired
	UserMapper userMapper;
	@Autowired
	SystemLogMapper systemLogMapper;
	
	/**
	 * 登陆跳转
	 * @param userName
	 * @param password
	 * @return
	 */
	@RequestMapping("dashboard")
	public String login(@RequestParam("userName") String userName,
			@RequestParam("password") String password){
		try {
			if (Pattern.compile("^[-\\+]?[\\d]*$").matcher(userName).matches()){
				
			} else {
				Map<String, Object> param = new HashMap<String, Object>();
				param.put("name", userName);
				User user = userMapper.selectUserSelective(param);
				if(user != null && user.getPassword() != null && user.getPassword().equals(password)){
					return "index";
				}
				else{
					return "login";
				}
			}
			return "index";
		} catch (Exception e) {
			e.printStackTrace();
			return "login";
		}
	}
	
	/**
	 * 新用户注册
	 * @param userName
	 * @param password
	 * @return
	 */
	@RequestMapping("register")
	public String register(
			@RequestParam("username") String userName,
			@RequestParam("mobile") String mobile,
			@RequestParam("password") String password,
			@RequestParam("passwordconfirm") String passwordconfirm,
			@RequestParam("role") int role){
		try {
			if(password != null && password.equals(passwordconfirm)){
				User user = new User();
				user.setId(IdGenerator.getInstance().nextId());
				user.setMobile(mobile);
				user.setRole(role);
				user.setName(userName);
				user.setPassword(password);
				user.setStatus(1);
				userMapper.insert(user);
				return "login";
			}
			return "register";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
	
	public String logout(){
		return "login";
	}
	
	/**
	 * 列出全部系统用户 
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/users/list/{page}", method=RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> listUsers(@PathVariable("page") int page){
		try {
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("pageSize", ConstantVariable.Pagesize);
			param.put("offset", ConstantVariable.Pagesize * page);
			List<User> users = userMapper.selectAllUsers(param);
			int total = userMapper.getCountAll();

			Map<String, Object> result = success(users);
			result.put("total", total);
			return result;
		} catch (Exception e) {
			e.printStackTrace();
			return fail();
		}
	}
	
	//注册用户清单
	@RequestMapping(value="/users/list/regitser", method=RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> listregisterUsers(){
		try {
			List<User> users = userMapper.selectRegisterUsers();
			return success(users);
		} catch (Exception e) {
			return fail();
		}
	}
	
	//审核通过
	@RequestMapping(value="/users/allow/{id}", method=RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> allowUser(@PathVariable("id") Long id){
		try {
			userMapper.allowRegisterUser(id);
			return success();
		} catch (Exception e) {
			e.printStackTrace();
			return fail();
		}
	}
	
	//审核拒绝
	@RequestMapping(value="/users/reject/{id}", method=RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> rejectUser(@PathVariable("id") Long id){
		try {
			userMapper.rejectRegisterUser(id);
			return success();
		} catch (Exception e) {
			e.printStackTrace();
			return fail();
		}
	}
	
	/**
	 * 获取系统日志
	 * @param page
	 * @return
	 */
	@RequestMapping("log/{page}")
	@ResponseBody
	public Map<String, Object> getLogList(@PathVariable("page") int page){
		try {
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("pageSize", ConstantVariable.Pagesize);
			param.put("offset", ConstantVariable.Pagesize * page);
			List<SystemLog> logs = systemLogMapper.selectAllLogs(param);
			int total = systemLogMapper.getAllLogsCount();
			
			Map<String, Object> result = success(logs);
			result.put("total", total);
			return result;
		} catch (Exception e) {
			e.printStackTrace();
			return fail();
		}
	}
}