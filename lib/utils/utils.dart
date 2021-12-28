import 'package:flutter/material.dart';

class Utils {
  void showInSnackBar(BuildContext context, String value) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value)));
  }
}
