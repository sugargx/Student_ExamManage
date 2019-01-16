<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="stu.gx.bean.*"%>
<%@ page import="stu.gx.dao.*"%>
<%@ page import="java.util.*"%>
<%@ page import="stu.gx.jdbc.*"%>
<%@ page import="stu.gx.dao.ExamDao"%>
<%@ page import="stu.gx.bean.exam"%>
<%@ page import="stu.gx.dao.impl.*"%>

<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>学生考试管理系统</title>

<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" type="text/css" href="../css/vendor.css">
<link rel="stylesheet" type="text/css" href="../css/flat-admin.css">
<link rel="stylesheet" type="text/css" href="../css/font-awesome.min.css">
<script src="../js/off-canvas.js"></script>
<script src="../js/chart.js"></script>
<script src="../js/vendor.bundle.base.js"></script>
<script src="../js/vendor.bundle.addons.js"></script>


<style type="text/css">
th::after {
	content: "" !important;
}
</style>
<script type="text/javascript">
	$(function() {
		/* ChartJS
		 * -------
		 * Data and config for chartjs
		 */
<%int exam_id = Integer.parseInt(request.getParameter("exam_id"));
			System.out.println(exam_id);
			SignUpDao signd = new SignUpDaoImpl();
			List<signup> x1 = signd.getScore1(exam_id);
			List<signup> x2 = signd.getScore2(exam_id);
			List<signup> x3 = signd.getScore3(exam_id);
			List<signup> x4 = signd.getScore4(exam_id);
			List<signup> x5 = signd.getScore5(exam_id);
			int sumx = x1.size() + x2.size() + x3.size() + x4.size() + x5.size();%>
	'use strict';
		var data = {
			labels : [ "90~100", "80~90", "70~80", "60~70", "<60" ],
			datasets : [ {
				label : '人数：',
				data : [
<%=x1.size()%>
	,
<%=x2.size()%>
	,
<%=x3.size()%>
	,
<%=x4.size()%>
	,
<%=x5.size()%>
	],
				backgroundColor : [ 'rgba(255, 99, 132, 0.2)',
						'rgba(54, 162, 235, 0.2)', 'rgba(255, 206, 86, 0.2)',
						'rgba(75, 192, 192, 0.2)', 'rgba(153, 102, 255, 0.2)',

				],
				borderColor : [ 'rgba(255,99,132,1)', 'rgba(54, 162, 235, 1)',
						'rgba(255, 206, 86, 1)', 'rgba(75, 192, 192, 1)',
						'rgba(153, 102, 255, 1)', ],
				borderWidth : 1,
				fill : false
			} ]
		};
		var multiLineData = {
			labels : [ "Red", "Blue", "Yellow", "Green", "Purple" ],
			datasets : [ {
				label : 'Dataset 1',
				data : [ 12, 19, 3, 5, 2, 3 ],
				borderColor : [ '#587ce4' ],
				borderWidth : 2,
				fill : false
			}, {
				label : 'Dataset 2',
				data : [ 5, 23, 7, 12, 42, 23 ],
				borderColor : [ '#ede190' ],
				borderWidth : 2,
				fill : false
			}, {
				label : 'Dataset 3',
				data : [ 15, 10, 21, 32, 12, 33 ],
				borderColor : [ '#f44252' ],
				borderWidth : 2,
				fill : false
			} ]
		};
		var options = {
			scales : {
				yAxes : [ {
					ticks : {
						beginAtZero : true
					}
				} ]
			},
			legend : {
				display : false
			},
			elements : {
				point : {
					radius : 0
				}
			}

		};
		var doughnutPieData = {
			datasets : [ {
				data : [
<%=x5.size()%>
	,
<%=sumx - x5.size()%>
	],
				backgroundColor : [ 'rgba(255, 99, 132, 0.5)',
						'rgba(54, 162, 235, 0.5)', 'rgba(255, 206, 86, 0.5)',
						'rgba(75, 192, 192, 0.5)', 'rgba(153, 102, 255, 0.5)',
						'rgba(255, 159, 64, 0.5)' ],
				borderColor : [ 'rgba(255,99,132,1)', 'rgba(54, 162, 235, 1)',
						'rgba(255, 206, 86, 1)', 'rgba(75, 192, 192, 1)',
						'rgba(153, 102, 255, 1)', 'rgba(255, 159, 64, 1)' ],
			} ],

			// These labels appear in the legend and in the tooltips when hovering different arcs
			labels : [ '不合格人数', '合格人数', ]
		};
		var doughnutPieOptions = {
			responsive : true,
			animation : {
				animateScale : true,
				animateRotate : true
			}
		};
		var areaData = {
			labels : [ "2013", "2014", "2015", "2016", "2017" ],
			datasets : [ {
				label : '# of Votes',
				data : [ 12, 19, 3, 5, 2, 3 ],
				backgroundColor : [ 'rgba(255, 99, 132, 0.2)',
						'rgba(54, 162, 235, 0.2)', 'rgba(255, 206, 86, 0.2)',
						'rgba(75, 192, 192, 0.2)', 'rgba(153, 102, 255, 0.2)',
						'rgba(255, 159, 64, 0.2)' ],
				borderColor : [ 'rgba(255,99,132,1)', 'rgba(54, 162, 235, 1)',
						'rgba(255, 206, 86, 1)', 'rgba(75, 192, 192, 1)',
						'rgba(153, 102, 255, 1)', 'rgba(255, 159, 64, 1)' ],
				borderWidth : 1,
				fill : true, // 3: no fill
			} ]
		};

		var areaOptions = {
			plugins : {
				filler : {
					propagate : true
				}
			}
		}

		var multiAreaData = {
			labels : [ "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug",
					"Sep", "Oct", "Nov", "Dec" ],
			datasets : [ {
				label : 'Facebook',
				data : [ 8, 11, 13, 15, 12, 13, 16, 15, 13, 19, 11, 14 ],
				borderColor : [ 'rgba(255, 99, 132, 0.5)' ],
				backgroundColor : [ 'rgba(255, 99, 132, 0.5)' ],
				borderWidth : 1,
				fill : true
			}, {
				label : 'Twitter',
				data : [ 7, 17, 12, 16, 14, 18, 16, 12, 15, 11, 13, 9 ],
				borderColor : [ 'rgba(54, 162, 235, 0.5)' ],
				backgroundColor : [ 'rgba(54, 162, 235, 0.5)' ],
				borderWidth : 1,
				fill : true
			}, {
				label : 'Linkedin',
				data : [ 6, 14, 16, 20, 12, 18, 15, 12, 17, 19, 15, 11 ],
				borderColor : [ 'rgba(255, 206, 86, 0.5)' ],
				backgroundColor : [ 'rgba(255, 206, 86, 0.5)' ],
				borderWidth : 1,
				fill : true
			} ]
		};

		var multiAreaOptions = {
			plugins : {
				filler : {
					propagate : true
				}
			},
			elements : {
				point : {
					radius : 0
				}
			},
			scales : {
				xAxes : [ {
					gridLines : {
						display : false
					}
				} ],
				yAxes : [ {
					gridLines : {
						display : false
					}
				} ]
			}
		}

		var scatterChartData = {
			datasets : [ {
				label : 'First Dataset',
				data : [ {
					x : -10,
					y : 0
				}, {
					x : 0,
					y : 3
				}, {
					x : -25,
					y : 5
				}, {
					x : 40,
					y : 5
				} ],
				backgroundColor : [ 'rgba(255, 99, 132, 0.2)' ],
				borderColor : [ 'rgba(255,99,132,1)' ],
				borderWidth : 1
			}, {
				label : 'Second Dataset',
				data : [ {
					x : 10,
					y : 5
				}, {
					x : 20,
					y : -30
				}, {
					x : -25,
					y : 15
				}, {
					x : -10,
					y : 5
				} ],
				backgroundColor : [ 'rgba(54, 162, 235, 0.2)', ],
				borderColor : [ 'rgba(54, 162, 235, 1)', ],
				borderWidth : 1
			} ]
		}

		var scatterChartOptions = {
			scales : {
				xAxes : [ {
					type : 'linear',
					position : 'bottom'
				} ]
			}
		}
		// Get context with jQuery - using jQuery's .get() method.
		if ($("#barChart").length) {
			var barChartCanvas = $("#barChart").get(0).getContext("2d");
			// This will get the first returned node in the jQuery collection.
			var barChart = new Chart(barChartCanvas, {
				type : 'bar',
				data : data,
				options : options
			});
		}

		if ($("#lineChart").length) {
			var lineChartCanvas = $("#lineChart").get(0).getContext("2d");
			var lineChart = new Chart(lineChartCanvas, {
				type : 'line',
				data : data,
				options : options
			});
		}

		if ($("#linechart-multi").length) {
			var multiLineCanvas = $("#linechart-multi").get(0).getContext("2d");
			var lineChart = new Chart(multiLineCanvas, {
				type : 'line',
				data : multiLineData,
				options : options
			});
		}

		if ($("#areachart-multi").length) {
			var multiAreaCanvas = $("#areachart-multi").get(0).getContext("2d");
			var multiAreaChart = new Chart(multiAreaCanvas, {
				type : 'line',
				data : multiAreaData,
				options : multiAreaOptions
			});
		}

		if ($("#doughnutChart").length) {
			var doughnutChartCanvas = $("#doughnutChart").get(0).getContext(
					"2d");
			var doughnutChart = new Chart(doughnutChartCanvas, {
				type : 'doughnut',
				data : doughnutPieData,
				options : doughnutPieOptions
			});
		}

		if ($("#pieChart").length) {
			var pieChartCanvas = $("#pieChart").get(0).getContext("2d");
			var pieChart = new Chart(pieChartCanvas, {
				type : 'pie',
				data : doughnutPieData,
				options : doughnutPieOptions
			});
		}

		if ($("#areaChart").length) {
			var areaChartCanvas = $("#areaChart").get(0).getContext("2d");
			var areaChart = new Chart(areaChartCanvas, {
				type : 'line',
				data : areaData,
				options : areaOptions
			});
		}

		if ($("#scatterChart").length) {
			var scatterChartCanvas = $("#scatterChart").get(0).getContext("2d");
			var scatterChart = new Chart(scatterChartCanvas, {
				type : 'scatter',
				data : scatterChartData,
				options : scatterChartOptions
			});
		}

		if ($("#browserTrafficChart").length) {
			var doughnutChartCanvas = $("#browserTrafficChart").get(0)
					.getContext("2d");
			var doughnutChart = new Chart(doughnutChartCanvas, {
				type : 'doughnut',
				data : browserTrafficData,
				options : doughnutPieOptions
			});
		}
	});
