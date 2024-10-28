import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Container(
      color: Colors.grey,
      padding: const EdgeInsets.all(40),   
    child: Center(
      child: Column(
            children: [
              CustomCard(text: "OOP", color: Colors.blue[100]),
              CustomCard(text: "DART", color: Colors.blue[300]),
              CustomCard(text: "FLUTTER", color: Colors.blue[600]) 
            ],
          ),
        ),
 
      )
        
      ),
    );
}

class CustomCard extends StatelessWidget {
  final String text;
  final Color? color;

  const CustomCard({
    required this.text,
    this.color = Colors.blue,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(200, 50, 200, 50),
      margin: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            decoration: TextDecoration.none, 
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}