// this class keeps track of scores, and what cards you mess up on
class QuizHandler {
  String title; // name of the quiz deck (eg. Biology)
  int currentIndex, score; // tracking where the user is and how many questions they got correct
  boolean isFinished; // flips to true once the user hits the very last question
  ArrayList<QuizQuestion> questions; // this is a master list holding all the question objects for this deck
  ArrayList<QuizQuestion> incorrectQuestions; // saves the specific questions the user got wrong for the summary screen
  ArrayList<String> incorrectAnswers; // same as before but for answers instead
  QuizQuestion currentQ; // the exact question currently active on the user's screen

  // constructor
  QuizHandler(String t) {
    this.title = t; 
    this.questions = new ArrayList<QuizQuestion>(); 
    this.incorrectQuestions = new ArrayList<QuizQuestion>(); // wrong bin
    this.incorrectAnswers = new ArrayList<String>(); // tracks the wrong answer string
    this.currentIndex = 0; // standard start at index 0
    this.score = 0; // zero points to start out
    this.isFinished = false; // definitely not done yet
  }

  // constructs a new question item and shoves it into our deck array
  void addQuestion(String q, String[] ops) {
    QuizQuestion temp = new QuizQuestion(q, ops); // passes text and options array down to the child class
    this.questions.add(temp); // add to our handler arraylist
    if (this.questions.size() == 1) { // if this is literally the first item added
      this.currentQ = temp; // set it as the default current question so the screen isn't blank
    }
  }

  // this sees the user's answer and compares it with the verified key string
  void checkAnswer(int selectedIndex) {
    // checks if the string text of your button click matches the raw correct answer text
    if (this.currentQ.options[selectedIndex].equals(this.currentQ.correctAnsText)) {
      this.score++; // simple increment score by 1 each time
    } else {
      this.currentQ.wasCorrect = false; // flags the specific item as missed for diagnostic metrics
      this.incorrectQuestions.add(this.currentQ); // throw the question framework into the review pile
      this.incorrectAnswers.add(this.currentQ.options[selectedIndex]); // stash the wrong string choice you made
    }
    this.moveNext(); // automatically step the loop forward right after checking
  }

  // advances the index counter or triggers the final performance evaluation sequence
  void moveNext() {
    // if incrementing doesn't push us past the total array capacity bounds
    if (this.currentIndex + 1 < this.questions.size()) {
      this.currentIndex++; // increment index pointer by 1
      this.currentQ = this.questions.get(this.currentIndex); // grab the next question from memory and refresh screen
    } else {
      loadIncorrectQuestions(); // calling helper to lock in the missed sets
      updateIncorrect(); // updates the feedback GUI components to show the user their mistakes
      this.isFinished = true; // flips the state to shut down user input and show the summary metrics card
    }
  }
}
