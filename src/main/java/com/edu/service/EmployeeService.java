package com.edu.service;

import java.util.List;

import com.edu.bean.Employee;

public interface EmployeeService {

	List<Employee> getAll();

	void save(Employee employee);

	Employee getById(int empId);

	void update(Employee employee);

	void del(int empId);

	boolean checkUserName(String empName);

}
