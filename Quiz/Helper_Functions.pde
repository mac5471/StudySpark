QuizHandler activeQuiz;

void loadQuizData(String filename) {
  // for now it will try finding biology.txt, after I will add feature where they can select which one they want
  String[] lines = loadStrings(filename + ".txt.txt");
  
  if (lines != null && lines.length > 0 && lines[0].trim().equals("q")) {
    activeQuiz = new QuizHandler(filename);
    
    // jump 5 lines at a time since 1 for question and 4 for answers
    for (int i = 1; i + 4 < lines.length; i += 5) {
      String qText = lines[i];
      String[] ops = { lines[i+1], lines[i+2], lines[i+3], lines[i+4] };
      activeQuiz.addQuestion(qText, ops);
    }
    println("Quiz loaded with " + activeQuiz.questions.size() + " questions.");
  }
}
