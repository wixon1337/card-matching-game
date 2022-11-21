import 'package:flutter/material.dart';

class MyCard {
  MyCard(this.index);

  int index;
  bool isRevealed = false;

  Image get image => Image(image: AssetImage('assets/cards/${images[index]}.png'));
}

List<String> images = ['angular', 'd3', 'evista', 'jenkins', 'postcss', 'react', 'redux', 'sass', 'ts', 'webpack'];
