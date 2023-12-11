<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
<style>
*{font-family: 'Gugi', cursive;}
</style>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gugi&display=swap" rel="stylesheet">
		<!-- Required meta tags -->
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
		
		<link rel="stylesheet" href="../css/lotto.css">
	</head>
	<body>
		<div class="lotto-div">
			<!-- 로또 번호 출력 영역 -->
			<div class="lotto-number-div">
				<div class="lotto-number-sub-div" id="lotto_num_sub_id">
					
				</div>
			</div>
			<!-- 번호 출력 버튼 영역 -->
			<div class="lotto-button-div">
				<button class="lotto-button" id="lotto_btn_id" onclick="lottoFunc();">
					로또 번호 추첨
				</button>
			</div>
		</div>

		<!-- 기능 영역 -->
		<script>
		 let lotto_num_sub_id, lotto_btn_id;
		  let lottoArr, index, delay;

		  init();

		  function init(){
		      lotto_num_sub_id = document.getElementById("lotto_num_sub_id");
		      lotto_btn_id = document.getElementById("lotto_btn_id");
		  }

		  function lottoFunc(){
		      lottoArr = new Array();
		      lotto_num_sub_id.innerHTML = "";
		      index = 0;
		      delay = 0;

		      runLottoSys();
		  }

		  function runLottoSys(){
		      for(let i=0; i<7; i++){
		          let lotto = Math.floor(Math.random() * 45) + 1;

		          // 중복 검사
		          while(true){
		              if(lottoArr.indexOf(lotto) < 0) {
		                  lottoArr[index] = lotto;
		                  index++;
		                  break;
		              } else {
		                  lotto = Math.floor(Math.random() * 45) + 1;
		              }
		          }
		      }

		      for(let i=0; i<index; i++){
		          setTimeout(function(){
		              if(0<lottoArr[i] && lottoArr[i] < 11){
		                  lotto_num_sub_id.innerHTML += "<div class='lotto_num_part' style='background-color:#fac400;'>" + lottoArr[i] + "</div>"
		              } else if(10<lottoArr[i] && lottoArr[i] < 21) {
		                  lotto_num_sub_id.innerHTML += "<div class='lotto_num_part' style='background-color:#69c8f2;'>" + lottoArr[i] + "</div>"
		              } else if(20<lottoArr[i] && lottoArr[i] < 31) {
		                  lotto_num_sub_id.innerHTML += "<div class='lotto_num_part' style='background-color:#ff7272;'>" + lottoArr[i] + "</div>"
		              } else if(30<lottoArr[i] && lottoArr[i] < 41) {
		                  lotto_num_sub_id.innerHTML += "<div class='lotto_num_part' style='background-color:#aaaaaa;'>" + lottoArr[i] + "</div>"
		              } else if(40<lottoArr[i] && lottoArr[i] < 46) {
		                  lotto_num_sub_id.innerHTML += "<div class='lotto_num_part' style='background-color:#b0d840;'>" + lottoArr[i] + "</div>"
		              }

		              if(i == 5){
		                  lotto_num_sub_id.innerHTML += "<div class='lotto_num_plus'> + </div>"
		              } 
		          }, delay);
		          delay = delay + 1000;
		      }
		  }
		</script>
	</body>
</html>