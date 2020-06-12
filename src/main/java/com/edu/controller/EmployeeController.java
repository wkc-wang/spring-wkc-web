package com.edu.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.edu.bean.Employee;
import com.edu.bean.Message;
import com.edu.service.EmployeeService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping(value="/emp")
public class EmployeeController {
	final static Logger logger = LoggerFactory.getLogger(EmployeeController.class);
	@Autowired
	private EmployeeService employeeService;
	
//	@RequestMapping(value="/list",method=RequestMethod.GET)
//	public String list(@RequestParam(name="pg",defaultValue="1") int pg,Model model) {
//		PageHelper.startPage(pg,6);
//		List<Employee> employeeList=employeeService.getAll();
//		PageInfo pageInfo=new PageInfo(employeeList,6);
//		model.addAttribute("pageInfo", pageInfo);
//		return "emp/list";
//	}
	@ResponseBody
	@RequestMapping(value="/list",method=RequestMethod.GET)
	public Message list(@RequestParam(name="pg",defaultValue="1") int pg) {
		logger.debug("进入了list方法了......");
		PageHelper.startPage(pg,6);
		List<Employee> employeeList=employeeService.getAll();
		PageInfo pageInfo=new PageInfo(employeeList,6);
		
		return Message.success().addInfo("pageInfo", pageInfo);
	}
	@ResponseBody
	@RequestMapping(value="/edit",method=RequestMethod.POST)
	public Message save(@Validated Employee employee,BindingResult result) {
		if(result.hasErrors()) {
			List<FieldError> fieldErrors=result.getFieldErrors();
			Map<String, Object> erros=new HashMap<String, Object>();
			fieldErrors.forEach((error) ->{
				erros.put(error.getField(), error.getDefaultMessage());
			});
			return Message.fail().addInfo("erros", erros);
		}
		
		employeeService.save(employee);
		
		return Message.success();
	}
	@ResponseBody
	@RequestMapping(value="/edit/{empId}",method=RequestMethod.GET)
	public Message editUI(@PathVariable("empId") int empId) {
		Employee employee=employeeService.getById(empId);
		
		return Message.success().addInfo("employee", employee);
	}
	@ResponseBody
	@RequestMapping(value="/edit/{empId}",method=RequestMethod.PUT)
	public Message edit(Employee employee) {
		employeeService.update(employee);
		
		return Message.success();
	}
	@ResponseBody
	@RequestMapping(value="/checkUserName",method=RequestMethod.GET)
	public Message checkUserName(String empName) {
		String reg="(^[a-zA-z0-9_-]{3,16}$)|(^[\\u2E80-\\u9FFF]{2,6}$)";
		if(!empName.matches(reg)) {
			return Message.fail().addInfo("msg", "你必须发输入字母数字或者下划线3到16位,或者2到6位的中文");
		}
		boolean flag=employeeService.checkUserName(empName);
		
		
		return Message.success().addInfo("flag", flag);
	}
	@ResponseBody
	@RequestMapping(value="/del/{empId}",method=RequestMethod.DELETE)
	public Message del(@PathVariable("empId") String empId) {
		if(empId.contains(",")) {
			String[] emps=empId.split(",");
			for(int i=0;i<emps.length;i++) {
				employeeService.del(Integer.valueOf(emps[i]));
			}
		}else {
			employeeService.del(Integer.valueOf(empId));
		}
		
		
		return Message.success();
	}
	
}
