<%@ page language="java" import="java.util.*" contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">
    <title>职位管理</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <script src="js/jquery-1.11.0.min.js"></script>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/nav.css">
    <link rel="stylesheet" type="text/css" href="css/table.css">
    <script>
        $(document).ready(function () {
            var page = "${page.currentPage}";
            // 全选
            $("#checkedAll").bind("click", function () {
                if ($("#checkedAll").is(':checked')) {
                    $(".chkItem:checkbox").prop("checked", true);
                } else {
                    $(".chkItem:checkbox").prop("checked", false);
                }
            });
            /*设置页数*/
            $("#page").blur(function () {
                if ($(this).val() != "") {
                    page = $(this).val();
                }
                var url = "${pageContext.request.contextPath}/findOnPosition.action?currentPage=" + page;
                $("#pageForm").attr("action", url);
                $("#pageForm").submit();
            });

            //结束多选、全选的
            $("#endP").click(function () {
                var positionPid = [];
                var url = "${pageContext.request.contextPath}/endPosition.action?currentPage=" + page + "&action=endOnP";
                $("#result input[type=checkbox]:checked").each(function () {
                    positionPid.push($(this).val());
                });
                $("#positionPid").val(positionPid);
                $("#delOrEnd").attr("action", url);
                $("#delOrEnd").submit();
            });
            //删除多选、全选的
            $("#delP").click(function () {
                var positionPid = [];
                var url = "${pageContext.request.contextPath}/deletePosition.action?currentPage=" + page + "&action=delOnP";
                $("#result input[type=checkbox]:checked").each(function () {
                    positionPid.push($(this).val());
                });
                $("#positionPid").val(positionPid);
                $("#delOrEnd").attr("action", url);
                $("#delOrEnd").submit();
            });
        });

    </script>
</head>
<body>

<header>
    <div class="head-contain">
        <div class="head">
            <span class="head-left"><strong></strong></span>
            <span class="head-right">你好，${sessionScope.companyname}</span>
            <a href="${pageContext.request.contextPath}/loginOut.action" class="head-right">退出</a>
            <a href="${pageContext.request.contextPath}/companyInfoFind.action" class="head-right ">编辑信息</a>
            <!--清除浮动-->
            <span class="clean"></span>
        </div>
    </div>

    <!--导航条-->
    <div class="nav-contain">
        <div class="nav">
            <ul>
                <!--logo-->
                <!--导航-->
                <li class="nav-right"><a href="${basePath}findPositionByCid.action?state=1&currentPage=1">简历管理</a></li>
                <li class="nav-right"><a href="${pageContext.request.contextPath}/findOnPosition.action?currentPage=1"
                                         style="background-color: #337AB7">职位管理</a></li>
                <li class="nav-right"><a href="search_resume.jsp">找简历</a></li>
                <li class="nav-right"><a href="edit_job.jsp">发职位</a></li>
                <span class="clean"></span>
            </ul>
        </div>
    </div>

</header>
<div class="main-content">
    <div class="bar">
        <ul class="nav nav-pills">
            <li class="active"><a href="${pageContext.request.contextPath}/findOnPosition.action?currentPage=1"
                                  target="_self">正在招聘</a></li>
            <li><a href="${pageContext.request.contextPath}/findOverPosition.action?currentPage=1"
                   target="_self">已经结束</a></li>
            <li><a href="${pageContext.request.contextPath}/findPosition.action?currentPage=1" target="_self">全部职位</a>
            </li>
        </ul>
    </div>
    <form action="" enctype="multipart/form-data" method="post">
        <div class="content">
            <table class="table table-hover ">
                <thead>
                <tr>
                    <th></th>
                    <th>职位名称</th>
                    <th>职能分类</th>
                    <th>所属部门</th>
                    <th>浏览次数</th>
                    <th>发布时间</th>
                    <th>结束时间</th>
                </tr>
                </thead>
                <tbody id="result">
                <c:forEach items="${positionList}" var="position">
                    <tr>
                        <td><input type="checkbox" name="positionPid" value="${position.pid }" class="chkItem"/></td>
                        <td>
                            <a href="${pageContext.request.contextPath}/showPosition.action?pid=${position.pid}">${position.position}</a>
                        </td>
                        <td>${position.classification}</td>
                        <td>${position.department}</td>
                        <td>${position.browsingNumber}</td>
                        <td><fmt:formatDate value="${position.releaseDate}" pattern="yyyy-MM-dd"/></td>
                        <td><fmt:formatDate value="${position.deadline}" pattern="yyyy-MM-dd"/></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="page">
            &nbsp;&nbsp;<input type="checkbox" id="checkedAll">&nbsp;全选 &nbsp;&nbsp;&nbsp;
            <a href="${pageContext.request.contextPath}/findOnPosition.action?currentPage=1">首页</a>&nbsp;&nbsp;&nbsp;
            <a href="${pageContext.request.contextPath}/findOnPosition.action?currentPage=${page.totalPage}">尾页</a>&nbsp;&nbsp;&nbsp;
            第<span>${page.currentPage}</span>/<span>${page.totalPage}</span>页&nbsp;&nbsp;&nbsp;
            去<input type="text" style="width: 40px;text-align:center;" id="page">&nbsp;&nbsp;页
            <br><br>
            <input type="button" value="结束招聘" class="btn btn-primary" id="endP">
            <input type="button" value="删除" class="btn btn-primary" id="delP">
        </div>
    </form>
</div>
<!-- 分页 -->
<form action="" method="post" id="pageForm"></form>

<!-- 传数据表单 -->
<form method="post" action="" id="delOrEnd">
    <input type="hidden" id="positionPid" name="positionPid">
</form>
</body>
</html>