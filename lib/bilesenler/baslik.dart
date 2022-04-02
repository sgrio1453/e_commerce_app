import 'package:flutter/material.dart';

Widget baslik(String title, context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(height: 29),
      // geri ikonu
      GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Icon(
          Icons.arrow_back,
          color: Color(0xFF0A1034),
          size: 27,
        ),
      ),

      //Başlık kısmında yazacak yazı
      SizedBox(height: 24),
      Text(
        title,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Color(0xFF0A1034)),
      ),
    ],
  );
}
