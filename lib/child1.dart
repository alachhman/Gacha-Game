import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class PlaceholderWidget extends StatelessWidget {
  PlaceholderWidget();
  final List<WordPair>_suggestions = <WordPair>[];
  final Set<WordPair> _saved = new Set<WordPair>();
  final _biggerFont = const TextStyle(fontSize: 18.0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildSuggestions(),
    );
  }
  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return Divider();
          final index = i ~/ 2; /*3*/
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10)); /*4*/
          }
          return _buildRow(_suggestions[index]);
        });
  }
  Widget _buildRow(WordPair pair){
    final bool alreadySaved = _saved.contains(pair);
    return ListTile(
      title:Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: new Icon(
        alreadySaved ? Icons.favorite : Icons.keyboard_arrow_down,
        color: alreadySaved ? Colors.red : null,
      ),
    );
  }
}