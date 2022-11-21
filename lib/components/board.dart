import 'package:card_matching_game/models/my_card.dart';
import 'package:flutter/material.dart';

class Board extends StatefulWidget {
  const Board({super.key, required this.numberOfCards});

  final int numberOfCards;

  @override
  State<Board> createState() => _BoardState();
}

class _BoardState extends State<Board> {
  final List<MyCard> _cards = [];

  @override
  void initState() {
    _init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: _cards.map((card) => card.image).toList(),
    );
  }

  void _init() {
    var numberOfUniqueCards = widget.numberOfCards ~/ 2;
    var cardIndexes = List.generate(numberOfUniqueCards, (index) => index + 1).toList();
    for (var index in cardIndexes) {
      _cards.add(MyCard(index));
      _cards.add(MyCard(index));
    }
    _cards.shuffle();
  }
}
