class QuizItem {
  const QuizItem(this.question, this.answers);
  final String question;
  final List<String> answers;
  List<String> getShuffledAnswers() {
    List<String> shuffled = List.of(answers);
    shuffled.shuffle();
    return shuffled;
  }
}
