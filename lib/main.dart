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
  double _scale = 1;
  String _card = 'AH';
  int _currentSuitIndex = 0;
  int _currentValueIndex = 0;
  final List<String> _suits = ['H', 'S', 'D', 'C'];

  final List<String> _cardValues = [
    'A',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    'J',
    'Q',
    'K'
  ];

  void _incrementValue() {
    setState(() {
      _currentValueIndex = (_currentValueIndex + 1) % 13;
      _card = "${_cardValues[_currentValueIndex]}${_suits[_currentSuitIndex]}";
    });
  }

  void _decrementValue() {
    setState(() {
      _currentValueIndex = (_currentValueIndex - 1) % 13;
      _card = "${_cardValues[_currentValueIndex]}${_suits[_currentSuitIndex]}";
    });
  }

  void _cycleSuits() {
    setState(() {
      _currentSuitIndex = (_currentSuitIndex + 1) % 4;
      _card = "${_cardValues[_currentValueIndex]}${_suits[_currentSuitIndex]}";
    });
  }

  void _incrementScale() {
    setState(() {
      _scale = _scale + .1;
    });
  }
  void _decrementScale() {
    setState(() {
      _scale = _scale - .1;
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
            ElevatedButton(
              child: Text('_incrementScale'),
              onPressed: _incrementScale,
            ),
            ElevatedButton(
              child: Text('_decrementScale'),
              onPressed: _decrementScale,
            ),
            CardConverter(card: _card, scale: _scale, shadow: 100)
          ],
        ),
      ),
    );
  }
}
