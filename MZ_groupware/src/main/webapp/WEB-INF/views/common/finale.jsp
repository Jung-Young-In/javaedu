<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@900&display=swap');

body {
  padding: 0;
  margin: 0; 
  height: 100vh;
  background: #18191f;
  font-family: 'Poppins', sans-serif;
  display: flex;
  justify-content: center;
  align-items: center;
}

ul {
  position: relative;
  display: flex;
}

li {
  list-style: none;
}

label {
  position: relative;
}

input[type="checkbox"] {
  position: absolute;
  opacity: 0;
  cursor: pointer;
  height: 80px;
  width: 80px;
  z-index: 100;
}

div {
  position: relative;
  height: 80px;
  width: 80px;
  background: #18191f;
  color: #555;
  display: flex;
  display: flex;
  justify-content: center;
  align-items: center;
  font-size: 46px;
  cursor: pointer;
  margin: 0 4px;
  border-radius: 20px;
  box-shadow: -1px -1px 4px rgba(255, 255, 255, 0.05),
    4px 4px 6px rgba(0, 0, 0, 0.2),
    inset -1px -1px 4px rgba(255, 255, 255, 0.05),
    inset 1px 1px 1px rgba(0, 0, 0, 0.1);
}

/* div:before {
  content: "";
  position: absolute;
  top: 2px;
  left: 2px;
  width: 75px;
  height: 38px;
  border-top-left-radius: 20px;
  border-top-right-radius: 20px;
  background: rgba(255, 255, 255, 0.05);
} */

input[type="checkbox"]:checked ~ div {
  box-shadow: inset 0 0 2px rgba(255, 255, 255, 0.05),
    inset 4px 4px 6px rgba(0, 0, 0, 0.2);
  color: yellow;
  text-shadow: 0 0 15px yellow, 0 0 25px yellow;
  animation: glow 1.5s linear infinite;
}

@keyframes glow {
  0% {
    filter: hue-rotate(0deg);
  }
  100% {
    filter: hue-rotate(360deg);
  }
}
</style>
<meta charset="UTF-8">
<title></title>
<script src="https://tistory4.daumcdn.net/tistory/3134841/skin/images/confetti_v2.js"></script>

<style>
	canvas{z-index:10;pointer-events: none;position: fixed;top: 0;transform: scale(1.1);}
</style>
</head>
<body>

<canvas id="canvas"></canvas>
<ul>
  <li>
    <input type="checkbox"/>
    <div>???</div>
  </li>
  <li>
    <input type="checkbox" />
    <div>???</div>
  </li>
  <li>
    <input type="checkbox" />
    <div>???</div>
  </li>
  <li>
    <input type="checkbox" />
    <div>???</div>
  </li>
  <li>
    <input type="checkbox" />
    <div>???</div>
  </li>
  <li>
    <input type="checkbox" />
    <div>???</div>
  </li>
</ul>
<ul>
  <li>
    <input type="checkbox"  id="startButton"/>
    <div>???</div>
  </li>
  <li>
    <input type="checkbox" />
    <div>???</div>
  </li>
  <li>
    <input type="checkbox" />
    <div>???</div>
  </li>
  <li>
    <input type="checkbox" />
    <div>???</div>
  </li>
  <li>
    <input type="checkbox" />
    <div>???</div>
  </li>
  <li>
    <input type="checkbox" />
    <div>???</div>
  </li>
  <li>
    <input type="checkbox" />
    <div>???</div>
  </li>
  <li>
    <input type="checkbox" />
    <div>???</div>
  </li>
</ul>
<br><br><br><br><br><br><br>
<h3 style="color: white; font-family: sans-serif;">?????? ?????? ?????? ????????? ?????? ?????? ????????? ??? ??? ???????????????.</h3>
<br><br><br>
<h3 style="color: white; font-family: sans-serif;">????????? ????????? ??????????????? ???????????? ???????????????.</h3>
</body>
<script>
$(document).ready(function(){  
  //???????????? ???????????? ?????????
  function reAction(){
  	$("#startButton").trigger("click");
  	setTimeout(function(){
  		$("#stopButton").trigger("click");
  	}, 6000);
  }  
  reAction(); 
});
</script>
</html>