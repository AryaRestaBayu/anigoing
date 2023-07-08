import 'package:flutter/material.dart';

class Utilities {
  static final messengerKey = GlobalKey<ScaffoldMessengerState>();

  static snackBar(String text, Color color) {
    final snackbar = SnackBar(
      content: Text(text),
      backgroundColor: color,
    );

    messengerKey.currentState!
      ..removeCurrentSnackBar()
      ..showSnackBar(snackbar);
  }
}
