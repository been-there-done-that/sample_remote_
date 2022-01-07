import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class RandomWords extends StatefulWidget {
  const RandomWords({Key? key}) : super(key: key);

  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _RandomWordPairs = [];

  Widget _buildList() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemBuilder: (BuildContext context, int item) {
        if (item.isOdd) return const Divider();

        final index = item ~/ 2;

        if (index >= _RandomWordPairs.length) {
          _RandomWordPairs.addAll(generateWordPairs().take(10));
        }
        return _buildRow(
          _RandomWordPairs[index],
        );
      },
    );
  }

  Widget _buildRow(WordPair pair) {
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: const TextStyle(fontSize: 18.0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: const <Widget>[
            Align(
              alignment: Alignment.center,
              child: Text(
                "Random Word Generator",
              ),
            ),
          ],
        ),
      ),
      body: _buildList(),
    );
  }
}
