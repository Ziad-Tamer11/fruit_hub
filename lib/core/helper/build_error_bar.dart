import 'package:flutter/material.dart';

void buildErrorBar(BuildContext context, String errMessage) {
  ScaffoldMessenger.of(
    context,
  ).showSnackBar(SnackBar(content: Text(errMessage)));
}
