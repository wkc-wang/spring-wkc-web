package com.edu.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.edu.bean.Deptartment;
import com.edu.mapper.DeptartmentMapper;
import com.edu.service.DeptartmentService;
@Service
@Transactional
public class DeptartmentServiceImpl implements DeptartmentService{
	@Autowired
	private DeptartmentMapper deptartmentMapper;
	@Override
	public List<Deptartment> getAll() {
		// TODO Auto-generated method stub
		return deptartmentMapper.selectByExample(null);
	}

}
