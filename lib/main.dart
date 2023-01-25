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

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _card = '1H';
  int _currentSuitIndex = 0;
  int _currentValueIndex = 0;
  final List<String> _suits = ['H', 'S', 'D', 'C'];

  final List<String> _cardValues = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10'
  ];

  void _incrementValue() {
    setState(() {
      _currentValueIndex = (_currentValueIndex + 1) % 10;
      _card = "${_cardValues[_currentValueIndex]}${_suits[_currentSuitIndex]}";
    });
  }

  void _decrementValue() {
    setState(() {
      _currentValueIndex = (_currentValueIndex - 1) % 10;
      _card = "${_cardValues[_currentValueIndex]}${_suits[_currentSuitIndex]}";
    });
  }

  void _cycleSuits() {
    setState(() {
      _currentSuitIndex = (_currentSuitIndex + 1) % 4;
      _card = "${_cardValues[_currentValueIndex]}${_suits[_currentSuitIndex]}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Card Converter'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            ElevatedButton(
              child: Text('Increase Value'),
              onPressed: _incrementValue,
            ),
            ElevatedButton(
              child: Text('Decrease Value'),
              onPressed: _decrementValue,
            ),
            ElevatedButton(
              child: Text('Cycle Suits'),
              onPressed: _cycleSuits,
            ),
            CardConverter(card: _card)
          ],
        ),
      ),
    );
  }
}
