package com.hjsjy.crud.service;

import com.hjsjy.crud.bean.Employee;
import com.hjsjy.crud.bean.EmployeeExample;
import com.hjsjy.crud.dao.EmployeeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 〈一句话功能简述〉<br>
 *
 * @author hjsjy
 * @create 2018/8/14
 * @since 1.0.0
 */
@Service
public class EmployeeService {
    @Autowired
    EmployeeMapper employeeMapper;
    public List<Employee> getAll() {
        return employeeMapper.selectByExampleWithDept(null);
    }


    /**
     * 员工保存
     * @param employee
     */
    public void saveEmp(Employee employee) {
            employeeMapper.insertSelective(employee);
    }


    /**
     * 检验用户名是否可用
     * @param empName
     * @return true :
     */
    public boolean checkUser(String empName) {
        EmployeeExample example=new EmployeeExample();
        EmployeeExample.Criteria criteria = example.createCriteria();
        criteria.andEmpNameEqualTo(empName);
        long count = employeeMapper.countByExample(example);
        return count==0;
    }

    /**
     * 按照员工id查询员工
     * @param id
     * @return
     */
    public Employee getEmp(Integer id) {
        Employee employee=employeeMapper.selectByPrimaryKey(id);
        return employee;
     }

    public void updateEmp(Employee employee) {
        employeeMapper.updateByPrimaryKeySelective(employee);
    }

    public void deleteEmp(Integer id) {
        employeeMapper.deleteByPrimaryKey(id);
    }

    public void deleteBatch(List<Integer> ids) {
        EmployeeExample example = new EmployeeExample();
        EmployeeExample.Criteria criteria = example.createCriteria();
        criteria.andEmpIdIn(ids);
        employeeMapper.deleteByExample(example);
    }
}