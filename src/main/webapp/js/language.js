const quizData = [
    {
        question : "Q1. // 사이의 단어들의 다듬은 말을 순서대로 나열한 것은?",
        question1 : "○ 요청하신 자료는 /금일/ 메일로 전달드리겠습니다.",
        question2 : "○ 온라인으로 주문하신 제품은 /익월/ 핸드폰 요금으로 청구가 됩니다.",
        a : "오늘	, 이번달",
        b : "오늘	, 다음달",
        c : "내일	, 이번달",
        d : "내일	, 다음달",
        correct : "b"
    },
    {
        question : "Q2. 다음 ㉠ 과 ㉡에 들어갈 말로 가장 적절한 것은?",
        question1 : "나는 얼른 아저씨를 알아보았는데 아저씨는 나를 못 알아보았는지 내가 빙그레 웃어 보여도 웃지도 않고 멀거니 보고만 있겠지요. (  ㉠  ) 나는 손을 흔들었지요. (  ㉡  ) 아저씨는 얼른 고개를 숙이고 말더군요.",
        question2 : "",
        a : "그러나, 그런데",
        b : "그런데, 그러나",
        c : "그래서, 그러니까",
        d : "그러니까, 그래서",
        correct : "c"
    },
    {
        question : "Q3. // 사이의 말의 쓰임이 옳지 않은 것은?",
        question1 : "",
        question2 : "",
        a : "그는 아까운 능력을 /썩히고/ 있다.",
        b : "음식물 쓰레기를 /썩혀서/ 거름으로 만들었다.",
        c : "나는 이제까지 부모님 속을 /썩혀/ 본 적이 없다.",
        d : "그들은 새로 구입한 기계를 창고에서 /썩히고/ 있다.",
        correct : "c"
    },
    {
        question : "다음 관용적 표현의 의미가 적절하지 않은 것은?",
        question1 : "",
        question2 : "",
        a : "머리 둘 데를 모른다. : 어떻게 처신해야 하는지 모른다.",
        b : "얼굴이 뜨겁다 : 부끄러운 일을 당하여 남을 대할 면목이 없다.",
        c : "손이 크다 : 씀씀이가 매우 크다. 또는 인심이 후하다",
        d : "머리가 성성하다. : 머리털이 빠져 살이 드러나다.",
        correct : "d"
    },
];
const questionEl = document.getElementById("question")
const question1El = document.getElementById("question1")
const question2El = document.getElementById("question2")
const a_textEl = document.getElementById("a_text");
const b_textEl = document.getElementById("b_text");
const c_textEl = document.getElementById("c_text");
const d_textEl = document.getElementById("d_text");
const quiz = document.getElementById("quiz")
const button = document.getElementById("submit")
const resultDisplay = document.getElementById('result');

const answersEls = document.querySelectorAll('.answer')

let cur = 0;
let score = 0;


function loadQuiz(){ //퀴즈를 불러오는 함수
    questionEl.innerText = quizData[cur].question
    question1El.innerText = quizData[cur].question1
    question2El.innerText = quizData[cur].question2
    a_textEl.innerText = quizData[cur].a
    b_textEl.innerText = quizData[cur].b
    c_textEl.innerText = quizData[cur].c
    d_textEl.innerText = quizData[cur].d
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
        button.innerHTML = `결과보기`;
    }else{  //아니라면 퀴즈 계속 진행, 답체크 해제
        loadQuiz();
        deSelectAnswer();
    }
});


loadQuiz();