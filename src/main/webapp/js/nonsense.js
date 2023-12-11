const quizData = [
    {
        question : "개그맨들이 찾아서 헤매는 거리는?",
        a : "충무로 거리",
        b : "웃음 거리",
        correct : "b"
    },
    {
        question : "하늘에서 애 낳으면?",
        a : "하이애나",
        b : "옴메 나죽어",
        correct : "a"
    },
    {
        question : "세상 사람들의 머리카락 수를 모두 곱하면?",
        a : "무한대",
        b : "0",
        correct : "b"
    },
    {
        question : "세상에서 가장 먼저 자는 가수는?",
        a : "이미자",
        b : "조용필",
        correct : "a"
    },
    {
        question : "날씨가 더워서 창문을 열었더니 신이 날고 있었다. 이런 이야기를 뭐라고 할까?",
        a : "신나는 이야기",
        b : "무더운 이야기",
        correct : "a"
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
        score++;
    }
    cur++; //버튼 눌렀을때 다음문제로

    if (cur >= quizData.length ){ 
	
        resultDisplay.innerHTML = `${quizData.length}중 ${score} 문제 맞추셨습니다.`;
    }else{  //아니라면 퀴즈 계속 진행, 답체크 해제
        loadQuiz();
        deSelectAnswer();
    }
});


loadQuiz();