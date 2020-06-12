package com.edu.test;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.edu.bean.Employee;
import com.edu.mapper.EmployeeMapper;
import com.edu.util.UUIDUtil;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:spring/applicationContext.xml" })
public class EmployeeMapperTest {
	@Autowired
	private EmployeeMapper employeeMapper;
	@Autowired
	private SqlSession sqlSession;

	@Test
	public void test() {
		EmployeeMapper employeeMapper=sqlSession.getMapper(EmployeeMapper.class);
		List<Employee> employeeList = employeeMapper.selectByDeptExample(null);
    	employeeList.forEach((employee) ->{
    		System.out.println(employee.getDeptId()+","+employee.getEmpName()+","+employee.getEmpBirthday()
    		);});
	
}
}
