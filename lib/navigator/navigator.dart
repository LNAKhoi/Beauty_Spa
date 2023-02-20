import 'package:flutter/material.dart';

class Navigate {
  static toScreen(BuildContext context, Widget destinationWidget) {
    return Navigator.push(
        context, MaterialPageRoute(builder: (context) => destinationWidget));
  }
}
