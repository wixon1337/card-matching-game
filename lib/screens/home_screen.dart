import 'package:card_matching_game/screens/board_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedSize = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: const Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Image(
            image: AssetImage('assets/evista.png'),
            height: 50.0,
            width: 150.0,
          ),
        ),
        leadingWidth: 150.0,
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40.0),
              child: Text('Splendex Memory Game',
                  style: Theme.of(context).textTheme.headline4!.apply(color: Colors.black)),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text('Deck size'),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 20.0),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.withOpacity(0.5)),
                        borderRadius: BorderRadius.circular(4.0),
                        color: Colors.white,
                      ),
                      child: DropdownButton(
                        value: _selectedSize,
                        items: List.generate(
                          8,
                          (index) => DropdownMenuItem(
                            value: (index + 3) * 2,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Text('${(index + 3) * 2}'),
                            ),
                          ),
                        ).toList(),
                        onChanged: (value) {
                          if (value != null) {
                            setState(() {
                              _selectedSize = value;
                            });
                          }
                        },
                        underline: Container(),
                      ),
                    ),
                  ),
                  MaterialButton(
                    color: Colors.red,
                    minWidth: 180.0,
                    height: 64.0,
                    onPressed: () {
                      Navigator.pushNamed(context, BoardScreen.routeName, arguments: _selectedSize);
                    },
                    child: const Text('START NEW GAME', style: TextStyle(color: Colors.white, fontSize: 20.0)),
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
