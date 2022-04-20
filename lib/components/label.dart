import 'package:flutter/material.dart';

Widget label(String text) {
  return Container(
    padding: EdgeInsets.all(4),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2), color: Color(0xFFD8ECCD)),


    child: Text(
      text,
      style: TextStyle(color: Color(0xFF03092B), fontSize: 12),
    ),
  );
}
