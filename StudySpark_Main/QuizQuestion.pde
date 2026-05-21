// this class handles the logic for the multiple choices along with the randomization function
class QuizQuestion {
  String questionText; // the main text
  String[] options; // the final array with randomized answers
  String correctAnsText; // the string which is the correct answer
  boolean wasCorrect;
  int index; // shuffling

  // constructor
  QuizQuestion(String q, String[] ops) {
    this.questionText = q; // bind the prompt string
    this.correctAnsText = ops[0]; // the first answer in the text file MC is always the correct answer
    
    this.options = new String[ops.length]; // matches the number of options given
    for (int i = 0; i < ops.length; i++) {
      this.options[i] = ops[i]; // this takes the raw elements over before its edited
    }
    
    // randomizes the MC Options
    for (int i = this.options.length - 1; i > 0; i--) {
      index = int(random(i + 1));
      String temp = this.options[index]; // standard 3-step value going through the index on the txt file
      this.options[index] = this.options[i];
      this.options[i] = temp; // the options are now mixed from buttons A to D
    }
    
    this.wasCorrect = true; // defaults to true until its corrected wrong by the handler
  }
}
