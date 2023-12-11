const quizData = [
    {
        question : "Q1.나는 마스크를 착용하지 않거나 코, 턱에 걸친다.",
        a : "YES",
        b : "NO",
        correct : "b"
    },
    {
        question : "Q2.친구들과 함께 클럽, 헌팅포차 방문을 즐긴다.",
        a : "YES",
        b : "NO",
        correct : "b"
    },
    {
        question : "Q3.식당 or 카페에서 마스크 벗고 신나게 수다를 떤다.",
        a : "YES",
        b : "NO",
        correct : "b"
    },
    {
        question : "Q4.찌개,탕,국은 다같이 떠 먹는다.",
        a : "YES",
        b : "NO",
        correct : "b"
    },
    {
        question : "Q5.유명한 맛집을 찾아 줄을 서더라도 꼭 먹고 온다.",
        a : "YES",
        b : "NO",
        correct : "b"
    },
    {
        question : "Q6.지하철 또는 버스 손잡이, 마트 내 공용 카트, 장바구니 등을 이용 후 손을 씻지 않는다.",
        a : "YES",
        b : "NO",
        correct : "b"
    },
    {
        question : "Q7.산책,조깅,자전거타기 등 밖에서 운동할 때 마스크를 벗는다.",
        a : "YES",
        b : "NO",
        correct : "b"
    },
    {
        question : "Q8.볼일을 본 후 가끔 손을 씻지 않는다.",
        a : "YES",
        b : "NO",
        correct : "b"
    },
    {
        question : "Q9.외출 후 집에 돌아와서 씻지 않고 일단 눕는다.",
        a : "YES",
        b : "NO",
        correct : "b"
    },
    {
        question : "Q10.손 소독제,알콜솜 등등 위생용품을 잘 사용하지 않는다.",
        a : "YES",
        b : "NO",
        correct : "b"
    },
    
];
const questionEl = document.getElementById("question")
const a_textEl = document.getElementById("a_text");
const b_textEl = document.getElementById("b_text");
const quiz = document.getElementById("quiz")
const button = document.getElementById("submit")
const resultDisplay = document.getElementById('result');

const answersEls = document.querySelectorAll('.answer')

let cur = 0;
let score = 0;


function loadQuiz(){ //퀴즈를 불러오는 함수
    questionEl.innerText = quizData[cur].question
    a_textEl.innerText = quizData[cur].a
    b_textEl.innerText = quizData[cur].b
}


function getSelected(){ //내가 고른 답을 불러오는 함수
    let selected = undefined;
    answersEls.forEach(ele => {
        if(ele.checked){
            selected = ele.id
        }
    })
    return selected;
}

//다음 문제로 넘어갈때 답체크 해제
function deSelectAnswer(){
    answersEls.forEach(element => {
        element.checked = false
    });
}


button.addEventListener('click', () => {
	//내가 고른 답이 정답일때 점수증가
    if(getSelected() === quizData[cur].correct){
        score ++;
    }
    cur++; //버튼 눌렀을때 다음문제로

    if (cur >= quizData.length ){ 
	
        resultDisplay.innerHTML = `${score}0% 청결함.`;
    }else{  //아니라면 퀴즈 계속 진행, 답체크 해제
        loadQuiz();
        deSelectAnswer();
    }
});


loadQuiz();