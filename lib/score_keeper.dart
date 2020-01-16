import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScoreKeeper {
  List<Widget> answers = [];

  void badAnswer() => answers.add(Icon(
        Icons.close,
        color: Colors.red,
      ));

  void goodAnswer() => answers.add(Icon(
        Icons.check,
        color: Colors.green,
      ));

  void reset() => answers = [];
}
