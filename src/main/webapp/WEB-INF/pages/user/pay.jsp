<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>确认互换</title>
    <link rel="icon" href="<%=basePath%>img/logo.jpg" type="image/x-icon"/>
    <link rel="stylesheet" href="<%=basePath%>css/font-awesome.min.css"/>
    <link rel="stylesheet" href="<%=basePath%>css/userhome.css"/>
    <link rel="stylesheet" href="<%=basePath%>css/user.css"/>

    <!-- bootstrap -->
    <link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css"/>
    <script type="text/javascript" src="<%=basePath%>js/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/bootstrap.min.js"></script>

    <!--编号随机数（有可能重复，得处理）  -->
    <script type="text/javascript">
        window.onload = function () {
            var o = document.getElementsByClassName('order-num');

            o[0].value = fRandomBy(00000000, 99999999);
        }
        function fRandomBy(under, over) {
            switch (arguments.length) {
                case 1:
                    return parseInt(Math.random() * under + 1);
                case 2:
                    return parseInt(Math.random() * (over - under + 1) + under);
                default:
                    return 0;
            }
        }
    </script>


</head>
<body>
<div class="pre-2" id="big_img">
    <img
            src="http://findfun.oss-cn-shanghai.aliyuncs.com/images/head_loading.gif"
            class="jcrop-preview jcrop_preview_s">
</div>
<div id="cover" style="min-height: 639px;">
    <div id="user_area">
        <div id="home_header">
            <a href="<%=basePath%>goods/homeGoods">
                <h1 class="logo"></h1>
            </a>
            <a href="<%=basePath%>goods/homeGoods">
                <img src="<%=basePath%>img/home_header.png" style="margin-left: 20px;">
            </a>
            <a href="<%=basePath%>user/home">
                <div class="home"></div>
            </a>
        </div>

        <div id="user_nav">
            <div class="user_info">
                <div class="head_img">
                    <img src="<%=basePath%>img/photo.jpg">
                </div>
                <div class="big_headimg">
                    <img src="">
                </div>
                <span class="name">${cur_user.username}</span>
                <hr>
            </div>
            <div class="home_nav">
                <ul>
                    <a href="<%=basePath%>orders/myOrders">
                        <li class="notice">
                            <div></div>
                            <span>交换中心</span> <strong></strong>
                        </li>
                    </a>
                    <a href="<%=basePath%>user/allFocus">
                        <li class="fri">
                            <div></div>
                            <span>关注列表</span> <strong></strong>
                        </li>
                    </a>
                    <a href="<%=basePath%>goods/publishGoods">
                        <li class="store">
                            <div></div>
                            <span>发布物品</span> <strong></strong>
                        </li>
                    </a>
                    <a href="<%=basePath%>user/allGoods">
                        <li class="second">
                            <div></div>
                            <span>我的闲置</span> <strong></strong>
                        </li>
                    </a>
                    <a href="<%=basePath%>user/basic">
                        <li class="set">
                            <div></div>
                            <span>个人设置</span> <strong></strong>
                        </li>
                    </a>
                </ul>
            </div>
        </div>

        <div id="user_content">

            <div class="share">

                <h1 style="text-align: center">确认交换</h1>
                <hr/>
                <div class="share_content">
                    <div class="story">
                        <form class="form-horizontal" role="form" action="<%=basePath%>orders/addOrders">
                            <h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;交换编号： <input name="orderNum" class="order-num"
                                                                                 type="text"
                                                                                 style="border:0px;background:rgba(0, 0, 0, 0);"
                                                                                 value=""/> <input name="goodsId"
                                                                                                   type="hidden"
                                                                                                   value="${goodsExtend.goods.id}"/>
                            </h4>
                            <div class="form-group">
                                <label for="firstname" class="col-sm-2 control-label">图片:</label>
                                <div class="col-sm-10">
                                    <img style="height:150px;weight:150px;"
                                         src="<%=basePath%>upload/${goodsExtend.images[0].imgUrl}"/>
                                </div>
                                <label for="firstname" class="col-sm-2 control-label">名称：</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" disabled="disabled"
                                           style="border:0px;background:rgba(0, 0, 0, 0); "
                                           value="${goodsExtend.goods.name}">
                                </div>
                                <label for="firstname" class="col-sm-2 control-label" >地址：</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control"
                                           placeholder="收获人信息 地址 联系方式等" value="" name="orderInformation">
                                </div>
                            </div>
                            <hr/>
                            <div class="form-group">
                                <div class="col-sm-offset-4 col-sm-8">
                                    <a href="<%=basePath%>goods/goodsId/${goodsExtend.goods.id}" class="btn btn-danger">取消交换</a>
                                    <button type="submit" class="btn btn-info">立即交换</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="recommend">
                <div class="title">
                    <span class="text">可能认识的人</span>
                    <span class="underline"></span>
                </div>
                <ul>
                    <c:forEach items="${users}" var="item" varStatus="status">
                        <li>
                            <a href="#" class="head_img">
                                <img src="<%=basePath%>img/photo${status.index + 1}.jpg">
                            </a>
                            <span>${item.username}</span>
                            <!-- <div class="fa fa-plus-square"></div> -->
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </div>
    </div>
</div>

</body>
</html>