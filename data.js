const client = require('./db/index')
const flowers = require("./flowers");
let generateQuestions = () => {
    let questions = [];
    let choiceIndex = 0;
    for (let i = 0; i < flowers.length; i++) {
        choiceIndex = i;
        if (choiceIndex > (flowers.length - 4)) {
            choiceIndex = i - 2;
        }
        let question = {
            id: i + 1,
            choices: [flowers[choiceIndex].name, flowers[choiceIndex + 1].name, flowers[choiceIndex + 2].name],
            answer: flowers[i].name
        };
        questions.push(question);
    }

    return questions;
};

let generateQuizzes = () => {
    let quizzes = [];
    let questionIndex = 0;
    let questions = generateQuestions();
    for (let i = 0; i < questions.length; i++) {
        questionIndex = i;
        if (questionIndex > (questions.length - 7)) {
            questionIndex = i - 5;
        }
        let quiz = [
            questions[questionIndex],
            questions[questionIndex + 1],
            questions[questionIndex + 2],
            questions[questionIndex + 3],
            questions[questionIndex + 4],
            questions[questionIndex + 5]
        ];
        quizzes.push(quiz);
    }
    return quizzes;
};

async function seedQuizzes() {
    let quizzes = generateQuizzes();
    try {
        await client.connect();
        for (let index = 0; index < quizzes.length; index++) {
            const currQuizArray = quizzes[index];
            const quizID = index + 1;
            for (let j = 0; j < currQuizArray.length; j++) {
                const element = currQuizArray[j];
                const questions = element.choices;
                console.log(element);
                const flowerID = element.id;
                const choices = element.choices.join(" ");
                const answer = element.answer;
                const response = await client.query(
                    `
                        INSERT INTO questions ("flowerid", choices, answer)
                        VALUES($1,$2,$3) RETURNING id;
                        `, [flowerID, choices, answer]
                );
                const currQuestionID = response.rows[0].id
                const quizResponse = await client.query(
                    `
                        INSERT INTO quizzes (quiznumber, "questionid")
                        VALUES($1,$2);
                        `, [quizID, currQuestionID]
                )
            }

        }
    } catch (error) {
        console.log(error)
    }
}
seedQuizzes().then(function () {
    console.log('Done seeding quizzes');
});