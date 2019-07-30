<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
var url= 'http://api.openweathermap.org/data/2.5/weather?q=seoul&APPID=83c62b5028f8bad78c5410a0efae908f';
$.getJSON(url,function(data){
var sys=data.sys;
var city =data.name;
var weather = data.weather;
var main = data.main;
var wmain =weather[0].main;
var win =weather[0].id;
var icon = weather[0].icon;
var country =sys.country;
var temp = main.temp;
var temp_min =main.temp_min;
var temp_max =main.temp_max;
$('body').append(wmain+", <img src='http://api.openweathermap.org/img/w/"+ icon + ".png'>" 
		+ "<br>"+ '현재온도:'+parseInt(temp-273.15)+' '
		+ "<br>"+'최저온도:'+parseInt(temp_min-273.15)+ "<br>"+'최고온도:'+parseInt(temp_max-273.15)+' '
		+ "<br>"+country+' '+city+'<br>');	 
});
});
</script>
</head>
<body>
</body>
</html>