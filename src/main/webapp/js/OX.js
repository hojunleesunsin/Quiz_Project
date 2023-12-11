const quizData = [
    {
        question : "호랑이는 야행성 동물이다?",
        a : "O",
        b : "X",
        correct : "a"
    },
    {
        question : "로댕의 생각하는 사람 조각은 오른손으로 턱을 받치고 있다?",
        a : "O",
        b : "X",
        correct : "a"
    },
    {
        question : "개미도 높은 곳에서 떨어지면 죽는다.",
        a : "O",
        b : "X",
        correct : "b"
    },
    {
        question : "사자는 혀에 뼈가 있다",
        a : "O",
        b : "X",
        correct : "a"
    },
    {
        question : "뱀은 뒤로 갈수 있다",
        a : "O",
        b : "X",
        correct : "b"
    },
    {
        question : "대머리도 비듬이 생긴다",
        a : "O",
        b : "X",
        correct : "a"
    },
    {
        question : "키가 2m가 넘는 것은 병이다.",
        a : "O",
        b : "X",
        correct : "a"
    },
    {
        question : "이문제가 OX 퀴즈 마지막 문제이다?",
        a : "O",
        b : "X",
        correct : "b"
    },
    {
        question : "이문제가 OX 퀴즈 진짜 마지막 문제이다?",
        a : "O",
        b : "X",
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