package com.edu.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.edu.bean.Employee;
import com.edu.bean.EmployeeExample;
import com.edu.mapper.EmployeeMapper;
import com.edu.service.EmployeeService;
@Service
@Transactional
public class EmployeeServiceImpl implements EmployeeService{
	@Autowired
	private EmployeeMapper employeeMapper;
	@Override
	public List<Employee> getAll() {
		
		return employeeMapper.selectByDeptExample(null);
	}
	@Override
	public void save(Employee employee) {
		employeeMapper.insertSelective(employee);
		
	}
	@Override
	public Employee getById(int empId) {
		return employeeMapper.selectByPrimaryKey(empId);
	}
	@Override
	public void update(Employee employee) {
		employeeMapper.updateByPrimaryKeySelective(employee);
		
	}
	@Override
	public void del(int empId) {
		employeeMapper.deleteByPrimaryKey(empId);
		
	}
	@Override
	public boolean checkUserName(String empName) {
		EmployeeExample example=new EmployeeExample();
		example.createCriteria().andEmpNameEqualTo(empName);
		long countByExample=employeeMapper.countByExample(example);
		return countByExample>0;
	}

}
