<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
<script type="text/javascript">
$(document).ready(function() {
$('#insertStation').on('click', function(){
	var stationName = $('#stationName').val();
	$.ajax({
		url:'trainTimeList.do',
		type:"GET",
		data:{"stationName":stationName},
		dataType:"json",
		success:function(result){
			if (result) {
				
				var traintimehead = $('#traintimehead');
				traintimehead.css({
					"border":"1px solid black"
				});
				var traintimebody = $('#traintimebody');
  				traintimebody.empty();
  				
  				traintimebody.append(
  					'<tr><th>출발지</th><th>출발시간</th><th>도착지</th><th>도착시간</th><th style="width:200px;">열차</th></tr>'	
  				);
  				
				result.items.forEach(function(item) {
  					traintimebody.append(
                        '<tr><td>' + item.depplacename + '</td><td>' + item.depplandtime + '</td><td>' + item.arrplacename + '</td><td>'
                        + item.arrplandtime + '</td><td style="width:200px;">' + item.traingradename + '</td></tr>'
                    );
                });
	  				
	          } else {
	              alert("전송된 값 없음");
	          }
		},
	      error: function() {
	          alert("에러 발생");
	      }
			
		
	});
});
});
</script>
<script>
	function doDisplayweekday(){
		var weekday = document.getElementById("weekday");
		var weekend = document.getElementById("weekend");
		weekday.style.display='block';
		weekend.style.display='none';
	}
	
	function doDisplayweekend(){
		var weekday = document.getElementById("weekday");
		var weekend = document.getElementById("weekend");
		weekday.style.display='none';
		weekend.style.display='block';
	}
</script>
<style>
	#header{
		width:100%;
		height:100px;
		display:inline-block;
	}
	#head{
		width:100%;
		height:100px;
		display:flex;
		align-content: center;
    	justify-content: space-evenly;
    	align-items: center;
    	font-size:30px;
	}
	
	#section{
		width:50%;
		font-size:23px;
		float:left;
	}
	#tableWrap{
		width:50%;
		float:left;
	}
	.timeTable{
		width:500px;
		display:flex;
	}
	.timeTable th, .timeTable td{
		width:166px;
		text-align: center; 
 		vertical-align: middle;
	}
	form{
		margin-left:30px;
		height:100px;
		display:flex;
		align-items: center;
	}
	
	#traintimehead{
		width:600px;
	}
	
	#traintimebody{
		width:600px;
		display:flex;
		flex-direction: column;
	}
	#traintimebody th, #traintimebody td{
		width:100px;
		text-align: center; 
 		vertical-align: middle;
	}
	.train{
		width:200px;
	}
	
</style>
</head>
<body>
	<div style="margin: auto;">
			<button type="button" onclick="window.location.href='main.do'">메인화면</button>
	</div>
