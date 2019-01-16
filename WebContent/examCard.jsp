<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="stu.gx.dao.*"%>
<%@ page import="stu.gx.bean.*"%>
<%@ page import="stu.gx.dao.impl.*"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>学生考试管理系统</title>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.0.272/jspdf.debug.js"></script>
<script
	src="https://cdn.bootcss.com/html2canvas/0.5.0-beta4/html2canvas.js"></script>
<script src="js/jquery-2.2.3.min.js"></script>
</head>

<script type="text/javascript">
	function download() {
		var element = $("#demo"); // 这个dom元素是要导出pdf的div容器
		var w = element.width(); // 获得该容器的宽
		var h = element.height(); // 获得该容器的高
		var offsetTop = element.offset().top; // 获得该容器到文档顶部的距离
		var offsetLeft = element.offset().left; // 获得该容器到文档最左的距离
		var canvas = document.createElement("canvas");
		var abs = 0;
		var win_i = $(window).width(); // 获得当前可视窗口的宽度（不包含滚动条）
		var win_o = window.innerWidth; // 获得当前窗口的宽度（包含滚动条）
		if (win_o > win_i) {
			abs = (win_o - win_i)
			/2;    / / 获得滚动条长度的一半
		}
		canvas.width = w * 2; // 将画布宽&&高放大两倍
		canvas.height = h * 2;
		var context = canvas.getContext("2d");
		context.scale(2, 2);
		context.translate(-offsetLeft - abs, -offsetTop);
		// 这里默认横向没有滚动条的情况，因为offset.left(),有无滚动条的时候存在差值，因此        
		// translate的时候，要把这个差值去掉
		html2canvas(element).then(
				function(canvas) {
					var contentWidth = canvas.width;
					var contentHeight = canvas.height;
					//一页pdf显示html页面生成的canvas高度;
					var pageHeight = contentWidth / 592.28 * 841.89;
					//未生成pdf的html页面高度
					var leftHeight = contentHeight;
					//页面偏移
					var position = 0;
					//a4纸的尺寸[595.28,841.89]，html页面生成的canvas在pdf中图片的宽高
					var imgWidth = 595.28;
					var imgHeight = 592.28 / contentWidth * contentHeight;

					var pageData = canvas.toDataURL('image/jpeg', 1.0);

					var pdf = new jsPDF('', 'pt', 'a4');

					//有两个高度需要区分，一个是html页面的实际高度，和生成pdf的页面高度(841.89)
					//当内容未超过pdf一页显示的范围，无需分页
					if (leftHeight < pageHeight) {
						pdf.addImage(pageData, 'JPEG', 0, 0, imgWidth,
								imgHeight);
					} else { // 分页
						while (leftHeight > 0) {
							pdf.addImage(pageData, 'JPEG', 0, position,
									imgWidth, imgHeight)
							leftHeight -= pageHeight;
							position -= 841.89;
							//避免添加空白页
							if (leftHeight > 0) {
								pdf.addPage();
							}
						}
					}
					pdf.save('我的简历.pdf');
				})
	}
</script>



<body>


	<table align="center" id="demo" width="500" height="600" border=3
		style="background-color: white">
		<tbody>
			<%
				int exam_id = Integer.parseInt(request.getParameter("exam_id"));
				int ei = Integer.parseInt(request.getParameter("exam_id"));
				ExamDao ED = new ExamDaoImpl();
				exam e1 = ED.getOneExam(ei);
				int user_id = Integer.parseInt(request.getParameter("user_id"));
				UserDao userd = new UserDaoImpl();
				user userinfo = userd.getUserbyID(user_id);
				SignUpDao signD = new SignUpDaoImpl();
				List<signup> allsignup = signD.getAllsignup();
				int flag = 1;
				signup sf = new signup();
				for (signup su1 : allsignup) {
					if (su1.getExam_id() == exam_id && su1.getUser_id() == user_id) {
						flag = 0;
						sf = su1;
						break;
					}
				}
				if (flag == 0) {
			%>
			<tr style="padding: 0;">
				<td colspan="3">准考证号:&nbsp;&nbsp;&nbsp;<%=sf.getExamcard_number()%><br>
					姓名:&nbsp;&nbsp;&nbsp;<%=userinfo.getName()%><br>
					性别:&nbsp;&nbsp;&nbsp;<%=userinfo.getSex()%><br>
					身份证号:&nbsp;&nbsp;&nbsp;<%=userinfo.getIdentify()%><br> <%
 	ExamRoomDao erd = new ExamRoomDaoImpl();
 		exam_room er = erd.getRoomInfo(sf.getRoom_id());
 %> 考场地点：<%=er.getRoom_address()%>
				</td>
			</tr>
			<tr>
				<td width="30%" height="25" align="center">考试名称</td>
				<td width="30%" height="25" align="center">考场信息</td>
				<td width="30%" height="25" align="center">考试时间</td>
			</tr>
			<tr>
				<td width="30%" height="25" align="center"><%=e1.getExam_name()%></td>
				<td width="30%" height="25" align="center"><%=er.getRoom_name()%>(座号：<%=sf.getSeat_num()%>)</td>
				<td width="30%" height="25" align="center"><%=e1.getTime().toString().substring(0, 19)%></td>
			</tr>

			<tr>
				<td colspan="3">考试简介：<%=e1.getIntroduce()%></td>
			</tr>
			<%
				}
			%>
			<tr>
				<td colspan="3">考生须知：<br>
					<p>1、考试中不得以任何方式作弊或帮助他人作弊，违者将按规定给以处罚。</p>
					<p>2、在答题卡上答题，选择题用2B铅笔填涂，填空题用蓝、黑色钢笔或圆珠笔答题。</p>
					<p>3、保持考场安静，不得吸烟，不得喧哗。</p>
					<p>4、考生进入考场后须按准考证上的位置入座，否则按违规处理。</p>
					<p>5、考生须听从监考教师指令，在规定时间打开试卷、作答和停止作答，否则按违规处理。</p>
				</td>
			</tr>
		</tbody>

	</table>

</body>
</html>