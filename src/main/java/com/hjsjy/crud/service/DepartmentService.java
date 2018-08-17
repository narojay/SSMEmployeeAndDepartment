package com.hjsjy.crud.service;

import com.hjsjy.crud.bean.Department;
import com.hjsjy.crud.dao.DepartmentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import java.util.List;

/**
 * 〈一句话功能简述〉<br>
 *
 * @author hjsjy
 * @create 2018/8/15
 * @since 1.0.0
 */
@Service
public class DepartmentService {
    @Autowired
    private DepartmentMapper departmentMapper;

    public List<Department> getDepts() {
        List<Department> list = departmentMapper.selectByExample(null);
        return list;
    }
}