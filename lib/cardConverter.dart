import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CardConverter extends StatelessWidget {
  final String card;

  CardConverter({required this.card});

  @override
  Widget build(BuildContext context) {
    List<List<List<int>>> cardArray = [
      [
        [0],
        [1],
        [0],
      ],
      [
        [0],
        [1, 1],
        [0],
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
        [0, 1, 0, 0],
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
      ],
      [
        [1, 1, 1, 1],
        [1, 1],
        [1, 1, 1, 1],
      ]
    ];
    int visible = 0;
    String number = card[0];
    String suit = card[1];
    if (card.length > 2) {
      number = '10';
      suit = card[2];
    }
    ;
    Color suitColor = Colors.black;
    IconData suitIcon = Icons.favorite;
    int cANum = int.parse(number) - 1;

  print(number);
  print(suit);
    Widget buildIcon(visible) {
      return Container(
          // height: MediaQuery.of(context).size.height * 0.1,
          child: Center(
        child: Icon(
          visible == 1 ? suitIcon : null,
          color: suitColor,
          size: 45.0,
        ),
      ));
    }

    switch (suit) {
      case 'C':
        suitColor = Colors.black;
        suitIcon = FontAwesomeIcons.heartCircleCheck;
        break;
      case 'D':
        suitColor = Colors.red;
        suitIcon = FontAwesomeIcons.diamond;
        break;
      case 'H':
        suitColor = Colors.red;
        suitIcon = Icons.favorite;
        break;
      case 'S':
        suitColor = Colors.black;
        suitIcon = Icons.local_offer;
        break;
    }

    return Container(
      width: 250,
      height: 350,
      decoration: BoxDecoration(
        border: Border.all(width: 2.0, color: Colors.black),
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            offset: Offset(0.0, 1.5),
            blurRadius: 1.5,
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: Column(
                children: [
                  Text(
                    number,
                    style: TextStyle(
                      fontSize: 24.0,
                      color: suitColor,
                    ),
                  ),
                  Icon(
                    suitIcon,
                    color: suitColor,
                    size: 26.0,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < 3; i++)
                    SizedBox(
                        width: 50,
                        child: Column(
                          children: [
                            for (int j = 0; j < cardArray[cANum][i].length; j++)
                              Expanded(
                                  child: buildIcon(cardArray[cANum][i][j])),
                          ],
                        )),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Transform.rotate(
                angle: 3.14,
                child: Column(
                  children: [
                    Text(
                      number,
                      style: TextStyle(
                        fontSize: 24.0,
                        color: suitColor,
                      ),
                    ),
                    Transform(
                      transform: Matrix4.identity()..scale(-1.0, 1.0, 1.0),
                      alignment: Alignment.center,
                      child: Icon(
                        suitIcon,
                        color: suitColor,
                        size: 26.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
