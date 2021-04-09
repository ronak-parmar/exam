<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="test.aspx.cs" Inherits="kyubi.test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div id="quiz"></div>
   
            <button id="submit">Submit Quiz</button>
   
        <asp:TextBox ID="TextBox1" runat="server" style="display:none"></asp:TextBox>
        <input id="re" value="" style="display:none"/>

     <div id="results"></div>
    </form>
    
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script>
        let id = localStorage.getItem("questionidlist");
        (function () {
            function buildQuiz() {

                const output = [];

                myQuestions.forEach(

                    (currentQuestion, questionNumber) => {

                        // variable to store the list of possible answers
                        const answers = [];

                        const option = ["a", "b", "c", "d"];
                        const suffle = ["a", "b", "c", "ans"].sort(() => .5 - Math.random())

                        let count = 0
                        // and for each available answer...

                        for (letter in currentQuestion.answers) {

                            // ...add an HTML radio button
                            answers.push(
                                `<label>
              <input type="radio" name="question${questionNumber}" value="${currentQuestion.answers[suffle[count]]}">
              ${option[count]} :
              ${currentQuestion.answers[suffle[count]]}
            </label>`
                            );
                            count += 1;
                        }

                        output.push(
                            `<div class="question"> ${currentQuestion.question} </div>
          <div class="answers"> ${answers.join('')} </div>`
                        );
                    }
                );

                quizContainer.innerHTML = output.join('');


            }

            function showResults() {

                // gather answer containers from our quiz
                const answerContainers = quizContainer.querySelectorAll('.answers');

                // keep track of user's answers
                let numCorrect = 0;

                // for each question...
                myQuestions.forEach((currentQuestion, questionNumber) => {


                    // find selected answer
                    const answerContainer = answerContainers[questionNumber];
                    const selector = `input[name=question${questionNumber}]:checked`;
                    const userAnswer = (answerContainer.querySelector(selector) || {}).value;

                    // if answer is correct
                    if (userAnswer === currentQuestion.answers.ans) {
                        numCorrect = numCorrect + parseInt(currentQuestion.marks);
                    }

                    $('#re').val() = numCorrect;

                   
                });
            }


            const quizContainer = document.getElementById('quiz');
            const resultsContainer = document.getElementById('results');
            const submitButton = document.getElementById('submit');

            var myQuestions =[]
            fetch(`http://localhost:5000/${id}`)
                .then((res) => res.json())
                .then((data) => {
                    data.map((d) => myQuestions.push(d))
                    buildQuiz();
                })

           
            $('#submit').on('click', function (evt) {

                evt.preventDefault();
                showResults();

                let userid = $('#TextBox1').val();
                let result = $('#re').val();
                console.log(userid, result)

                fetch(`http://localhost:5000/submit/${userid}${result}`)
                    .then((res) => res.json())
                    .then((data) => {
                        // alert("Test Submited!")
                        //window.location.href = "https://localhost:44366/student.aspx"
                    })
            });


        })();

    </script>
</body>
</html>
