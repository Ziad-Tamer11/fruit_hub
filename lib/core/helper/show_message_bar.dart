import 'package:flutter/material.dart';

void showMessageBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: Duration(milliseconds: 300),
      behavior: SnackBarBehavior.floating,
      content: Text(message),
    ),
  );
}
