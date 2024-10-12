void main() {

  // List of student scores
  List<int> scores = [45, 78, 62, 49, 85, 33, 90, 50];


  var passed = scores.where((scores) => scores >= 50);

  //Output the original scores 
  print(scores);

  //let passedcount variale for count the scores that higher than 50 
  int passedCount = passed.length;
  
  print(passed.toList());
  print("$passedCount students pasesd");
}
