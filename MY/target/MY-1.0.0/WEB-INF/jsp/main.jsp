<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MY Community</title>
<style>
	#wrapper{
	width:80%;
	height:800px;
 	align-items: center;
 	margin:0 auto;
 	
	}
	.wrapbox{
		width:100%;
		height:400px;
		text-align: center;
		margin:0 auto;
		align-items:center;
		
		}
	
	.box{
		display:inline-block;
		width:300px;
		height:100px;
		text-align: center;
  		
 		align-items: center;
 		border:3px solid black;
 		margin : 0 auto;
 		
	h1{
		padding-top : 10px;
		align-items: center;
  		text-align: center;
	}
</style>
</head>
<body>
	<div id="wrapper">
		<div class="wrapbox">
		<div onclick="location.href='bustime.do'" class="box">
			<h1>버스시간표</h1>
		</div>
		
		<div onclick="location.href='busroute.do'" class="box">
			<h1>버스루트</h1>
		</div>
		</div>
		<div class="wrapbox">
		<div onclick="location.href='delivery.do'" class="box">
			<h1>배달</h1>
		</div>
		
		<div onclick="location.href='tradeListPage.do'" class="box">
			<h1>중고책</h1>
		</div>
		</div>
	</div>
</body>
</html>