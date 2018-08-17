package com.hjsjy.crud.controller;

import com.hjsjy.crud.bean.Department;
import com.hjsjy.crud.bean.Msg;
import com.hjsjy.crud.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * 〈一句话功能简述〉<br>
 *处理和部门有关的请求
 * @author hjsjy
 * @create 2018/8/15
 * @since 1.0.0
 */
@Controller
public class DepartmentController {

    @Autowired
    private DepartmentService departmentService;

    @RequestMapping("/depts")
    @ResponseBody
    public Msg getDepts(){
        List<Department> list = departmentService.getDepts();
        return Msg.success().add("depts", list);
    }
}