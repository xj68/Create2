<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
  <head>
    <title>系统用户</title>
    <link rel="stylesheet" href="./list.css" type="text/css"></link>
  </head>
  <body>
  <div align="center">
  <h1 style="padding-top:20px;">项目结题审核</h1>
  <table width="920px" border="0">
  
  <hr>

  		<tr>
  		<td>
    <table width="1000" align="center" border="0">
  		<tr>
  		<td>
  			<form action="jietiList.action" method="post">
			项目名称:<input type="text" name="jieti.pname" value="<s:property value="jieti.pname" />" size="20" maxlength="20"/>
			<input type="submit" value="查询" class="input" onmouseover="this.style.backgroundColor='rgb(12, 254, 255)';" 
onmouseout="this.style.backgroundColor=' rgb(102, 204, 255)';"/>
  			</form>
  		</td>
  		</tr>
  	</table>
	<table width="1000" align="center" border="0">
  		<tr>
  			<td>
  			查询结果：共 <s:property value="#request.page.totalSize"/> 项。
  			</td>
  		</tr>
  	</table>
  	<table width="1000" align="center" border="1">
  		<tr align="center" class="tr">
  			<td>项目名称</td><td>学生姓名</td><td>所在院系</td><td>项目实施时间</td><td>指导教师</td><td>联系电话</td><td>填表日期</td><td>审核意见</td><td>操作</td>
  		</tr>
  		<s:iterator value="#request.list" id="jieti">
  		<tr align="center" class="tr1">
  		    <td><s:property value="#jieti.pname"/></td>
			<td><s:property value="#jieti.xingming"/></td>
			<td><s:property value="#jieti.yuanhexi"/></td>
			<td><s:property value="#jieti.shishi"/></td>
			<td><s:property value="#jieti.leaderteacher"/></td>
			<td><s:property value="#jieti.phone"/></td>
			<td><s:property value="#jieti.tianbiao"/></td>
			<td><li><s:property value="#jieti.jindu"/>
			<s:property value="%{getText('{0,date,yyyy-MM-dd HH:mm}', {#jieti.jtime1})}"/></li>
			<li><s:property value="#jieti.jindu1"/>
			<s:property value="%{getText('{0,date,yyyy-MM-dd HH:mm}', {#jieti.jtime2})}"/></li></td>
			
			<td align="center"> 
			 <a href="view6.action?jieti.pname=<s:property value="#jieti.pname"/>">审核</a> 
			</td>
		</tr>
		</s:iterator>
	</table>
	<table width="1000" align="center" border="0">
  		<tr align="center">
  		<td>
			<s:set name="page" value="#request.page"></s:set>
				<s:if test="#page.totalSize!=0">
					[第<s:property value="#page.pageNow"/>页/共<s:property value="#page.totalPage"/>页]
				</s:if> 
  				<s:if test="#page.hasFirst">
					<a href="shenhe6.action?pageNow=1&jieti.pname=<s:property value="jieti.pname"/>">首页</a>
				</s:if>
				<s:if test="#page.hasPre">
					<a href="shenhe6.action?pageNow=<s:property value="#page.pageNow-1"/>&jieti.pname=<s:property value="jieti.pname"/>">上一页</a>
				</s:if>
				<s:if test="#page.hasNext">
					<a href="shenhe6.action?pageNow=<s:property value="#page.pageNow+1"/>&jieti.pname=<s:property value="jieti.pname"/>">下一页</a>
				</s:if>
				<s:if test="#page.hasLast">
					<a href="shenhe6.action?pageNow=<s:property value="#page.totalPage"/>&jieti.pname=<s:property value="jieti.pname"/>">尾页</a>
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