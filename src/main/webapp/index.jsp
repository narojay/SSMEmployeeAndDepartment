<%--
  Created by IntelliJ IDEA.
  User: 黄杰
  Date: 2018/8/14
  Time: 16:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>员工列表</title>
    <%
        pageContext.setAttribute("APP_PATH",request.getContextPath());


    %>
    <%--引入jquery--%>
    <script type="text/javascript" src="${APP_PATH}/static/js/jquery-3.3.1.js"></script>
    <%--引入样式--%>
    <link rel="stylesheet" href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <%--Jquery--%>
    <script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
</head>
<body>
<div class="modal fade" id="empUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
<div class="modal-dialog" role="document">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" >员工修改</h4>
        </div>
        <div class="modal-body">
            <form class="form-horizontal">
                <div class="form-group">
                    <label for="empName_update_input" class="col-sm-2 control-label">empName</label>
                    <div class="col-sm-10">
                        <p class="form-control-static" id="empName_update_static">email@example.com</p>
                        <span class="help-block"></span>
                    </div>
                </div>
                <div class="form-group">
                    <label for="email_update_input" class="col-sm-2 control-label">email</label>
                    <div class="col-sm-10">
                        <input type="text" name="email" class="form-control" id="email_update_input" placeholder="email@hjsjy.com">
                        <span class="help-block"></span>
                    </div>
                </div>
                <div class="form-group">
                    <label for="email_update_input" class="col-sm-2 control-label">gender</label>
                    <div class="col-sm-10">
                        <label class="radio-inline">
                            <input type="radio" name="gender" id="gender1_update_input" value="M" checked="checked"> 男
                        </label>
                        <label class="radio-inline">
                            <input type="radio" name="gender" id="gender2_update_input" value="F"> 女
                        </label>
                    </div>
                </div>
                <div class="form-group">
                    <label for="email_update_input" class="col-sm-2 control-label">deptName</label>
                    <div class="col-sm-4">
                        <select class="form-control" name="dId" id="dept_update_select">
                            <%--部门提交ID--%>
                        </select>
                    </div>
                </div>
            </form>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            <button type="button" class="btn btn-primary" id="emp_update_btn">修改</button>
        </div>
    </div>
</div>
</div>
<%--新增模态框--%>
<div class="modal fade" id="empAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">员工添加</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="empName_add_input" class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10">
                            <input type="text"  name="empName" class="form-control" id="empName_add_input" placeholder="empName">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email_add_input" class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control" id="email_add_input" placeholder="email@hjsjy.com">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email_add_input" class="col-sm-2 con trol-label">gender</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_add_input" value="M" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_add_input" value="F"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email_add_input" class="col-sm-2 control-label">deptName</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="dId" id="dept_add_select">
                            <%--部门提交ID--%>
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_save_btn">保存</button>
            </div>
        </div>
    </div>
</div>

<%--页面搭建--%>
<div class="container">
    <%--标题--%>
    <div class="row">
        <div class="col-md-12 ">
            <h1>SSM-CRUD</h1>
        </div>
    </div>
    <%--按钮--%>
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <button class="btn btn-primary" id="emp_add_modal_btn">新增</button>
            <button class="btn btn-danger" id="emp_delete_all_btn">批量删除</button>
        </div>
    </div>
    <%--显示表格数据--%>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover" id="emps_tables">
            <thead>
                <tr>
                    <th><input type="checkbox" id="check_all"></th>
                    <th>#</th>
                    <th>empName</th>
                    <th>gender</th>
                    <th>email</th>
                    <th>deptName</th>
                    <th>操作</th>
                </tr>

            </thead>
                <tbody>

                </tbody>

            </table>

        </div>
    </div>
    <%--分页信息栏 --%>
    <div class="row">
        <div class="col-md-6" id="page_info_area">
        </div>
        <div class="col-md-6" id="page_nav_area">

        </div>
    </div>


