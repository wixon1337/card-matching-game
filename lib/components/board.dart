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
  MyCard? revealedCard;
  bool _tapLock = false;
  int _counter = 0;

  @override
  void initState() {
    _init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      const Text('Current tries: '),
                      Text('$_counter'),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      const Text('Best:'),
                      Text('9', style: TextStyle(fontSize: Theme.of(context).textTheme.headline5!.fontSize)),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: 100.0,
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _init();
                            });
                          },
                          child: const Text('Restart'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.extent(
              maxCrossAxisExtent: 300.0,
              children: _cards
                  .map(
                    (card) => Card(
                      child: InkWell(
                        onTap: _tapLock || card.isRevealed ? null : () => _cardOnTap(card),
                        child: card.isRevealed ? card.image : null,
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  void _init() {
    _cards.clear();
    revealedCard;
    _tapLock = false;
    _counter = 0;

    var numberOfUniqueCards = widget.numberOfCards ~/ 2;
    var cardIndexes = List.generate(numberOfUniqueCards, (index) => index).toList();
    for (var index in cardIndexes) {
      _cards.add(MyCard(index));
      _cards.add(MyCard(index));
    }
    _cards.shuffle();
  }

  void _cardOnTap(MyCard card) {
    if (revealedCard == null) {
      setState(() {
        card.isRevealed = true;
        revealedCard = card;
      });
    } else {
      _counter++;
      if (revealedCard!.index == card.index) {
        setState(() {
          card.isRevealed = true;
          revealedCard = null;
        });
      } else {
        setState(() {
          card.isRevealed = true;
          _tapLock = true;
        });
        Future.delayed(const Duration(seconds: 1), () {
          setState(() {
            card.isRevealed = false;
            revealedCard!.isRevealed = false;
            revealedCard = null;
            _tapLock = false;
          });
        });
      }
    }
  }
}
