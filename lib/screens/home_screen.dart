import 'package:card_matching_game/screens/board_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedSize = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Image(
          image: AssetImage('assets/evista.png'),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40.0),
              child: Text('Splendex Memory Game', style: Theme.of(context).textTheme.headline4),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text('Deck size'),
                  DropdownButton(
                    value: _selectedSize,
                    items: List.generate(
                      8,
                      (index) => DropdownMenuItem(value: index + 3, child: Text('${(index + 3) * 2}')),
                    ).toList(),
                    onChanged: (value) {
                      if (value != null) {
                        setState(() {
                          _selectedSize = value;
                        });
                      }
                    },
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, BoardScreen.routeName, arguments: _selectedSize);
                    },
                    child: const Text('Start game'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
