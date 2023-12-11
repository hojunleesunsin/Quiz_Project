<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gugi&display=swap" rel="stylesheet">
	<title>스피드 퀴즈</title>
<style>
*{font-family: 'Gugi', cursive;}
</style>
<link rel="stylesheet" href="../css/style.css">
<script src="speed.js" defer charset="UTF-8"></script>
</head>

<body>

제한시간 : <B><span id="timeLeft"></span></B> 초<br>
<br>
<div id="answerBoard"> </div>
<br>

<div id="question1" style="display:none">
	<b>1. 무슨 동물?</b><br>
	<img src = "../images/animal.jpg"/><br>
	<a href="javascript:void(0)" onclick="check_answer('a')">a) 강아지</a><br>
	<a href="javascript:void(0)" onclick="check_answer('b')">b) 늑대</a><br>
	<a href="javascript:void(0)" onclick="check_answer('c')">c) 고양이</a><br>
	<a href="javascript:void(0)" onclick="check_answer('d')">d) 돼지</a><br>
</div>

<div id="question2" style="display:none">
	<b>1. 무슨 동물?</b><br>
	<img src = "../images/animal.jpg"/><br>
	<a href="javascript:void(0)" onclick="check_answer('a')">a) 강아지</a><br>
	<a href="javascript:void(0)" onclick="check_answer('b')">b) 늑대</a><br>
	<a href="javascript:void(0)" onclick="check_answer('c')">c) 고양이</a><br>
	<a href="javascript:void(0)" onclick="check_answer('d')">d) 돼지</a><br>
</div>

<div id="question3" style="display:none">
	<b>1. 무슨 동물?</b><br>
	<img src = "../images/animal.jpg"/><br>
	<a href="javascript:void(0)" onclick="check_answer('a')">a) 강아지</a><br>
	<a href="javascript:void(0)" onclick="check_answer('b')">b) 늑대</a><br>
	<a href="javascript:void(0)" onclick="check_answer('c')">c) 고양이</a><br>
	<a href="javascript:void(0)" onclick="check_answer('d')">d) 돼지</a><br>
</div>

<div id="question4" style="display:none">
	<b>1. 무슨 동물?</b><br>
	<img src = "../images/animal.jpg"/><br>
	<a href="javascript:void(0)" onclick="check_answer('a')">a) 강아지</a><br>
	<a href="javascript:void(0)" onclick="check_answer('b')">b) 늑대</a><br>
	<a href="javascript:void(0)" onclick="check_answer('c')">c) 고양이</a><br>
	<a href="javascript:void(0)" onclick="check_answer('d')">d) 돼지</a><br>
</div>

<div id="question5" style="display:none">
	<b>1. 무슨 동물?</b><br>
	<img src = "../images/animal.jpg"/><br>
	<a href="javascript:void(0)" onclick="check_answer('a')">a) 강아지</a><br>
	<a href="javascript:void(0)" onclick="check_answer('b')">b) 늑대</a><br>
	<a href="javascript:void(0)" onclick="check_answer('c')">c) 고양이</a><br>
	<a href="javascript:void(0)" onclick="check_answer('d')">d) 돼지</a><br>
</div>

<div id="quizScore" style="display:none">
</div>
</body>
</html>