import 'package:card_matching_game/models/my_card.dart';
import 'package:card_matching_game/utils/shared_prefs.dart';
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
                      Text(SharedPrefs.getBestScore().toString(),
                          style: TextStyle(fontSize: Theme.of(context).textTheme.headline5!.fontSize)),
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
                          onPressed: _restart,
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
    var numberOfUniqueCards = widget.numberOfCards ~/ 2;
    var cardIndexes = List.generate(numberOfUniqueCards, (index) => index).toList();
    for (var index in cardIndexes) {
      _cards.add(MyCard(index));
      _cards.add(MyCard(index));
    }
    _cards.shuffle();
  }

  void _restart() {
    setState(() {
      _cards.clear();
      revealedCard = null;
      _tapLock = false;
      _counter = 0;

      _init();
    });
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

        gameOverCheck();
      } else {
        setState(() {
          card.isRevealed = true;
          _tapLock = true;
        });
        Future.delayed(const Duration(seconds: 1), () {
          if (revealedCard != null) {
            setState(() {
              card.isRevealed = false;
              revealedCard!.isRevealed = false;
              revealedCard = null;
              _tapLock = false;
            });
          }
        });
      }
    }
  }

  void gameOverCheck() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
          title: Row(
        children: const [
          Icon(Icons.emoji_events, color: Colors.amber),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: Text('Congratulation! You did it!'),
          ),
          Icon(Icons.emoji_events, color: Colors.amber),
        ],
      )),
    );
    if (_cards.every((card) => card.isRevealed)) {
      if (_counter < SharedPrefs.getBestScore()) SharedPrefs.saveBestScore(_counter);
      _restart();
    }
  }
}
