import g4p_controls.*;

void setup() {
  size(400, 400);
  createGUI();
  loadQuizData("Biology"); 
}

void draw() {
  background(40);
  
  if (activeQuiz != null) {
    if (!activeQuiz.isFinished) {
      QuizQuestion q = activeQuiz.currentQ;
      
      fill(255);
      textAlign(CENTER);
      textSize(16);
      text(q.questionText, width/2, 50);
      
      textAlign(LEFT);
      textSize(12);
      text("A: " + q.options[0], 50, 200);
      text("B: " + q.options[1], 50, 230);
      text("C: " + q.options[2], 50, 260);
      text("D: " + q.options[3], 50, 290);
      // added score
      textAlign(RIGHT);
      text("Score: " + activeQuiz.score, width-20, 20);
    } else {
      textAlign(CENTER);
      fill(0, 255, 0);
      text("Quiz Finished!", width/2, height/2);
      text("Score: " + activeQuiz.score, width/2, height/2 + 30);
    }
  }
}
