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
    return Scaffold(
      appBar: const MyAppBar(),
      body: Column(),
    );
  }
}
