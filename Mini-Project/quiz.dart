class Participant {
  String firstName;
  String lastName;

  Participant (this.firstName, this.lastName);
  
  @override
  String toString(){
    return "Name: $firstName $lastName";
  }
}

abstract class Question {
  final String title;
  List <String> options;

  Question (this.title, this.options);

  bool checkAnswer(List<String> Answewr);
}

class SingleChoiceQuestion extends Question {
  String correctAnswer;

  SingleChoiceQuestion(String title, List<String> options, this.correctAnswer):
    super(title, options);

  @override
  bool checkAnswer(List<String> answer){
    return answer.length == 1 && answer[0] == correctAnswer;
  }
}

class MultiChoiceQuestion extends Question{
  List<String> correctAnswer;

  MultiChoiceQuestion (String title, List<String> options, this.correctAnswer):
    super(title, options);

  @override
  bool checkAnswer(List<String> answewr){
    return answewr.toSet().containsAll(correctAnswer) && correctAnswer.toSet().containsAll(answewr);
  }
}

class Quiz {
  List<Question> questions = [];
  Map<Participant, int> scores = {};

  void addQuestion(Question question){
    questions.add(question);
  }

  void addParticipantResult(Participant participant, List<List<String>> answer){
    int scorce = 0;
    for (int i = 0; i < questions.length; i++){
      if (questions[i].checkAnswer(answer[i])){
        scorce++;
      }
    }
    scores[participant] = scorce;
  }

  void displayResults() {
    scores.forEach((participant, score) {
      print("${participant.toString()} scored: $score/${questions.length}");
    });
  }
}

void main() {
  // Create a quiz
  Quiz quiz = Quiz();

  // Add SingleChoice and MultipleChoice questions
  quiz.addQuestion(SingleChoiceQuestion(
    "What is the capital of France?", ["Paris", "London", "Berlin"], "Paris"));

  quiz.addQuestion(MultiChoiceQuestion(
    "Which of the following are programming languages?", 
    ["Python", "Java", "HTML", "CSS"], ["Java", "Python"]));

  // Create participants
  Participant participant1 = Participant("John", "Doe");
  Participant participant2 = Participant("Jane", "Smith");

  // Add answers for participants
  quiz.addParticipantResult(participant1, [["Paris"], ["Python", "Java"]]);
  quiz.addParticipantResult(participant2, [["London"], ["Python", "CSS"]]);

  // Display quiz results
  quiz.displayResults();
}