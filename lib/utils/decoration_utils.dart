import 'package:flutter/material.dart';

class DecorationUtils {
  static List<BoxShadow> boxShadow = [
    BoxShadow(
      color: Colors.grey.withOpacity(0.2),
      spreadRadius: 1,
      blurRadius: 10,
      offset: const Offset(1, 1), // changes position of shadow
    ),
  ];
}
