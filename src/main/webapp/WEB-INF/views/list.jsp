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
            <button class="btn btn-primary">新增</button>
            <button class="btn btn-danger">删除</button>
        </div>
    </div>
        <%--显示表格数据--%>
    <div class="row">
        <div class="col-md-12">
             <table class="table table-hover">

             </table>

        </div>
    </div>
        <%--分页信息栏 --%>
    <div class="row">
        <div class="col-md-6">
            当前页,总页，总共数据
        </div>
        <div class="col-md-6">

        </div>
    </div>


</div>
</body>
</html>
