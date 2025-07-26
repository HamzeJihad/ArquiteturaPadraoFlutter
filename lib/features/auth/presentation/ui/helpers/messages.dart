import 'package:flutter/material.dart';

class MessagesService {
  static GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  static showCustomSnackBar(String message, {bool error = false}) {
    final snackBar = SnackBar(
      content: Text(message, style: TextStyle(fontSize: 20, color: Colors.white)),
      backgroundColor: error ? Colors.red : Colors.green,
      duration: const Duration(seconds: 2),
    );
    scaffoldMessengerKey.currentState?.showSnackBar(snackBar);
  }
}
