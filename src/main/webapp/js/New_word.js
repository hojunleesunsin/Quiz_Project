const quizData = [
    {
        question : "갓생에서 '갓'이 의미하는 것은?",
        a : "갓: 이제막",
        b : "GOD: 신",
        correct : "b"
    },
    {
        question : "'캘박'의 뜻 풀이로 옳은 것은?",
        a : "캘리포니아에서 1박",
        b : "캘린더 박제",
        correct : "b"
    },
    {
        question : "다음 중 '점메추'가 가장 필요한 사람은?",
        a : "배달 앱을 들락거리는 태용",
        b : "라면 끓이고 있는 호준",
        correct : "a"
    },
    {
        question : "다음 중 '웃안웃'의 뜻 풀이로 옳은 것은?",
        a : "웃어야 하는데 안 웃겨",
        b : "웃긴데 안 웃겨",
        correct : "b"
    },
    {
        question : "'오히려 좋아' 와 유사한 뜻을 가진 사자성어는?",
        a : "전화위복",
        b : "고진감래",
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