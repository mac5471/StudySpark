class Quiz {

  //fields
  String Name;
  ArrayList<QuizQuestion> Questions;
  QuizQuestion displayedQuestion;
  int CurrentIndex, Score;
  boolean IsFinished;

  //constructor
  Quiz(String n) {
    this.Name = n;
    this.Questions = new ArrayList();
    this.CurrentIndex = 0;
    this.Score = 0;
    this.IsFinished = false;
  }

  //methods
  void newQuestion(String q, String[] ops, int p) {
    QuizQuestion temp = new QuizQuestion(q, ops, p);
    this.Questions.add(temp);
    if (this.Questions.size() == 1) {
      this.displayedQuestion = temp;
    }
  }

  void checkAnswer(int selectedIndex) {
    // selectedIndex comes from which button the user clicks (0-3)
    // We compare against 0 because the first answer line is always correct
    if (selectedIndex == 0) {
      this.Score += this.displayedQuestion.PointValue;
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

  void shuffleCurrentOptions() {
    // still working on this, but we gotta use this so we can randomize the order so the first option isnt always correct
    // before the user sees it in the GUI
    if (this.displayedQuestion != null) {
      List<String> list = Arrays.asList(this.displayedQuestion.Options);
      Collections.shuffle(list);
      this.displayedQuestion.Options = list.toArray(new String[0]);
    }
  }

}