</script>
<body>
</head>
<body>
	<div class="app app-default">
		<aside class="app-sidebar" id="sidebar" style="height: auto">
			<div class="sidebar-header">
				<a class="sidebar-brand" href="index.html"><span
					class="highlight">学生考试管理</span>系统</a>
				<!-- 返回网站首页 -->
				<button type="button" class="sidebar-toggle">
					<i class="fa fa-times"></i>
				</button>
			</div>
			<div class="sidebar-menu">
				<ul class="sidebar-nav">
				
					<li class=""><a href="adminIndex.jsp">
							<div class="icon">
								<i class="fa fa-tasks" aria-hidden="true"></i>
							</div>
							<div class="title">首页</div>
					        </a>
					</li>
					
					<li class="dropdown"><a href="launchExam.jsp">
							<div class="icon">
								<i class="fa fa-tasks" aria-hidden="true"></i>
							</div>
							<div class="title">考试</div>
					</a>
						<div class="dropdown-menu">
							<ul>
								<li><a href="launchExam.jsp">发布考试</a></li>
								<li><a href="editexam.jsp">管理考试</a></li>
								<li><a href="allexam.jsp">查看考试</a></li>
							</ul>
						</div>
					</li>
					
					
					<li class="dropdown"><a href="addExamRoom.jsp">
							<div class="icon">
								<i class="fa fa-tasks" aria-hidden="true"></i>
							</div>
							<div class="title">考场</div>
					</a>
						<div class="dropdown-menu">
							<ul>
								<li><a href="addExamRoom.jsp">增加考场</a></li>
								<li><a href="manageExamRoom.jsp">管理考场</a></li>
								<li><a href="arrangeExamRoom.jsp">分配考场</a></li>
							</ul>
						</div>
					</li>
					
					<li class="dropdown active"><a href="arrangeScore.jsp">
							<div class="icon">
								<i class="fa fa-tasks" aria-hidden="true"></i>
							</div>
							<div class="title">成绩</div>
					</a>
						<div class="dropdown-menu">
							<ul>
								<li><a href="arrangeScore.jsp">更新成绩</a></li>
								<li><a href="analyzeScore.jsp">分析成绩</a></li>
							</ul>
						</div>
					</li>
					
					<li class="dropdown"><a href="signAudit.jsp">
							<div class="icon">
								<i class="fa fa-group" aria-hidden="true"></i>
							</div>
							<div class="title">报名审核</div>
					</a></li>
					
					
					<li class="dropdown"><a href="manageAdmin.jsp">
							<div class="icon">
								<i class="fa fa-group" aria-hidden="true"></i>
							</div>
							<div class="title">管理员管理</div>
					</a></li>
					
					<li class="dropdown"><a href="room_address.jsp">
							<div class="icon">
								<i class="fa fa-group" aria-hidden="true"></i>
							</div>
							<div class="title">考场地点管理</div>
					</a>
					</li>
					
					
					<li class="dropdown"><a href="userall.jsp">
							<div class="icon">
								<i class="fa fa-group" aria-hidden="true"></i>
							</div>
							<div class="title">查看用户</div>
					</a></li>
					
					
					
					
				</ul>
			</div>
			<div class="sidebar-footer">
				<ul class="menu">
					<li><a href="/" class="dropdown-toggle" data-toggle="dropdown">
							<i class="fa fa-cogs" aria-hidden="true"></i>
					</a></li>
					<li><a href="#"><span
							class="flag-icon flag-icon-th flag-icon-squared"></span></a></li>
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
							<li class="logo"><a class="navbar-brand" href="#"><span
									class="highlight">学生考试管理</span> 系统</a></li>
							<li>
								<button type="button" class="navbar-toggle">
									<img class="profile-img" src="../images/people.png">
								</button>
							</li>
						</ul>
						<ul class="nav navbar-nav navbar-left">
							<li class="navbar-brand"><img src="../images/logo.jpg"
								width="200px"></li>
							<li class="navbar-title">欢迎您管理员</li>
						</ul>
						<ul class="nav navbar-nav navbar-right">
							<li class="dropdown profile"><a
								href="/html/pages/profile.html" class="dropdown-toggle"
								data-toggle="dropdown"> <img class="profile-img"
									src="../images/people.png">
									<div class="title">您好</div>
							</a>
								<div class="dropdown-menu">
									<div class="profile-info">
										<h4 class="username">管理员您好</h4>
									</div>
									<ul class="action">
										<li><a href="/GradeMan/adminCheckLogout"> 退出 </a></li>
									</ul>
								</div></li>
						</ul>
					</div>
				</div>
			</nav>

			<div class="row">
				<div class="col-xs-12">
					<div class="card">
						<div class="card-header">成绩数据统计分析</div>
						
							<div class="col-lg-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">成绩分布柱状图</h4>
									<canvas id="barChart" style="height: 230px"></canvas>
									<%
										List<signup> ass = signd.getSignupExam(exam_id);
										double sum = 0;
										for (signup up1 : ass) {
											if(up1.getScore()>=0)
											{
												sum += up1.getScore();
											}
											
										}
										double avg = sum / sumx;
									%>
									<p>
										平均分：<%=avg%></p>

								</div>
							</div>
						</div>
						<div class="col-lg-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<div class="chartjs-size-monitor"
										style="position: absolute; left: 0px; top: 0px; right: 0px; bottom: 0px; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;">
										<div class="chartjs-size-monitor-expand"
											style="position: absolute; left: 0; top: 0; right: 0; bottom: 0; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;">
											<div
												style="position: absolute; width: 1000000px; height: 1000000px; left: 0; top: 0"></div>
										</div>
										<div class="chartjs-size-monitor-shrink"
											style="position: absolute; left: 0; top: 0; right: 0; bottom: 0; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;">
											<div
												style="position: absolute; width: 200%; height: 200%; left: 0; top: 0"></div>
										</div>
									</div>
									<h4 class="card-title">合格率</h4>
									<canvas id="doughnutChart"
										style="height: 204px; display: block; width: 409px;"
										width="409" height="204" class="chartjs-render-monitor"></canvas>
									<p>
										<%
											double rat = (1 - x5.size() / sumx) * 100;
										%>
										合格率：<%=rat%>%
									</p>
								</div>
							</div>
						</div>
							
							</div>
							</div>
						</div>
					</div>
				</div>
				
			</div>
		</div>

	</div>

	<script type="text/javascript" src="../js/vendor.js"></script>
	
	
	
	<script type="text/javascript" src="../js/app.js"></script>

</body>
</html>