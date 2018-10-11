<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>个人中心</title>
    <link rel="icon" href="<%=basePath%>img/logo.jpg" type="image/x-icon"/>
    <link rel="stylesheet" href="<%=basePath%>css/font-awesome.min.css" />
    <link rel="stylesheet" href="<%=basePath%>css/emoji.css" />
    <link rel="stylesheet" href="<%=basePath%>css/userhome.css" />
    <link rel="stylesheet" href="<%=basePath%>css/user.css" />
    <!-- bootstrap -->
    <link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css" />
    <script type="text/javascript" src="<%=basePath%>js/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/bootstrap.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/bootstrap-paginator.min.js"></script>
   <script type="text/javascript">
   
   function viewPersonal(id){
	   $.ajax({
			url:'<%=basePath%>admin/getUser',
			type:'GET',
			data:{id:id},
			dataType:'json',
			success:function(json){
				if(json){
					$('#myviewform').find("input[name='phone']").val(json.phone);
					$('#myviewform').find("input[name='username']").val(json.username);
					$('#myviewform').find("input[name='qq']").val(json.qq);
					$('#myviewform').find("input[name='power']").val(json.power);
					$('#myviewform').find("input[name='createAt']").val(json.createAt);
					$('#viewModal').modal('toggle');
				}
			},
			error:function(){
				alert('请求超时或系统出错!');
				$('#viewModal').modal('hide');
			}
   });
  }
   
   function sendContext(){
	 var context= $("#mycontext").text();
	 $.ajax({
		 url:'<%=basePath%>user/insertSelective',
		 type:'POST',
		 data:{context:context},
		 dataType:'json',
		 success:function(json){
			 alert(json.msg);
			  window.location.reload();
		 },
		error:function(){
			 alert('请求超时或系统出错!');
			}
	 });
	   
   }

   </script>
   
   
   <script type="text/javascript">
  
           //ajax获取后台数据
   
           function initTable() {
               $.ajax({ 
                   type: 'GET', 
                   dataType : 'json',
                   async:false,
                   url:'<%=basePath%>user/creatTable',
                   data: {page:1}, 
                   error: function () {//请求失败处理函数 
                       alert('请求失败'); 
                   },
                   success:function(data){ //请求成功后处理函数。 
                	   var htmlStr="";
                       $.each(data.notices, function(i, n) {
                    	   htmlStr += 
                    		   '<input type="button" class="btn btn-info" onclick="viewPersonal('+n.user.id+')" style="background-color: #c6f5f4;border:0px;outline:none;" value="'+n.user.username+'">'+
                    		   '<span>'+'说：'+
                    		   '</span>'+'<br>'+
                    		   '<div align="center">' + n.context +
	                    	    '</div>'+
	                    	    '<p style="text-align:right;color:#4fbef6;">'+n.createAt+
                                '</p>'+
                                '<hr>'+
                                '<br>';
	                    	    '';
                        });
   
                       $("#testTable").html(htmlStr); 
                        var pageCount = (data.pageCount+4)/5-1; //获取页数
                        if (pageCount % 5 != 0)
                        {
                        pageCount ++;
                        }
                        var currentPage = data.CurrentPage; //得到currentPage
                        
                        var options = {
   
                           bootstrapMajorVersion: 3, //版本
   
                           currentPage: currentPage, //当前页数
   
                           totalPages: pageCount, //总页数
   
                           numberOfPages: 8,
   
                           itemTexts: function (type, page, current) {
   
                               switch (type) {
   
                                   case "first":
   
                                       return "首页";
   
                                   case "prev":
   
                                       return "上一页";
   
                                   case "next":
   
                                       return "下一页";
   
                                   case "last":
   
                                       return "末页";
   
                                   case "page":
   
                                       return page;
                               }
   
                           }//点击事件，用于通过Ajax来刷新整个list列表
   
                           ,onPageClicked: function (event, originalEvent, type, page) {
   
                               $.ajax({
                                   url: '<%=basePath%>user/creatTable',
                                   type: 'GET',
                                   dataType : 'json',
                                   data: {page:page} ,
                                   success: function (data) {
                                	   var htmlStr="";
                                	   $.each(data.notices, function(i, n) {
                                    	   htmlStr += 
                                    		   '<input type="button" class="btn btn-info" onclick="viewPersonal('+n.user.id+')" style="background-color: #c6f5f4;border:0px;outline:none;" value="'+n.user.username+'">'+
                                    		   '<span>'+'说：'+
                                    		   '</span>'+'<br>'+
                                    		   '<div align="center">' + n.context +
                	                    	    '</div>'+
                	                    	    '<p style="text-align:right;color:#4fbef6;">'+n.createAt+
                                                '</p>'+
                                                '<hr>'+
                                                '<br>';
                	                    	    '';
                                        });
                                       $("#testTable").html(htmlStr); 
                                   }
                               });
                           }
                       };
                       $('#example').bootstrapPaginator(options);
                   } 
               });               
           }
           
           $(document).ready(function(){
               initTable();
           });
   
   </script>

