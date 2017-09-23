<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>流程列表</title>
</head>
<body>
	<div class="ui-widget">
			<div class="ui-state-highlight ui-corner-all" style="margin-top: 20px; padding: 0 .7em;"> 
				<p><span class="ui-icon ui-icon-info" style="float: left; margin-right: .3em;"></span>
				<strong>提示：</strong>${message}</p>
			</div>
		</div>
	<div style="text-align: right;padding: 2px 1em 2px">
		<div id="message" class="info" style="display:inline;"><b>提示：</b>点击xml或者png链接可以查看具体内容！</div>
		<a id='deploy' href='#'>部署流程</a>
		<a id='redeploy' href='${ctx }/workflow/redeploy/all' style="display:none">重新部署流程</a>
	</div>
	<fieldset id="deployFieldset" style="display: none">
		<legend>部署新流程</legend>
		<div><b>支持文件格式：</b>zip、bar、bpmn、bpmn20.xml</div>
		<form action="${ctx }/workflow/deploy" method="post" enctype="multipart/form-data">
			<input type="file" name="file" />
			<input type="submit" value="Submit" />
		</form>
	</fieldset>
	<table width="100%" class="need-border">
		<thead>
			<tr>
				<th>ProcessDefinitionId</th>
				<th>DeploymentId</th>
				<th>名称</th>
				<th>KEY</th>
				<th>版本号</th>
				<th>XML</th>
				<th>图片</th>
				<th>部署时间</th>
				<th>是否挂起</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${result }" var="process">
				<tr>
					<td>${process.id }</td>
					<td>${process.deploymentId }</td>
					<td>${process.name }</td>
					<td>${process.key }</td>
					<td>${process.version }</td>
					<td><a target="_blank" href='${ctx }/workflow/model/read-resource?pdid=${process.id }&resourceName=${process.resourceName }'>${process.resourceName }</a></td>
					<td><a target="_blank" href='${ctx }/workflow/model/read-resource?pdid=${process.id }&resourceName=${process.diagramResourceName }'>${process.diagramResourceName }</a></td>
					<td>${deployment.deploymentTime }</td>
					<td>${process.suspended} |
						<c:if test="${process.suspended }">
							<a href="processdefinition/update/active/${process.id}">激活</a>
						</c:if>
						<c:if test="${!process.suspended }">
							<a href="processdefinition/update/suspend/${process.id}">挂起</a>
						</c:if>
					</td>
					<td>
                        <a href='${ctx }/workflow/process/delete?deploymentId=${process.deploymentId}'>删除</a>
                        <a href='${ctx }/workflow/process/convert-to-model/${process.id}'>转换为Model</a>
                    </td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>