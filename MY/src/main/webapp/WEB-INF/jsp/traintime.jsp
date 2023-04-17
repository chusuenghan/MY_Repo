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
				
				var traintimebody = $('#traintimebody');
  				traintimebody.empty();
  				
  				traintimebody.append(
  					'<tr><th>출발지</th><th>출발시간</th><th>도착지</th><th>도착시간</th><th class="train">열차</th></tr>'	
  				);
  				
				result.items.forEach(function(item) {
  					traintimebody.append(
                        '<tr><td>' + item.depplacename + '</td><td>' + item.depplandtime + '</td><td>' + item.arrplacename + '</td><td>'
                        + item.arrplandtime + '</td><td class="train">' + item.traingradename + '</td></tr>'
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
		width:50%;
		height:200px;
		display:inline-block;
	}
	#head{
		width:100%;
		height:200px;
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
	
	table{
		width:600px;
		display:flex;
		flex-direction: column;
	}
	th, td{
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
	<div id="header">
		<div id="head">
			<div class="day">
				<a href="javascript:doDisplayweekday();">평일</a>
			</div>
			<div class="day">
				<a href="javascript:doDisplayweekend();">주말</a>
			</div>
			<div class="day">
				<a href="busroute.do">버스루트</a>
			</div>
		</div>
	</div>
	<div id="section">
	<div class="wrap">
		<table id="weekday" style="border:1px solid black;margin-left:auto;margin-right:auto;">
			<tr>
				<th>번호</th>
				<th>밀양역</th>
				<th>부산대</th>
			</tr>
			<tr>
				<td>1</td>
				<td>6:45</td>
				<td>6:57</td>
			</tr>
			<tr>
				<td>2</td>
				<td>7:00</td>
				<td>6:57</td>
			</tr>
			<tr>
				<td>3</td>
				<td>7:20</td>
				<td>7:32</td>
			</tr>
			<tr>
				<td>4</td>
				<td>8:20</td>
				<td>8:32</td>
			</tr>
			<tr>
				<td>5</td>
				<td>8:45</td>
				<td>8:53</td>
			</tr>
			<tr>
				<td>6</td>
				<td>8:56</td>
				<td>9:04</td>
			</tr>
			<tr>
				<td>7</td>
				<td>9:35</td>
				<td>9:43</td>
			</tr>
			<tr>
				<td>8</td>
				<td>9:48</td>
				<td>9:56</td>
			</tr>
			<tr>
				<td>9</td>
				<td>10:05</td>
				<td>10:13</td>
			</tr>
			<tr>
				<td>10</td>
				<td>10:22</td>
				<td>10:32</td>
			</tr>
			<tr>
				<td>11</td>
				<td>11:26</td>
				<td>11:38</td>
			</tr>
			<tr>
				<td>12</td>
				<td>11:48</td>
				<td>11:56</td>
			</tr>
			<tr>
				<td>13</td>
				<td>12:36</td>
				<td>12:48</td>
			</tr>
			<tr>
				<td>14</td>
				<td>12:50</td>
				<td>13:02</td>
			</tr>
			<tr>
				<td>15</td>
				<td>13:36</td>
				<td>13:48</td>
			</tr>
			<tr>
				<td>16</td>
				<td>14:17</td>
				<td>14:29</td>
			</tr>
			<tr>
				<td>17</td>
				<td>14:36</td>
				<td>14:48</td>
			</tr>
			<tr>
				<td>18</td>
				<td>15:05</td>
				<td>15:17</td>
			</tr>
			<tr>
				<td>19</td>
				<td>15:40</td>
				<td>15:52</td>
			</tr>
			<tr>
				<td>20</td>
				<td>16:00</td>
				<td>16:17</td>
			</tr>
			<tr>
				<td>21</td>
				<td>16:42</td>
				<td>16:54</td>
			</tr>
			<tr>
				<td>22</td>
				<td>17:23</td>
				<td>17:35</td>
			</tr>
			<tr>
				<td>23</td>
				<td>17:44</td>
				<td>17:56</td>
			</tr>
			<tr>
				<td>24</td>
				<td>17:45</td>
				<td>17:57</td>
			</tr>
			<tr>
				<td>25</td>
				<td>18:10</td>
				<td>18:22</td>
			</tr>
			<tr>
				<td>26</td>
				<td>18:45</td>
				<td>18:57</td>
			</tr>
			<tr>
				<td>27</td>
				<td>19:30</td>
				<td>19:42</td>
			</tr>
			<tr>
				<td>28</td>
				<td>19:44</td>
				<td>19:56</td>
			</tr>
			<tr>
				<td>29</td>
				<td>20:08</td>
				<td>20:20</td>
			</tr>
			<tr>
				<td>30</td>
				<td>20:45</td>
				<td>20:57</td>
			</tr>
			<tr>
				<td>31</td>
				<td>21:05</td>
				<td>21:17</td>
			</tr>
			<tr>
				<td>32</td>
				<td>21:57</td>
				<td>22:09</td>
			</tr>
			<tr>
				<td>33</td>
				<td>22:22</td>
				<td>22:34</td>
			</tr>
			<tr>
				<td>34</td>
				<td>23:00</td>
				<td>23:12</td>
			</tr>
		</table>
		</div>
		<div class="wrap">
		<table id="weekend" style="border:1px solid black;margin-left:auto;margin-right:auto;display:none;">
			<tr>
				<th>번호</th>
				<th>밀양역</th>
				<th>부산대</th>
			</tr>
			<tr>
				<td>1</td>
				<td>7:00</td>
				<td>7:12</td>
			</tr>
			<tr>
				<td>2</td>
				<td>8:12</td>
				<td>8:32</td>
			</tr>
			<tr>
				<td>3</td>
				<td>8:45</td>
				<td>8:53</td>
			</tr>
			<tr>
				<td>4</td>
				<td>10:22</td>
				<td>10:32</td>
			</tr>
			<tr>
				<td>5</td>
				<td>11:26</td>
				<td>11:38</td>
			</tr>
			<tr>
				<td>6</td>
				<td>12:36</td>
				<td>12:48</td>
			</tr>
			<tr>
				<td>7</td>
				<td>14:36</td>
				<td>14:48</td>
			</tr>
			<tr>
				<td>8</td>
				<td>15:32</td>
				<td>15:44</td>
			</tr>
			<tr>
				<td>9</td>
				<td>16:42</td>
				<td>16:54</td>
			</tr>
			<tr>
				<td>10</td>
				<td>17:23</td>
				<td>17:35</td>
			</tr>
			<tr>
				<td>11</td>
				<td>17:45</td>
				<td>17:57</td>
			</tr>
			<tr>
				<td>12</td>
				<td>18:06</td>
				<td>18:18</td>
			</tr>
			<tr>
				<td>13</td>
				<td>18:45</td>
				<td>18:57</td>
			</tr>
			<tr>
				<td>14</td>
				<td>19:44</td>
				<td>19:56</td>
			</tr>
			<tr>
				<td>15</td>
				<td>20:24</td>
				<td>20:36</td>
			</tr>
			<tr>
				<td>16</td>
				<td>21:20</td>
				<td>21:32</td>
			</tr>
			<tr>
				<td>17</td>
				<td>22:18</td>
				<td>22:30</td>
			</tr>
			
		</table>
		</div>
	</div>

	<div id="tableWrap">
		<form>
			<input type="text" name="stationName" id="stationName">
			<button type="button" id="insertStation">입력</button>
		</form>
		
		<div>
			<table id="traintimebody">
				
			</table>
		</div>
	</div>
</body>

</html>