<div id="section">
	<div id="header">
		<div id="head">
			<div class="day">
				<a href="javascript:doDisplayweekday();">평일</a>
			</div>
			<div class="day">
				<a href="javascript:doDisplayweekend();">주말</a>
			</div>
			
		</div>
	</div>
	
	<div class="wrap">
		<table id="weekday" class="timeTable" style="border:1px solid black;margin-left:auto;margin-right:auto;">
			<tr>
				<th>번호</th>
				<th>부산대</th>
				<th>밀양역</th>
			</tr>
			<tr>
				<td>1</td>
				<td>7:02</td>
				<td>7:18</td>
			</tr>
			<tr>
				<td>2</td>
				<td>7:20</td>
				<td>7:32</td>
			</tr>
			<tr>
				<td>3</td>
				<td>7:37</td>
				<td>7:56</td>
			</tr>
			<tr>
				<td>4</td>
				<td>8:40</td>
				<td>8:52</td>
			</tr>
			<tr>
				<td>5</td>
				<td>8:57</td>
				<td>9:12</td>
			</tr>
			<tr>
				<td>6</td>
				<td>9:06</td>
				<td>9:20</td>
			</tr>
			<tr>
				<td>7</td>
				<td>9:46</td>
				<td>10:00</td>
			</tr>
			<tr>
				<td>8</td>
				<td>9:58</td>
				<td>10:12</td>
			</tr>
			<tr>
				<td>9</td>
				<td>10:16</td>
				<td>10:30</td>
			</tr>
			<tr>
				<td>10</td>
				<td>10:38</td>
				<td>10:52</td>
			</tr>
			<tr>
				<td>11</td>
				<td>12:18</td>
				<td>12:34</td>
			</tr>
			<tr>
				<td>12</td>
				<td>12:00</td>
				<td>12:16</td>
			</tr>
			<tr>
				<td>13</td>
				<td>13:28</td>
				<td>13:44</td>
			</tr>
			<tr>
				<td>14</td>
				<td>13:05</td>
				<td>13:16</td>
			</tr>
			<tr>
				<td>15</td>
				<td>13:50</td>
				<td>14:00</td>
			</tr>
			<tr>
				<td>16</td>
				<td>14:30</td>
				<td>14:40</td>
			</tr>
			<tr>
				<td>17</td>
				<td>15:28</td>
				<td>15:44</td>
			</tr>
			<tr>
				<td>18</td>
				<td>15:20</td>
				<td>15:30</td>
			</tr>
			<tr>
				<td>19</td>
				<td>15:52</td>
				<td>16:00</td>
			</tr>
			<tr>
				<td>20</td>
				<td>16:19</td>
				<td>16:28</td>
			</tr>
			<tr>
				<td>21</td>
				<td>17:02</td>
				<td>17:16</td>
			</tr>
			<tr>
				<td>22</td>
				<td>17:42</td>
				<td>17:56</td>
			</tr>
			<tr>
				<td>23</td>
				<td>17:58</td>
				<td>18:08</td>
			</tr>
			<tr>
				<td>24</td>
				<td>18:42</td>
				<td>19:00</td>
			</tr>
			<tr>
				<td>25</td>
				<td>18:22</td>
				<td>18:32</td>
			</tr>
			<tr>
				<td>26</td>
				<td>19:08</td>
				<td>19:24</td>
			</tr>
			<tr>
				<td>27</td>
				<td>19:42</td>
				<td>19:50</td>
			</tr>
			<tr>
				<td>28</td>
				<td>20:04</td>
				<td>20:18</td>
			</tr>
			<tr>
				<td>29</td>
				<td>20:20</td>
				<td>20:30</td>
			</tr>
			<tr>
				<td>30</td>
				<td>20:57</td>
				<td>21:07</td>
			</tr>
			<tr>
				<td>31</td>
				<td>21:17</td>
				<td>21:28</td>
			</tr>
			<tr>
				<td>32</td>
				<td>22:12</td>
				<td>22:24</td>
			</tr>
			<tr>
				<td>33</td>
				<td>22:44</td>
				<td>23:00</td>
			</tr>
			<tr>
				<td>34</td>
				<td>23:12</td>
				<td>23:20</td>
			</tr>
		</table>
		</div>
		<div class="wrap">
		<table id="weekend"  class="timeTable" style="border:1px solid black;margin-left:auto;margin-right:auto;display:none;">
			<tr>
				<th>번호</th>
				<th>밀양역</th>
				<th>부산대</th>
			</tr>
			<tr>
				<td>1</td>
				<td>7:20</td>
				<td>7:35</td>
			</tr>
			<tr>
				<td>2</td>
				<td>8:40</td>
				<td>9:05</td>
			</tr>
			<tr>
				<td>3</td>
				<td>8:57</td>
				<td>9:10</td>
			</tr>
			<tr>
				<td>4</td>
				<td>10:38</td>
				<td>10:55</td>
			</tr>
			<tr>
				<td>5</td>
				<td>12:18</td>
				<td>12:40</td>
			</tr>
			<tr>
				<td>6</td>
				<td>13:28</td>
				<td>13:45</td>
			</tr>
			<tr>
				<td>7</td>
				<td>15:28</td>
				<td>15:45</td>
			</tr>
			<tr>
				<td>8</td>
				<td>15:47</td>
				<td>16:00</td>
			</tr>
			<tr>
				<td>9</td>
				<td>17:02</td>
				<td>17:15</td>
			</tr>
			<tr>
				<td>10</td>
				<td>17:42</td>
				<td>18:00</td>
			</tr>
			<tr>
				<td>11</td>
				<td>18:42</td>
				<td>18:55</td>
			</tr>
			<tr>
				<td>12</td>
				<td>18:20</td>
				<td>18:30</td>
			</tr>
			<tr>
				<td>13</td>
				<td>19:08</td>
				<td>19:24</td>
			</tr>
			<tr>
				<td>14</td>
				<td>20:04</td>
				<td>20:18</td>
			</tr>
			<tr>
				<td>15</td>
				<td>20:40</td>
				<td>20:48</td>
			</tr>
			<tr>
				<td>16</td>
				<td>21:34</td>
				<td>21:44</td>
			</tr>
			<tr>
				<td>17</td>
				<td>22:38</td>
				<td>22:50</td>
			</tr>
			
		</table>
		</div>
	</div>

	<div id="tableWrap">
		<form >
			<input type="text" name="stationName" id="stationName" placeholder="도착역을 입력해주세요.">
			<button type="button" id="insertStation">입력</button>
		</form>
		
		<div id="traintimehead">
			<table id="traintimebody">
				
			</table>
		</div>
	</div>
</body>

</html>