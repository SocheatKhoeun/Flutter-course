import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text("Favorite cards"),
        ),
        body: Column(
          children: [
            // Card 1
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 0.5, color: Colors.grey),
                ),
              ),
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Expanded(
                    flex: 7,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'title',
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.w800),
                        ),
                        SizedBox(height: 10.0),
                        Text('description'),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ),
                  )
                ],
              ),
            ),
            
            // Card 2
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 0.5, color: Colors.grey),
                ),
              ),
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Expanded(
                    flex: 7,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'title',
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.w800),
                        ),
                        SizedBox(height: 10.0),
                        Text('description'),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ),
                  )
                ],
              ),
            ),
            
            // Card 3
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 0.5, color: Colors.grey),
                ),
              ),
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Expanded(
                    flex: 7,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'title',
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.w800),
                        ),
                        SizedBox(height: 10.0),
                        Text('description'),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ),
                  )
                ],
              ),
            ),
            
            // Card 4
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 0.5, color: Colors.grey),
                ),
              ),
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Expanded(
                    flex: 7,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'title',
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.w800),
                        ),
                        SizedBox(height: 10.0),
                        Text('description'),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ));
