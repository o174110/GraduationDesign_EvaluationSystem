<%--
  Created by IntelliJ IDEA.
  User: Allen
  Date: 2018/5/31
  Time: 15:45
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
    session.setAttribute("basePath", basePath);
%>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>学生查看历史试题</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" type="image/png" href="../assets/i/favicon.png">
    <link rel="apple-touch-icon-precomposed" href="../assets/i/app-icon72x72@2x.png">
    <script src="../assets/js/echarts.min.js"></script>
    <link rel="stylesheet" href="../assets/css/amazeui.min.css"/>
    <link rel="stylesheet" href="../assets/css/amazeui.datatables.min.css"/>
    <link rel="stylesheet" href="../assets/css/app.css">
    <script src="../assets/js/jquery.min.js"></script>

</head>

<body data-type="widgets">
<script src="../assets/js/theme.js"></script>
<div class="am-g tpl-g">
    <!-- 内容区域 -->
    <div>
        <div class="container-fluid am-cf">
            <div class="row">
                <div class="am-u-sm-12 am-u-md-12 am-u-lg-9">
                    <div class="page-header-heading"><span class="am-icon-home page-header-heading-icon"></span> 首页>>
                        <small><a onclick="javascript:window.history.back(-1);">历史试题列表</a></small>
                        >>
                        <small>试卷详情</small>
                    </div>
                    <p class="page-header-description">查看历史试题</p>
                </div>
            </div>
        </div>

        <div class="row-content am-cf">


            <div class="row">

                <div class="am-u-sm-12 am-u-md-12 am-u-lg-12">
                    <div class="widget am-cf">
                        <div class="widget-head am-cf">
                            <div class="widget-title am-fl">试卷</div>
                            <div class="widget-function am-fr">
                                <a href="javascript:;" class="am-icon-cog"></a>
                            </div>
                        </div>
                        <div class="widget-body am-fr">
                            <form class="am-form tpl-form-border-form tpl-form-border-br"
                                  method="post" action="/question/pigaiupdate.do">
                                <input type="hidden" value="1" name="idT">
                                <%--从这里开始循环--%>
                                <c:forEach items="${htplist}" var="htp" varStatus="i">
                                    <div class="am-form-group">
                                        <input type="hidden" value="${htp.idEr}" name="idEr">
                                        <input type="hidden" value="${htp.idQ}" name="idQ">
                                        <div class="am-form-group">
                                            <label for="contextQ" class="am-u-sm-3 am-form-label">试题内容<span
                                                    class="tpl-form-line-small-title">context</span></label>
                                            <div class="am-u-sm-9">
                                            <textarea disabled class="" rows="6" id="contextQ"
                                                      placeholder="试题内容">${htp.questions.contextQ}</textarea>
                                            </div>
                                        </div>

                                        <label for="answerQ" class="am-u-sm-3 am-form-label">试题答案 <span
                                                class="tpl-form-line-small-title">answer</span></label>
                                        <div class="am-u-sm-9">
                                            <input type="text" class="tpl-form-input" id="answerQ"
                                                   value="${htp.questions.answerQ}" disabled>
                                        </div>

                                        <label for="answerXQ" class="am-u-sm-3 am-form-label">学生答案 <span
                                                class="tpl-form-line-small-title">answer</span></label>
                                        <div class="am-u-sm-9">
                                            <input type="text" class="tpl-form-input" id="answerXQ"
                                                   value="${htp.answerHtp}" disabled>
                                        </div>

                                        <label for="scoreHtp" class="am-u-sm-3 am-form-label">试题打分 <span
                                                class="tpl-form-line-small-title">score</span></label>
                                        <div class="am-u-sm-3">
                                            <label>总分:${htp.questions.scoreQ}</label>
                                        </div>
                                        <div class="am-u-sm-3">
                                            <input type="text" class="tpl-form-input" name="scoreHtp" id="scoreHtp"
                                                   value="${htp.scoreHtp}" disabled>
                                            <small>实际得分</small>
                                        </div>
                                    </div>
                                    <hr>
                                </c:forEach>
                                <%--这里结束循环--%>
                            </form>

                        </div>
                    </div>
                </div>
            </div>


        </div>
    </div>
</div>
</div>
<script src="../assets/js/amazeui.min.js"></script>
<script src="../assets/js/amazeui.datatables.min.js"></script>
<script src="../assets/js/dataTables.responsive.min.js"></script>
<script src="../assets/js/app.js"></script>

</body>

</html>

