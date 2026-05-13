class QuizQuestion {

  //field
  //1) question details
  String QuestionText, CorrectAnswer;
  String[] Options;
  boolean WasCorrect, IsFlagged;

  //2) relationship w/ other objects
  int Index;

  // constructor
  QuizQuestion(String q, String[] ops) {
    this.QuestionText = q;
    this.Options = ops; 
    this.CorrectAnswer = ops[0]; 
    this.WasCorrect = true;
    this.IsFlagged = false;
  }

  //method
  void toggleFlag() {
    this.IsFlagged = !this.IsFlagged;
  }
}

class Quiz {

  //FIELDS
  //1) Quiz Details
  String Name;
  int CurrentIndex, Score;
  boolean IsFinished;

  //2) relationship w other objects
  ArrayList<QuizQuestion> Questions;
  QuizQuestion displayedQuestion;

  //constructor
  Quiz(String n) {
    this.Name = n;
    this.Questions = new ArrayList();
    this.CurrentIndex = 0;
    this.Score = 0;
    this.IsFinished = false;
  }

  // methods
  void newQuestion(String q, String[] ops) {
    QuizQuestion temp = new QuizQuestion(q, ops);
    temp.Index = this.Questions.size();
    this.Questions.add(temp);
    
    if (this.Questions.size() == 1) {
      this.displayedQuestion = temp;
    }
  }

  void checkAnswer(int selectedIndex) {
    // so if the user clicks button 0, its going to be the right answer since in the txt file the first options always correct
    if (selectedIndex == 0) {
      this.Score++;
    } else {
      this.displayedQuestion.WasCorrect = false;
    }
    this.nextQuestion();
  }

  void nextQuestion() {
    if (this.CurrentIndex + 1 < this.Questions.size()) {
      this.CurrentIndex++;
      this.displayedQuestion = this.Questions.get(this.CurrentIndex);
    } else {
      this.IsFinished = true;
    }
  }
}
