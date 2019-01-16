<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>学生考试管理系统</title>

  <meta name="viewport" content="width=device-width, initial-scale=1">

  <link rel="stylesheet" type="text/css" href="css/vendor.css">
  <link rel="stylesheet" type="text/css" href="css/flat-admin.css">
  <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/css/bootstrap-select.min.css">

  <style type="text/css">
    th::after {
      content: "" !important;
    }
  </style>
</head>

<body>
  <div class="app app-default">
   <aside class="app-sidebar" id="sidebar" style="height: auto">
      <div class="sidebar-header">
        <a class="sidebar-brand" href="index.html"><span class="highlight">学生考试管理</span>系统</a>
        <!-- 返回网站首页 -->
        <button type="button" class="sidebar-toggle">
                <i class="fa fa-times"></i>
            </button>
      </div>
      <div class="sidebar-menu">
        <ul class="sidebar-nav">
          <li class="">
            <a href="adminIndex.jsp">
              <div class="icon">
                <i class="fa fa-tasks" aria-hidden="true"></i>
              </div>
              <div class="title">首页</div>
            </a>
          </li>
          <li class="dropdown">
            <a href="launchExam.jsp">
              <div class="icon">
                <i class="fa fa-group" aria-hidden="true"></i>
              </div>
              <div class="title">发布考试</div>
            </a>
          </li>
          <li class="dropdown">
            <a href="editexam.jsp">
              <div class="icon">
                <i class="fa fa-gear" aria-hidden="true"></i>
              </div>
              <div class="title">管理考试</div>
            </a>
            <!-- <div class="dropdown-menu"> -->
              <!-- <ul> -->
                <!-- <li><a href="userEdit.html">个人信息修改</a></li> -->
               <!--  <li><a href="passwordEdit.html">密码修改</a></li> -->
              <!-- </ul> -->
            <!-- </div> -->
          </li>

          <li class="dropdown active">
            <a href="allexam.jsp">
              <div class="icon">
                <i class="fa fa-tasks" aria-hidden="true"></i>
              </div>
              <div class="title">查看考试</div>
            </a>
            <div class="dropdown-menu">
              <ul>
                <li><a href="allexam.jsp">查看全部考试</a></li>
                <li><a href="signingexam.jsp">查看正在报名中考试</a></li>
                <li><a href="signedexam.jsp">查看报名已结束考试</a></li>
              </ul>
            </div>
          </li>
          
          <li class="dropdown">
            <a href="userall.jsp">
              <div class="icon">
                <i class="fa fa-group" aria-hidden="true"></i>
              </div>
              <div class="title">查看用户</div>
            </a>
          </li>
         
        </ul>
      </div>
      <div class="sidebar-footer">
        <ul class="menu">
          <li>
            <a href="/" class="dropdown-toggle" data-toggle="dropdown">
                        <i class="fa fa-cogs" aria-hidden="true"></i>
                    </a>
          </li>
          <li><a href="#"><span class="flag-icon flag-icon-th flag-icon-squared"></span></a></li>
        </ul>
      </div>
    </aside>


    <script type="text/ng-template" id="sidebar-dropdown.tpl.html">
      <div class="dropdown-background">
        <div class="bg"></div>
      </div>
      <div class="dropdown-container">
      </div>
    </script>

    <div class="app-container">

      <nav class="navbar navbar-default" id="navbar">
        <div class="container-fluid">
          <div class="navbar-collapse collapse in">
            <ul class="nav navbar-nav navbar-mobile">
              <li>
                <button type="button" class="sidebar-toggle">
                                <i class="fa fa-bars"></i>
                            </button>
              </li>
              <li class="logo">
                <a class="navbar-brand" href="#"><span class="highlight">学生考试管理</span> 系统</a>
              </li>
              <li>
                <button type="button" class="navbar-toggle">
                                <img class="profile-img" src="images/people.png">
                            </button>
              </li>
            </ul>
            <ul class="nav navbar-nav navbar-left">
              <li class="navbar-brand">
                <img src="images/logo.jpg" width="200px">
              </li>
              <li class="navbar-title">欢迎您管理员</li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
              <li class="dropdown profile">
                <a href="/html/pages/profile.html" class="dropdown-toggle" data-toggle="dropdown">
                                <img class="profile-img" src="images/people.png">
                                <div class="title">您好</div>
                            </a>
                <div class="dropdown-menu">
                  <div class="profile-info">
                    <h4 class="username">管理员您好</h4>
                  </div>
                  <ul class="action">
                    <li>
                      <a href="http://budcreate.com/userEdit">
                                            信息修改
                                        </a>
                    </li>
                    <li>
                      <a href="http://budcreate.com/logout">
                                            退出
                                        </a>
                    </li>
                  </ul>
                </div>
              </li>
            </ul>
          </div>
        </div>
      </nav>
    
    
    <div class="row">
       <div class="col-md-12 col-sm-12">
        <div class="card">
            <div class="card-header">
                <h3>
                    报名此考试用户
                </h3>
            </div>
            <div class="card-body">
                <table class="table">
                    <thead>
                        <th>用户账号</th>
                        <th>用户名字</th>
                        <th>身份证号</th>
                        <th>性别</th>
                        
                        <th>邮箱</th>
                        <th>所在城市</th>
                        <th>分数</th>
                        
                    </thead>
                    <tbody>
                        <tr>
                                <td>11</td>
                                <td>测试</td>
                                <td></td>
                                <td></td>
                          
                                <td><td>
                                <td><td>
                                <td><td>
                                   
              
                             
                            </tr>
                                                  
                                            </table>
                    <div class="dataTables_paginate paging_simple_numbers">
                        
                        <ul class="pagination">
        
                    <li class="disabled"><span>&laquo;</span></li>
        
                      <li class="active"><span>1</span></li>
                      <li><a href="http://www.dangaogao.com/admin/ordertype/0?page=2">2</a></li>
                      <li><a href="http://www.dangaogao.com/admin/ordertype/0?page=3">3</a></li>
                      <li><a href="http://www.dangaogao.com/admin/ordertype/0?page=4">4</a></li>
                                                        
        
                    <li><a href="http://www.dangaogao.com/admin/ordertype/0?page=2" rel="next">&raquo;</a></li>
            </ul>

                    </div>
                </div>
                
                    
                        
                    
                
            </div>
        </div>
      </div>
            
    
    

    
    
    
      <footer class="app-footer">
        <div class="row">
          <div class="col-xs-12">
            <div class="footer-copyright">
              Copyright © 2018 PP
            </div>
          </div>
        </div>
      </footer>


    </div>

  </div>



  <script type="text/javascript" src="js/vendor.js"></script>
  <script type="text/javascript" src="js/app.js"></script>
  <!-- Latest compiled and minified JavaScript -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/js/bootstrap-select.min.js"></script>

  <!-- (Optional) Latest compiled and minified JavaScript translation files -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/js/i18n/defaults-*.min.js"></script>


</body>

</html>
