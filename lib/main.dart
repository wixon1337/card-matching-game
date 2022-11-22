import 'package:card_matching_game/screens/board_screen.dart';
import 'package:card_matching_game/screens/home_screen.dart';
import 'package:card_matching_game/utils/shared_prefs.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SharedPrefs.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Card Matching Game',
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      home: const HomeScreen(),
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        BoardScreen.routeName: (context) => const BoardScreen(),
      },
    );
  }
}
