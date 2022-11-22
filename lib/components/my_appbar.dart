import 'package:flutter/material.dart';

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  State<MyAppBar> createState() => _MyAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(50.0);
}

class _MyAppBarState extends State<MyAppBar> {
  //int? _selectedSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      /* actions: [
        DropdownButton(
          value: _selectedSize,
          items: List.generate(8, (index) => DropdownMenuItem(value: index + 3, child: Text('${index + 3}'))).toList(),
          onChanged: (value) {
            setState(() {
              _selectedSize = value;
            });
          },
        ),
        ElevatedButton(onPressed: () {}, child: const Text('Start game')),
      ], */
    );
  }
}
