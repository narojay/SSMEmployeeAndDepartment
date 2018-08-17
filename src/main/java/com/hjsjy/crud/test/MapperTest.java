package com.hjsjy.crud.test;
import com.hjsjy.crud.bean.Department;
import com.hjsjy.crud.bean.Employee;
import com.hjsjy.crud.dao.DepartmentMapper;
import com.hjsjy.crud.dao.EmployeeMapper;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.UUID;


/**
 * 〈一句话功能简述〉<br>
 *推荐spring项目就可以使用spring的单元测试，可以自动注入我们需要的组件
 * 直接autowired
 * @author hjsjy
 * @create 2018/8/14
 * @since 1.0.0
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations ={"classpath:applicationContext.xml"})
public class MapperTest {
    @Autowired
    DepartmentMapper departmentMapper;
    @Autowired
    EmployeeMapper employeeMapper;
    @Autowired
    SqlSession sqlSession;
    @Test
     public void testCRUD(){
        System.out.println(departmentMapper);
        //1\生成部门
       //    departmentMapper.insertSelective(new Department(null,"开发部"));

         //   departmentMapper.insertSelective(new Department(null,"测试部"));

       // 2、生成员工
       // employeeMapper.insertSelective(new Employee(null,"Jerry","M","Jerry@126.com" , 1));
        EmployeeMapper mapper = sqlSession.getMapper(EmployeeMapper.class);
        for (int i = 0; i <1000; i++) {
            String uid= UUID.randomUUID().toString().substring(0,5)+i;
        mapper.insertSelective(new Employee(null,uid,"M",uid+"@hjsjy.com",1));
        }
        System.out.println("批量完成");
    }



}