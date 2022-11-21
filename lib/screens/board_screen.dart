import 'package:card_matching_game/components/board.dart';
import 'package:card_matching_game/components/my_appbar.dart';
import 'package:flutter/material.dart';

class BoardScreen extends StatefulWidget {
  const BoardScreen({super.key});

  static const routeName = '/board';

  @override
  State<BoardScreen> createState() => _BoardScreenState();
}

class _BoardScreenState extends State<BoardScreen> {

  @override
  Widget build(BuildContext context) {
    var numberOfCards = ModalRoute.of(context)?.settings.arguments as int?;

    return Scaffold(
      appBar: const MyAppBar(),
      body: numberOfCards != null ? Board(numberOfCards: numberOfCards) : Container(),
    );
  }
}
