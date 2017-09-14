<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理平台</title>
<link rel="stylesheet" type="text/css" href="${ctx}/resources/easyui/themes/metro/easyui.css">
<link rel="stylesheet" type="text/css" href="${ctx}/resources/easyui/themes/icon.css">
<script type="text/javascript" src="${ctx}/resources/easyui/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="${ctx}/resources/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${ctx}/resources/easyui/locale/easyui-lang-zh_CN.js"></script>
<link rel="stylesheet" type="text/css" href="${ctx}/resources/style/main.css">
<script type="text/javascript">
var treeData = [{"id":"65E16E3E1EFC484A8CBD2AD77D8D3F92","text":"布局例子","parentId":"",
	"children":[{"id":"6E62020D770346F08A4287FF205EEB8F","text":"基本布局","parentId":"65E16E3E1EFC484A8CBD2AD77D8D3F92","children":[],"checked":false,"attributes":{"menuId":"6E62020D770346F08A4287FF205EEB8F","menuName":"机构管理","menuUrl":"/app/page/sysgroup","parentMenuId":"65E16E3E1EFC484A8CBD2AD77D8D3F92","children":[]}},
	            {"id":"8C95B11FF4C042DDB3AF2C467B593295","text":"复合布局","parentId":"65E16E3E1EFC484A8CBD2AD77D8D3F92","children":[],"checked":false,"attributes":{"menuId":"8C95B11FF4C042DDB3AF2C467B593295","menuName":"修改密码","menuUrl":"/app/page/syspasswd","parentMenuId":"65E16E3E1EFC484A8CBD2AD77D8D3F92","children":[]}},
	            {"id":"21E4F72B9D274510AB219C33D792A4C4","text":"内嵌布局","parentId":"65E16E3E1EFC484A8CBD2AD77D8D3F92","children":[],"checked":false,"attributes":{"menuId":"21E4F72B9D274510AB219C33D792A4C4","menuName":"用户管理","menuUrl":"/app/page/sysuser","parentMenuId":"65E16E3E1EFC484A8CBD2AD77D8D3F92","children":[]}}],
	            "checked":false,"attributes":{"menuId":"65E16E3E1EFC484A8CBD2AD77D8D3F92","menuName":"系统管理","menuUrl":"","parentMenuId":"","children":[]}},
	            {"id":"65E16E3E1EFC484A8CBD2AD77D8D3F93","text":"DataTable例子","parentId":"",
	"children":[{"id":"6E62020D770346F08A4287FF205EEB9F","text":"基本数据表","parentId":"65E16E3E1EFC484A8CBD2AD77D8D3F93","children":[],"checked":false,"attributes":{"menuId":"6E62020D770346F08A4287FF205EEB8F","menuName":"机构管理","menuUrl":"/app/page/sysgroup","parentMenuId":"65E16E3E1EFC484A8CBD2AD77D8D3F92","children":[]}},
				{"id":"8C95B11FF4C042DDB3AF2C467B593285","text":"页码与行号","parentId":"65E16E3E1EFC484A8CBD2AD77D8D3F93","children":[],"checked":false,"attributes":{"menuId":"21E4F72B9D274510AB219C33D792A4C4","menuName":"用户管理","menuUrl":"/app/page/sysuser","parentMenuId":"65E16E3E1EFC484A8CBD2AD77D8D3F92","children":[]}}],
				"checked":false,"attributes":{"menuId":"65E16E3E1EFC484A8CBD2AD77D8D3F93","menuName":"DataTable例子","menuUrl":"","parentMenuId":"","children":[]}}];



$(function(){
	$('#menu_tree').tree({
		checkbox: false,
		animate:true,
		lines:true,
		data: treeData,
		onClick:function(node) {
			if (node.attributes && node.attributes.menuUrl) {
				$('#show_win').panel('refresh','${ctx}' + node.attributes.menuUrl);
				$('body').layout('panel', 'center').panel('setTitle', node.text);
			} 
		},
		formatter: function(node) {
			return node.text + "-";
		}
	});
	$('#show_win').panel({
				fit:true,
				border:false,
				noheader:false
	});
});

</script>
</head>
<body class="easyui-layout">

<div data-options="region:'north'" style="height:50px;overflow:hidden;">
  <h1>管理平台</h1>
  <div id="login_user_info">欢迎你：${currentUser.name}. <a href="${ctx}/mgr/logout">退出</a></div>
</div>

<div data-options="region:'west',split:true,title:'导航窗口',iconCls:'icon-help'" style="width:248px;padding:5px; text-align:left;">
	<ul id="menu_tree" class="easyui-tree"></ul>
</div>
<div data-options="region:'center'" title="主窗口" style=" padding:10px; text-align:left;">
  <div id="show_win"></div>
</div>

<script>
/**
setInterval(function() {
	var url = '${ctx}/mgr/checkSession';
	$.get(url, function(result) {
		if (! result.successful) {
			window.location.href="${ctx}";
		}
	}, 'json');
}, 60000);
*/
</script>
</body>
</html>
