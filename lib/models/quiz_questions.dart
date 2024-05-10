class QuizQuestions{

  const QuizQuestions(this.text,this.answer);

  final String text;
  final List<String> answer;

  List<String> getShuffeldAnswer(){

    final shuffeldList = List.of(answer);
    shuffeldList.shuffle();
    return shuffeldList;
  }
}