import 'package:flutter/material.dart';
import 'package:playingcards/cardConverter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Card Converter'),
      ),
      body: Center(
        child: CardConverter(card: '10H'),
      ),
    );
  }
}

/*[
        [0],
        [1],
        [0],
      ],
      [
        [0,0],
        [1, 1],
        [0,0],
      ],
      [
        [0, 0, 1],
        [0, 1, 0],
        [1, 0, 0],
      ],
      [
        [1, 0, 1],
        [0, 0, 0],
        [1, 0, 1],
      ],
      [
        [1, 0, 1],
        [0, 1, 0],
        [1, 0, 1],
      ],
      [
        [1, 1, 1],
        [0, 0, 0],
        [1, 1, 1],
      ],
      [
        [1, 1, 1],
        [0, 0, 1,0],
        [1, 1, 1],
      ],
      [
        [1, 1, 1, 1],
        [0, 0, 0],
        [1, 1, 1, 1],
      ],
      [
        [1, 1, 1, 1],
        [0, 1, 0],
        [1, 1, 1, 1],
      ],[
        [1, 1, 1, 1],
        [ 1, 1],
        [1, 1, 1, 1],
      ]
    ]*/