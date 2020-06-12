package com.edu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.edu.bean.Deptartment;
import com.edu.bean.Employee;
import com.edu.bean.Message;
import com.edu.service.DeptartmentService;

@Controller
@RequestMapping("/dept")
public class DeptartmentController {
	@Autowired
	private DeptartmentService deptartmentService;
	@ResponseBody
	@RequestMapping(value="/list",method=RequestMethod.GET)
	public Message list() {
		List<Deptartment> deptartList=deptartmentService.getAll();
		return Message.success().addInfo("deptartList", deptartList);
	}
//	@ResponseBody
//	@RequestMapping(value="/edit",method=RequestMethod.POST)
//	public Message save(Employee employee) {
//		List<Deptartment> deptartList=deptartmentService.getAll();
//		return Message.success().addInfo("deptartList", deptartList);
//	}
}
