<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
  <head>
    <title>系统用户</title>
    <link rel="stylesheet" href="./list.css" type="text/css"></link>
  </head>
  <script type="text/javascript">
function changeValue(){
    var btnVal=document.getElementById("s1");
    if(btnVal.value=="修改")
    {
        document.getElementById("s1").value="通道关闭,等待审核中…";
    }
    else{alert("通道已经关闭");}
}
function changeValue1(){
    var btnVal=document.getElementById("s2");
    if(btnVal.value=="增加")
    {
        document.getElementById("s1").value="通道关闭,等待审核中…";
    }
    else{alert("通道已经关闭");}
}
</script>
  <body>
  <div align="center">
  <h1 style="padding-top:20px;">项目申报表</h1>
  <table width="900px" border="0">
  
  <hr>

  		<tr>
  		<td>
    <table width="900" align="center" border="0">
  		<tr>		
  		<td>
  		<s:if test="#session.user1.quanxian!='关闭通道'">
			<a href="projectinformation1AddView.action" target="rightFrame"><img alt="" src="./images/add.jpg" ></a>
  			<a href="projectinformation1AddView.action" target="rightFrame">增加</a>
			</s:if>
			<s:if test="#session.user1.quanxian=='关闭通道'">
			<img alt="" src="./images/add.jpg" >
			<a name="s2" id="s2" value="修改" onclick="changeValue();">增加</a>
			</s:if>
  			
  		</td>
  		</tr>
  	</table>
	<table width="900" align="center" border="0">
  		<tr>
  			<td>
  			查询结果：共 <s:property value="#request.page.totalSize"/> 项。
  			</td>
  		</tr>
  	</table>
  	<table width="900" align="center" border="1">
  		<tr align="center" class="tr">
  			<td>项目名称</td><td>学校名称</td><td>项目负责人信息</td><td>指导老师信息</td><td>申报时间</td><td>进度</td><td>项目所属一级学科</td><td>项目科类</td><td>操作</td>
  		</tr>
  		<s:iterator value="#request.list" id="projectinformation1">
  		<tr align="center" class="tr1">
  		    <td><s:property value="#projectinformation1.pname"/></td>
			<td><s:property value="#projectinformation1.sname"/></td>
			<td><s:property value="#projectinformation1.leadername"/><br>
			<s:property value="#projectinformation1.leadernum"/><br>
			<s:property value="#projectinformation1.zhuanye"/><br>
			<s:property value="#projectinformation1.sex"/><br>
			<s:property value="#projectinformation1.year"/></td>
			<td><s:property value="#projectinformation1.leadteacher"/><br>
			<s:property value="#projectinformation1.rank"/></td>
			<td><s:property value="%{getText('{0,date,yyyy-MM-dd HH:mm}', {#projectinformation1.ptime1})}"/></td>
			<td align="left"><li><s:property value="#projectinformation1.jindu"/>
			<s:property value="%{getText('{0,date,yyyy-MM-dd HH:mm}', {#projectinformation1.stime1})}"/></li><br />
			<li><s:property value="#projectinformation1.jindu1"/>
			<s:property value="%{getText('{0,date,yyyy-MM-dd HH:mm}', {#projectinformation1.stime2})}"/></li><br />
			<li><s:property value="#projectinformation1.jindu2"/>
			<s:property value="%{getText('{0,date,yyyy-MM-dd HH:mm}', {#projectinformation1.stime3})}"/></li>
			</td>			
			<td><s:property value="#projectinformation1.yijixueke"/></td>
			<td><s:property value="#projectinformation1.kemu"/></td>
			<td align="center">
			<s:if test="#session.user1.quanxian!='关闭通道'">
			 <a href="projectinformation1Delete.action?projectinformation1.pname=<s:property value="#projectinformation1.pname"/>" onClick="if(!confirm('确定删除吗？'))return false;else return true;">删除</a>
			<a href="projectinformation1UpdateView.action?projectinformation1.pname=<s:property value="#projectinformation1.pname"/>">修改</a>
			</s:if>
			<s:if test="#session.user1.quanxian=='关闭通道'">
			<a name="s1" id="s1" value="修改" onclick="changeValue();">修改</a>
			</s:if>
			</td>
		</tr>
		</s:iterator>
	</table>
	<table width="900" align="center" border="0">
  		<tr align="center">
  		<td>
			<s:set name="page" value="#request.page"></s:set>
				<s:if test="#page.totalSize!=0">
					[第<s:property value="#page.pageNow"/>页/共<s:property value="#page.totalPage"/>页]
				</s:if> 
  				<s:if test="#page.hasFirst">
					<a href="projectinformation1List1.action?pageNow=1&projectinformation.pname=<s:property value="projectinformation1.pname"/>">首页</a>
				</s:if>
				<s:if test="#page.hasPre">
					<a href="projectinformation1List1.action?pageNow=<s:property value="#page.pageNow-1"/>&projectinformation1.pname=<s:property value="projectinformation1.pname"/>">上一页</a>
				</s:if>
				<s:if test="#page.hasNext">
					<a href="projectinformation1List1.action?pageNow=<s:property value="#page.pageNow+1"/>&projectinformation1.pname=<s:property value="projectinformation1.pname"/>">下一页</a>
				</s:if>
				<s:if test="#page.hasLast">
					<a href="projectinformation1List1.action?pageNow=<s:property value="#page.totalPage"/>&projectinformation1.pname=<s:property value="projectinformation1.pname"/>">尾页</a>
				</s:if>
		</td>
  		</tr>
  	</table>
  </td>
  </tr>
  <tr>
  <td>
  <hr />
  </td>
  </tr>
  </table>
  </div>
  </body>
</html>	