</head>
<body>
<div class="pre-2" id="big_img">
    <img src="http://findfun.oss-cn-shanghai.aliyuncs.com/images/head_loading.gif" class="jcrop-preview jcrop_preview_s">
</div>
<div id="cover" style="min-height: 639px;">
    <div id="user_area">
        <div id="home_header">
            <a href="<%=basePath%>goods/homeGoods">
                <h1 class="logo"></h1>
            </a>
            <a href="<%=basePath%>goods/homeGoods">
                 <img src="<%=basePath%>img/home_header.png"  style="margin-left: 20px;" >
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
                            <span>交换中心</span>
                            <strong></strong>
                        </li>
                    </a>
                    <a href="<%=basePath%>user/allFocus">
                        <li class="fri">
                            <div></div>
                            <span>关注列表</span>
                            <strong></strong>
                        </li>
                    </a>
                    <a href="<%=basePath%>goods/publishGoods">
                        <li class="store">
                            <div></div>
                            <span>发布物品</span>
                            <strong></strong>
                        </li>
                    </a>
                    <a href="<%=basePath%>user/allGoods">
                        <li class="second">
                            <div></div>
                            <span>我的闲置</span>
                            <strong></strong>
                        </li>
                    </a>
                    <a href="<%=basePath%>user/basic">
                        <li class="set">
                            <div></div>
                            <span>个人设置</span>
                            <strong></strong>
                        </li>
                    </a>
                </ul>
            </div>
        </div>
        <div id="user_content">
            <div class="share">
            <img src="<%=basePath%>img/Advertisement.png">
                <div class="publish">
                	<form role="form" id="contextForm">
                     <div class="pub_content">
                        <div class="text_pub lead emoji-picker-container">
                            <input type="text" name="context" data-emojiable="converted"  class="form-control" data-type="original-input" style="display: none;"/>
                            <div class="emoji-wysiwyg-editor form-control" data-type="input" id="mycontext" contenteditable="true"></div>
                            <i class="emoji-picker-icon emoji-picker face" data-type="picker" style="top: 153px;"></i>
                            <div class="tag"></div>
                        </div>
                        <div class="img_pub">
                            <ul></ul>
                        </div>
                    </div>
                 	  </form>
                    <div class="button">
                        <span class="fa fa-image">
                            ::before
                            <input type="file" accept="image/gif,image/jpeg,image/jpg,image/png" multiple/>
                        </span>
                        <div class="checkbox">
                            <button onclick="sendContext()">发 布</button>
                        </div>
                    </div> 
                    
                </div>
                <div class="share_content">
                 <c:if test="${notice==null}">
                    <div class="no_share">
                    <span>没有任何内容，去逛逛其它的吧！</span>
                    </div>
                   </c:if>
                   <c:if test="${notice!=null}">
                    <div class="yes_share">
                    <h1 style="text-align: center;">求购信息</h1><hr>
			          <div  id='testTable' ></div>
			     	  <div style="text-align:center;">
			          <ul id="example"></ul>
			          </div>
		  			 </div>
                    </c:if>  
                    
                </div>
            </div>
            <div class="recommend">
                <div class="title">
                    <span class="text">可能认识的人</span>
                   <!--  <span class="change">换一组</span> -->
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
<!-- 模态框（Modal） -->
<div class="modal fade" id="viewModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title middle" id="myModalLabel">查看用户信息</h4>
            </div>
            <div class="modal-body" style="height: 220px;">
	         <form id="myviewform">
	          <div class="form-group">
	            <label for="recipient-name" class="control-label col-sm-2" >名称:</label>
	            <div class="col-sm-10">
	            <input type="text" class="form-control" id="message-text" name="username" readonly/>
	          </div>
	          </div>
	          <div class="form-group">
	            <label for="message-text" class="control-label col-sm-2">手机号:</label>
	            <div class="col-sm-10">
	            <input type="text" class="form-control" id="message-text" name="phone" readonly/>
	          </div> 
	          </div>
	           <div class="form-group">
	            <label for="message-text" class="control-label col-sm-2">qq号:</label>
	            <div class="col-sm-10">
	            <input type="text" class="form-control" id="message-text" name="qq" readonly/>
	          </div> 
	          </div>
	          <div class="form-group">
	            <label for="message-text" class="control-label col-sm-2">信用积分:</label>
	            <div class="col-sm-10">
	            <input type="text" class="form-control" id="message-text" name="power" readonly/>
	          </div>
	           </div>
	          <div class="form-group">
	            <label for="message-text" class="control-label col-sm-2">开户时间:</label>
	             <div class="col-sm-10">
	            <input type="text" class="form-control" id="message-text" name="createAt" readonly/>
	          </div>
	           </div>
	        </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
</body>
</html>