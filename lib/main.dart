import 'package:flutter/material.dart';
import './random_words.dart';

void main() => runApp(const MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final wordPair = WordPair.random();
//     return MaterialApp(
//         theme: ThemeData(primaryColor: Colors.black),
//         home: Scaffold(
//           appBar: AppBar(
//             foregroundColor: Colors.redAccent,
//             backgroundColor: Colors.yellow,
//             title: const Text("Word Pair Generator"),
//           ),
//           body: Center(
//             child: Text(wordPair.asPascalCase),
//           ),
//         ));
//   }
// }

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const RandomWords(),
    );
  }
}
