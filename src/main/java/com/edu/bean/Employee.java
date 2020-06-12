package com.edu.bean;

import java.util.Date;

import javax.validation.constraints.Pattern;

import com.fasterxml.jackson.annotation.JsonFormat;

public class Employee {
    private Integer empId;
    @Pattern(regexp="(^[a-zA-z0-9_-]{3,16}$)|(^[\\u2E80-\\u9FFF]{2,6}$)",message="{employee.empName.erro}")
    private String empName;
    @Pattern(regexp="^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$",message="{employee.empEmail.erro}")
    private String empEmail;
    @JsonFormat(pattern="yyyy-MM-dd",timezone="GMT+8")
    private Date empBirthday;

    private String empSex;

    private Integer deptId;
    
    private Deptartment deptartment;

    public Deptartment getDeptartment() {
		return deptartment;
	}

	public void setDeptartment(Deptartment deptartment) {
		this.deptartment = deptartment;
	}

	public Integer getEmpId() {
        return empId;
    }

    public void setEmpId(Integer empId) {
        this.empId = empId;
    }

    public String getEmpName() {
        return empName;
    }

    public void setEmpName(String empName) {
        this.empName = empName == null ? null : empName.trim();
    }

    public String getEmpEmail() {
        return empEmail;
    }

    public void setEmpEmail(String empEmail) {
        this.empEmail = empEmail == null ? null : empEmail.trim();
    }

    public Date getEmpBirthday() {
        return empBirthday;
    }

    public void setEmpBirthday(Date empBirthday) {
        this.empBirthday = empBirthday;
    }

    public String getEmpSex() {
        return empSex;
    }

    public void setEmpSex(String empSex) {
        this.empSex = empSex == null ? null : empSex.trim();
    }

    public Integer getDeptId() {
        return deptId;
    }

    public void setDeptId(Integer deptId) {
        this.deptId = deptId;
    }
}