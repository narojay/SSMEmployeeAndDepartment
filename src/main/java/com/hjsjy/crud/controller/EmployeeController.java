package com.hjsjy.crud.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hjsjy.crud.bean.Employee;
import com.hjsjy.crud.bean.Msg;
import com.hjsjy.crud.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * 〈一句话功能简述〉<br>
 *
 * @author hjsjy
 * @create 2018/8/14
 * @since 1.0.0
 */
@Controller
public class EmployeeController {
    @Autowired
    EmployeeService employeeService;


    /**
     * 单个批量二合一
     * @param id
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/emp/{ids}",method = RequestMethod.DELETE)
   public Msg deleteEmp(@PathVariable("ids") String ids){
//        批量删除
        if(ids.contains("-")){
            List<Integer> del_ids=new ArrayList<>();
            String[] str_ids = ids.split("-");
//            组装id集合
            for (String string:str_ids){
              del_ids.add(Integer.parseInt((string)));

            }
            employeeService.deleteBatch(del_ids);
        }else {
            Integer id = Integer.parseInt(ids);
            employeeService.deleteEmp(id);
        }

        return Msg.success();
    }


    /**
     * 员工更新
     * PUT
     *    <filter>
     *         <filter-name>HttpPutFormContentFilter</filter-name>
     *         <filter-class>org.springframework.web.filter.HttpPutFormContentFilter</filter-class>
     *     </filter>
     *     <filter-mapping>
     *         <filter-name>HttpPutFormContentFilter</filter-name>
     *         <url-pattern>/*</url-pattern>
     *     </filter-mapping>
     *     将请求体的数据解析包装成一个map
     *     request被重新包装，request.getParameter()被重写,就会从自己封装map
     * @param employee
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/emp/{empId}",method = RequestMethod.PUT)
    public Msg saveEmp(Employee employee){
        employeeService.updateEmp(employee);
        return Msg.success();
    }




    /**
     * 根据id查询员工
     * @param id
     * @return
     */
    @RequestMapping(value ="/emp/{id}",method = RequestMethod.GET)
    @ResponseBody
    public Msg getEmp(@PathVariable("id") Integer id){
           Employee employee=employeeService.getEmp(id);
        return Msg.success().add("emp",employee);

    }





    /**
     * 是否用户名是否可用
     * @param empName
     * @return
     */
    @RequestMapping("/checkuser")
    @ResponseBody
      public Msg checkuser(@RequestParam("empName") String empName){
        String regx="(^[a-zA-Z0-9_-]{6,16}$)|(^[\\u2E80-\\u9FFF]{2,5})";
        if(!empName.matches(regx)){
            return Msg.fail().add("va_msg","用户名必须是6-16位的组合和字母的组合或者2-5位的中文");
        }
//        数据库校验
         boolean b =  employeeService.checkUser(empName);
            if(b){
                 return Msg.success();
            }else {
                return  Msg.fail().add("va_msg","用户名不可用");
            }

      }
    /**
     * 要支持JSR303包
     * 要导入hibenate validator
     * 保存员工
     * @return
     */
    @RequestMapping(value = "/emp",method = RequestMethod.POST)
    @ResponseBody
    public Msg saveEmp(@Valid Employee employee, BindingResult result){
        if(result.hasErrors()){
            Map<String,Object> map= new HashMap<>();
            List<FieldError> errors = result.getFieldErrors();
            for(FieldError fieldError:errors){
                System.out.println("错误字段名："+fieldError.getField());
                System.out.println("错误信息："+fieldError.getDefaultMessage());
                map.put(fieldError.getField(),fieldError.getDefaultMessage());
            }

            return Msg.fail().add("errorFields",map);
        }else{


            employeeService.saveEmp(employee);
            return Msg.success();
        }
    }
    /**
     * 导入jackson包
     * @param pn
     * @return
     */
    @RequestMapping("/emps")
    @ResponseBody
    public Msg getEmpsWithJson(@RequestParam(value = "pn",defaultValue ="1") Integer pn){
        //   这不是一个分页查询；
//        引入pagehelper分页插件
//          插入页码 以及分页每一个的大小
        PageHelper.startPage(pn,5);
        List<Employee> emps=employeeService.getAll();
//        startPage紧跟的查询就是分页查询

//        使用pageinfo 包装查询后的结果只需要将pageinfo交给页面就行了。
//        封装了详细的配置信息，包括有我们查询出来的数据。
        PageInfo page=new PageInfo(emps,5);

        return Msg.success().add("pageInfo",page);

    }
    //@RequestMapping("/emps")
    public  String getEmps(@RequestParam(value = "pn",defaultValue ="1") Integer pn, Model model){


//        这不是一个分页查询；
//        引入pagehelper分页插件
//          插入页码 以及分页每一个的大小
        String orderBy="e.emp_id asc";
        PageHelper.startPage(pn,5,orderBy);
//        startPage紧跟的查询就是分页查询
        List<Employee> emps=employeeService.getAll();
//        使用pageinfo 包装查询后的结果只需要将pageinfo交给页面就行了。
//        封装了详细的配置信息，包括有我们查询出来的数据。
        PageInfo page=new PageInfo(emps,5);
        model.addAttribute("pageInfo",page);
        return "list";

    }
}