import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CardConverter extends StatelessWidget {
  final String card;

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
  CardConverter({required this.card});

  @override
  Widget build(BuildContext context) {
    bool isNumeric(String s) {
      if (s == null) {
        return false;
      }
      return double.tryParse(s) != null;
    }

    String number = card[0];
    String suit = card[1];
    if (card.length > 2) {
      number = '10';
      suit = card[2];
    }
    ;

    final Map<String, Map<String, dynamic>> _suits = {
      'C': {'color': Colors.black, 'icon': 'assets/icons/025-clubs.svg'},
      'D': {'color': Colors.red, 'icon': 'assets/icons/026-diamonds.svg'},
      'H': {'color': Colors.red, 'icon': 'assets/icons/219-heart.svg'},
      'S': {'color': Colors.black, 'icon': 'assets/icons/024-spades.svg'},
    };

    double centerIconScale = 41;
    final Map<String, dynamic>? _suit = _suits[suit];
    final suitColor = _suit!['color'];
    final suitIcon = SvgPicture.asset(_suit['icon'],
        height: centerIconScale, color: suitColor);

    SvgPicture createSvg(String filePath, Color color, [double? height]) {
      return SvgPicture.asset(filePath, color: color, height: height);
    }

    Map<String, SvgPicture> svgs = {
      'K': createSvg('assets/icons/King.svg', suitColor),
      'Q': createSvg('assets/icons/Queen.svg', suitColor, 230),
      'J': createSvg('assets/icons/Jack.svg', suitColor, 230),
      'A': createSvg(
          suit == 'C'
              ? 'assets/icons/Clubs.svg'
              : suit == 'S'
                  ? 'assets/icons/Spades.svg'
                  : suit == 'H'
                      ? 'assets/icons/Heart.svg'
                      : 'assets/icons/Diamonds.svg',
          suitColor,
          230)
    };

    Widget buildIcon(visible) {
      return Center(
        child: visible == 0 ? null : suitIcon,
      );
    }

    return Container(
      padding: EdgeInsets.all(10),
      width: 250,
      height: 350,
      decoration: BoxDecoration(
        border: Border.all(width: 2.0, color: Colors.black),
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(122, 0, 0, 0),
            offset: Offset(9.0, 13.5),
            blurRadius: 8.5,
          ),
        ],
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Column(
              children: [
                Text(
                  number,
                  style: TextStyle(
                    fontSize: 30.0,
                    color: suitColor,
                  ),
                ),
                Container(
                  child: suitIcon,
                  width: 30,
                ),
              ],
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(17.0),
              child: isNumeric(number)
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        for (int i = 0; i < 3; i++)
                          Column(
                            children: [
                              for (int j = 0;
                                  j <
                                      cardArray[int.parse(number) - 1][i]
                                          .length;
                                  j++)
                                Expanded(
                                    child: buildIcon(
                                        cardArray[int.parse(number) - 1][i]
                                            [j])),
                            ],
                          ),
                      ],
                    )
                  : Align(alignment: Alignment.center, child: svgs[number])),
          Align(
            alignment: Alignment.bottomRight,
            child: Transform.rotate(
              angle: 3.14,
              child: Column(
                children: [
                  Text(
                    number,
                    style: TextStyle(
                      fontSize: 30.0,
                      color: suitColor,
                    ),
                  ),
                  Transform(
                    transform: Matrix4.identity()..scale(-1.0, 1.0, 1.0),
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: 30,
                      child: suitIcon,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
