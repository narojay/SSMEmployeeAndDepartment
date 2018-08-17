package com.hjsjy.crud.test;

import com.github.pagehelper.PageInfo;
import com.hjsjy.crud.bean.Employee;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import java.util.List;

/**
 * 〈一句话功能简述〉<br>
 *
 * @author hjsjy
 * @create 2018/8/14
 * @since 1.0.0
 */
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations ={"classpath:applicationContext.xml","classpath:WEB-INF/dispatcherServlet-servlet.xml"})
public class MVCTest {
//    传入springmvc 的ioc
    @Autowired
    WebApplicationContext context;
//    虚拟mvc请求，获得到处理的结果
    MockMvc mockMvc;
    @Before
    public void initMokcMvc(){

        mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
    }
    @Test
    public void testPage() throws Exception {
        MvcResult result = mockMvc.perform(MockMvcRequestBuilders.get("/emps").param("pn", "2"))
                .andReturn();

        MockHttpServletRequest request = result.getRequest();
        PageInfo  pi = (PageInfo) request.getAttribute("pageInfo");
        System.out.println("当前页码"+pi.getPageNum());
        System.out.println("总页码"+pi.getPages());
        System.out.println("总页数"+pi.getTotal());
        System.out.println("在页面中需要连续的显示页码");
        int[] nums=pi.getNavigatepageNums();
        for(int i:nums){
            System.out.print(" "+i);
        }
        //获取员工信息
        List<Employee> list = pi.getList();

        for(Employee employee:list){
            System.out.println(employee.getdId());
            System.out.println(employee.getEmpName());
        }

    }
}