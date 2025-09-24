<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>发布的商品</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <link rel="stylesheet" href="<%=basePath%>layui/css/layui.css">
    <c:if test="${empty nowuser }">
        <script type="text/javascript">
            alert("请先登录");
            window.location.href = "<%=basePath%>login.jsp";
        </script>
    </c:if>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">校园即时服务平台</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item"><a href="">任务中心</a></li>
            <li class="layui-nav-item"><a href="task/productlist.do">商品中心</a></li>
            <li class="layui-nav-item"><a href="userIndex.jsp">个人中心</a></li>

        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item"><a href="javascript:;">

                ${nowuser.name } </a>
                <dl class="layui-nav-child">
                    <dd>
                        <a href="userIndex.jsp">个人信息</a>
                    </dd>
                    <dd>
                        <a href="userUpdate.jsp">资料修改</a>
                    </dd>
                    <dd>
                        <a href="userPassword.jsp">安全设置</a>
                    </dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="common/logout.do">退出</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree" lay-filter="test">

                <li class="layui-nav-item"><a href="">校园即时服务平台</a></li>

                <li class="layui-nav-item layui-nav-itemed"><a
                        href="javascript:;">任务管理</a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="task/getusertask.do">已发布任务</a>
                        </dd>
                        <dd>
                            <a href="task/getuseratask.do">已接受任务</a>
                        </dd>
                        <dd>
                            <a href="userNewtask.jsp">发布新任务</a>
                        </dd>
                    </dl>
                </li>
                <li class="layui-nav-item layui-nav-itemed"><a
                        href="javascript:;">外卖订购</a>
                    <dl class="layui-nav-child">
                        <dd class="layui-this">
                            <a href="task/productlist.do">外卖列表</a>
                        </dd>
                    </dl>
                </li>

                <li class="layui-nav-item layui-nav-itemed"><a class=""
                                                               href="javascript:;">个人中心</a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="userIndex.jsp">个人信息</a>
                        </dd>
                        <dd>
                            <a href="userUpdate.jsp">资料修改</a>
                        </dd>
                        <dd>
                            <a href="userPassword.jsp">安全设置</a>
                        </dd>
                    </dl>
                </li>


            </ul>

        </div>
    </div>
    <!-- 内容主体区域-->
    <div class="layui-body">
        <div style="padding: 30px;" class="layui-fluid">
            <div class="layui-row">
                <div class="layui-col-md12">
                    <span class="layui-badge-dot"></span> <span
                        class="layui-badge-dot layui-bg-orange"></span> <span
                        class="layui-badge-dot layui-bg-green"></span> <span
                        class="layui-badge-dot layui-bg-cyan"></span> <span
                        class="layui-badge-dot layui-bg-blue"></span> <span
                        class="layui-badge-dot layui-bg-black"></span> <span
                        class="layui-badge-dot layui-bg-gray"></span>
                    <fieldset class="layui-elem-field layui-field-title"
                              style="margin-top: 30px;">
                        <legend>已发布商品</legend>
                    </fieldset>
                </div>
            </div>

            <div class="layui-row">
                <div class="layui-col-md1">&nbsp;</div>
                <div class="layui-col-md10">
                    <fieldset class="layui-elem-field" style="padding: 20px;">
                        <legend>外卖列表</legend>
                        <c:forEach items="${list }" var="product">
                            <div style="margin-left: 20px;margin-right: 30px;margin-top: 20px;">
                            </div>
                            <fieldset class="layui-elem-field layui-field-title"
                                      style="margin: 20px;margin-bottom: 5px;margin-top: 5px;">
                                <legend><a>${product.name }</a></legend>
                            </fieldset>
                            <div style="margin-left: 20px;margin-right: 30px;">
                                <span class="layui-badge layui-bg-gray">
                                    <c:if test="${!empty product.icon}">
                                        <img style="width: 120px;height: 80px;" src="${pageContext.request.contextPath}/images/${product.icon}"/>
                                    </c:if>
                                </span>
                            </div>
                            <div style="margin-left: 30px;margin-right: 30px;margin-top: 10px;">
                                <span class="layui-badge layui-bg-gray">编号：${product.id }</span>
                            </div>
                            <div style="margin-left: 30px;margin-right: 30px;margin-top: 10px;margin-bottom: 30px;">
                                <span class="layui-badge layui-bg-gray">单价：${product.price}</span>
                            </div>
                            <a href="task/addOrder.do?productId=${product.id }"
                               class="layui-btn layui-btn-sm layui-btn-normal layui-btn-radius">立即下单</a>
                        </c:forEach>
                    </fieldset>

                </div>
                <div class="layui-col-md1">&nbsp;</div>
            </div>

        </div>

    </div>

    <c:if test="${!empty msg }">
        <script type="text/javascript">
            alert("${msg }");
        </script>
    </c:if>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        © - 校园即时服务平台办公电话：6666666
    </div>
</div>
<script src="${pageContext.request.contextPath }/layui/layui.all.js"></script>
<script>
    //JavaScript代码区域
    layui.use('element', function () {
        var element = layui.element;
        //监听导航点击
        element.on('nav(test)', function (elem) {
            //console.log(elem)
            layer.msg(elem.text());
        });
    });
</script>
<script>
    function getAuser(stuid) {
        //iframe层
        layer.open({
            type: 2,
            title: '该用户信息',
            shadeClose: true,
            shade: false,
            area: ['1000px', '600px'],
            content: 'common/getuser.do?stuidstr=' + stuid
        });
    }
</script>

</body>
</html>
