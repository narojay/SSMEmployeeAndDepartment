package com.hjsjy.crud.bean;

import javax.validation.constraints.Pattern;

public class Employee {
    private Integer empId;
    @Pattern(regexp = "(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})"
            ,message ="用户名必须是6-16位的组合和字母的组合或者2-5位的中文 后端" )
    private String empName;

    private String gender;
    @Pattern(regexp = "^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$",message = "邮箱格式不正确")
    private String email;

    private Integer dId;
    //    希望查询员工的同时带部门
    private  Department department;

    public Employee(Integer empId, String empName, String gender, String email, Integer dId) {
        this.empId = empId;
        this.empName = empName;
        this.gender = gender;
        this.email = email;
        this.dId = dId;
    }

    public Employee() {
    }

    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
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

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender == null ? null : gender.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public Integer getdId() {
        return dId;
    }

    public void setdId(Integer dId) {
        this.dId = dId;
    }
}