</div>
<%--<button class="btn btn-success">按钮</button>--%>
<script type="text/javascript">
    var totalRecord,currentPage;
    $(function () {
     //   去首页
     to_page(1);
    });
    function to_page(pn) {
        $.ajax({
            url:"${APP_PATH}/emps",
            data:"pn="+pn,
            type:"GET",
            success:function (result) {
                build_page_nav(result);
                build_page_Info(result);
                //解析并显示员工数据
                build_emps_table(result);
                //分页数据


                //解析显示分页条


            }

        });
    }
    function build_emps_table(result) {
        $("#emps_tables tbody").empty();
        var emps=result.extend.pageInfo.list;
        $.each(emps,function (index,item) {
            var checkBoxTd=$("<td><input type='checkbox' class='check_item'/></td>");
            var empIdTd=$("<td></td>").append(item.empId);
            var empNameTd=$("<td></td>").append(item.empName);
            var genderTd=$("<td></td>").append(item.gender=='M'?"男":"女");
            var emailTd=$("<td></td>").append(item.email);
            var deptNameTd=$("<td></td>").append(item.department.deptName);
            //   <button class="btn btn-primary">新增</button>
            var editBtn=$("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-align-left")).append("编辑");
            //为编辑按钮添加一个自定义的属性
            editBtn.attr("edit-id",item.empId);
            var delBtn=$("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-align-left")).append("删除");
            //为删除按钮添加一个自定义的属性来表示当前删除的员工id
            delBtn.attr("del-id",item.empId);
            var btnTd=$("<td></td>").append(editBtn).append(" ").append(delBtn);
        //    append方法执行完成以后还是返回原来的元素
            $("<tr></tr>").append(checkBoxTd)
                .append(empIdTd)
                .append(empNameTd)
                .append(genderTd)
                .append(emailTd)
                .append(deptNameTd)
                .append(btnTd)
                .appendTo("#emps_tables tbody");
        });
    }

    function build_page_Info(result) {
        $("#page_info_area").empty();
        $("#page_info_area").append("当前"+result.extend.pageInfo
            .pageNum +"页,总"+result.extend.pageInfo.pages+"页，总共"+result.extend
            .pageInfo.total+"条数据记录");
        totalRecord=result.extend.pageInfo.total;
        currentPage=result.extend.pageInfo.pageNum;
    }
    //解析显示分页
    function build_page_nav(result) {
        $("#page_nav_area").empty();
        var ul = $("<ul></ul>").addClass("pagination");
        var firstPageLi=$("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
        var prePageLi=$("<li></li>").append($("<a></a>").append("&laquo;"));
        if(result.extend.pageInfo.hasPreviousPage==false){
            firstPageLi.addClass("disabled");
            prePageLi.addClass("disabled");
        }else {
            firstPageLi.click(function () {
                to_page(1);
            });
            prePageLi.click(function () {
                to_page(result.extend.pageInfo.pageNum-1);
            });
        }

        var nextPageLi=$("<li></li>").append($("<a></a>").append("&raquo;"));
        var lastPageLi=$("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
        if(result.extend.pageInfo.hasNextPage==false){
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled");
        }else{
            nextPageLi.click(function () {
                to_page(result.extend.pageInfo.pageNum+1);
            });
            lastPageLi.click(function () {
                to_page(result.extend.pageInfo.pages);
            });
        }

        ul.append(firstPageLi).append(prePageLi);
        $.each(result.extend.pageInfo.navigatepageNums,function (index,item) {

            var numLi=$("<li></li>").append($("<a></a>").append(item));
            if(result.extend.pageInfo.pageNum==item){
                numLi.addClass("active");
            }
            numLi.click(function () {
                to_page(item);
            });
            ul.append(numLi);
        });

            ul.append(nextPageLi).append(lastPageLi);
            var navEle=$("<nav></nav>").append(ul);
            navEle.appendTo("#page_nav_area");
    }
        function reset_form(ele){
            $(ele)[0].reset();
        //    清空表单样式
            $(ele).find("*").removeClass("has-error has-success");
            $(ele).find(".help-block").text("");
        }

    //点击新增弹出对话框
    $("#emp_add_modal_btn").click(function(){
        //表单完整重置（表单的数据，表单的样式）
        reset_form("#empAddModal form ");

        //发送ajax请求，查出部门信息，显示在下拉框
        getDepts("#dept_add_select");
        //弹出模态框
        $("#empAddModal").modal({
            backdrop:"static"
        });
    });
    //查出所有的部门信息并且显示在下拉列表中
    //extend
    // :
    // {depts: [{deptId: 1, deptName: "开发部"}, {deptId: 2, deptName: "测试部"}]}
    function getDepts(ele) {
        $(ele).empty();
        $.ajax({
            url:"${APP_PATH}/depts",
            type:"GET",
            success:function (result) {
               // $("#dept_add_seclet").append();
                $.each(result.extend.depts,function(){
                    var optionEle=$("<option></option>").append(this.deptName).attr("value",this.deptId);
                    optionEle.appendTo(ele);
                });
            }
        });
    }
    function validata_add_form(){
        var empName=$("#empName_add_input").val();
        var regName=/(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
        if(!regName.test(empName)){
            // alert("用户名可以是2-5位中文或者6-16位英文和数字的组合");
            //
            show_validate_msg("#empName_add_input","error","用户名可以是2-5位中文或者6-16位英文和数字的组合");

            return false;

        }else{
            show_validate_msg("#empName_add_input","success","");

        }
    //  2.校验邮箱信息
        var email=$("#email_add_input").val();
        var regEmail=/^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        if(!regEmail.test(email)){
            // alert("邮箱格式不正确")
            show_validate_msg("#email_add_input","error","邮箱格式不正确");

            return false;
        }else{
            show_validate_msg("#email_add_input","success","");

        }
        return true;
    }
        function show_validate_msg(ele,status,msg){
            $(ele).parent().removeClass("has-success has-error");
            $(ele).next("span").text("");
            if("success"==status){
                $(ele).parent().addClass("has-success");
                $(ele).next("span").text(msg);
            }else if("error"==status){
                $(ele).parent().addClass("has-error");
                $(ele).next("span").text(msg);
            }
        }
        //校验用户名是否可用
        $("#empName_add_input").change(function () {
        //    发送ajax请求校验用户名是否可用
            var empName=this.value;
            $.ajax({
                    url:"${APP_PATH}/checkuser",
                    data:"empName="+empName,
                    type:"POST",
                    success:function(result){
                        if(result.code==100){
                            show_validate_msg("#empName_add_input","success","用户名可用");
                            $("#emp_save_btn").attr("ajax-va","success");
                        }else{
                            show_validate_msg("#empName_add_input","error",result.extend.va_msg);
                            $("#emp_save_btn").attr("ajax-va","error");
                        }
                    }

            });
        });
    //点击保存
    $("#emp_save_btn").click(function () {

        //校验表单数据
        if(!validata_add_form()){
            return false;
        }
        if($(this).attr("ajax-va")=="error"){
                return false;
        }


    //    表单数据提交给服务器进行保存
    //    发送ajax请求保存员工
        $.ajax({
            url:"${APP_PATH}/emp",
            type:"POST",
            data:$("#empAddModal form").serialize(),
            success:function (result) {
                    if(result.code==100) {
                        //   显示员工保存
                        //    关闭模态框
                        $("#empAddModal").modal('hide');
                        //    来到最后一页显示刚才保存的数据
                        to_page(totalRecord);
                    }else{
                            if(undefined!=result.extend.errorFields.email){
                                show_validate_msg("#email_add_input","error",result.extend.errorFields.email);
                            }
                            if(undefined!=result.extend.errorFields.empName){
                                show_validate_msg("#empName_add_input","error",result.extend.errorFields.empName);
                            }
                    }
            }
        });
    });


    //我们是按钮创建之前就绑定了click,所以绑不上，
    //1可以在创建按钮的时候绑定2 绑定单机事件live（）
    //jquery新版没有live而是用on进行了替代
    $(document).on("click",".edit_btn",function () {
        // alert("edit");
    //    0.查出员工信息，显示员工信息
    //    1.查出部门信息，并显示部门列表

        //查询员工信息，显示员工信息
        getEmp($(this).attr("edit-id"));
        getDepts("#dept_update_select");
        //把员工id传递给模态框修改按钮
        $("#emp_update_btn").attr("edit-id",$(this).attr("edit-id"));
        $("#empUpdateModal").modal({
            backdrop:"static"
        });
    });
    function getEmp(id) {
        $.ajax({
            url:"${APP_PATH}/emp/"+id,
            type:"GET",
            success:function(result) {
                // console.log(result);
                var empData=result.extend.emp;
                $("#empName_update_static").text(empData.empName);
                $("#email_update_input").val(empData.email);
                $("#empUpdateModal input[name=gender]").val([empData.gender]);
                $("#dept_update_select").val([empData.dId]);
            }
        });
    }


        //修改按钮
        $("#emp_update_btn").click(function () {
        //   验证邮箱是否合法
            var email=$("#email_update_input").val();
            var regEmail=/^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
            if(!regEmail.test(email)){
                // alert("邮箱格式不正确")
                show_validate_msg("#email_update_input","error","邮箱格式不正确");

                return false;
            }else{
                show_validate_msg("#email_update_input","success","");

            }
            $.ajax({
                url:"${APP_PATH}/emp/"+$(this).attr("edit-id"),
                type:"PUT",
                data:$("#empUpdateModal form").serialize(),
                success:function(result){
                    // alert(result.msg);
                //    1关闭对话框

                    $("#empUpdateModal").modal("hide");
                //     2回到本页面

                    to_page(currentPage);

                //
                }
            });
        });
    //单个删除
    $(document).on("click",".delete_btn",function () {
    //    弹出确认删除对话框
        var empName=$(this).parents("tr").find("td:eq(2)").text();
        var empId=$(this).attr("del-id");
        if(confirm("确认删除【"+empName+"】吗")){
            $.ajax({
                url:"${APP_PATH}/emp/"+empId,
                type:"DELETE",
                success:function (result) {
                    alert(result.msg);
                    to_page(currentPage);
                }
            });
        }


    });
    //全选按钮
    $("#check_all").click(function () {
        //attr获取checked是uunfined;
        // 我们这些原生的属性用prop，attr用来获取自定义的属性
      if(true==$(this).prop("checked")){
        alert("确定全选吗");
        $(".check_item").prop("checked",$(this).prop("checked"));
      }else{
          $(".check_item").prop("checked",$(this).prop("checked"));
      }
    });
    $(document).on("click",".check_item",function () {
     var flag =$(".check_item:checked").length==$(".check_item").length;
         $("#check_all").prop("checked",flag);
    });
//    批量删除按钮
    $("#emp_delete_all_btn").click(function () {
        var empNames="";
        var del_idstr="";
        $.each($(".check_item:checked"),function () {
           empNames += $(this).parents("tr").find("td:eq(2)").text()+",";
           //员工ID字符串
            del_idstr +=$(this).parents("tr").find("td:eq(1 )").text()+"-";
        });
        //取出empnames多余的逗号
        newEmpNames=empNames.substring(0,empNames.length-1);
        del_idstr=del_idstr.substring(0,del_idstr.length-1);
        if(confirm("确认删除【"+newEmpNames+"】吗?")){
        //    发送ajax请求删除
            $.ajax({
                url:"${APP_PATH}/emp/"+del_idstr,
                type:"DELETE",
                success:function (result) {
                    $("#check_all").prop("checked",false);
                    alert(result.msg);

                    to_page(currentPage);
                }
            });
        }
    });
</script>
</body>
</html>
