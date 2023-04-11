<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script type="text/javascript">
$(document).ready(function() {
$('#insertStation').on('click', function(){
	var stationName = $('#stationName').val();
	$.ajax({
		url:'trainTimeList.do',
		type:"GET",
		data:{"stationName":stationName},
		dataType:"text",
		success:function(data){
			if (data) {
	              console.log(data);
	              
	  				$('#traintimebody').empty();
	  				var body='';
	  				body += '<table>';
	  				
	  				
	  				$(data).find('item').each(function(){
	  					var arrplandtime = $(this).find("arrplandtime").text();
	  					var depplandtime = $(this).find("depplandtime").text();
	  					
	  					body += "<tr>";
	  					body += "<td>"+depplandtime+"</td>";
	  					body += "<td>"+arrplandtime+"</td>";
	  					body += "</tr>";
	  					
	  				});
	  				
	  				body += '</table>';
	  				$('#traintimebody').append($(body)); 
	  			
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
</head>
<body>
	<form>
		<input type="text" name="stationName" id="stationName">
		<button type="button" id="insertStation">입력</button>
	</form>
	
	<div id="traintimebody">
	</div>
</body>

</html>