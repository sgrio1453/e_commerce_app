import 'package:flutter/material.dart';

TextStyle titleFont =
    const TextStyle(fontWeight: FontWeight.w600, fontSize: 18);
TextStyle infoFont = const TextStyle(fontWeight: FontWeight.w400, fontSize: 18);

Widget ekBilgi(
    String wind, String humidity, String pressure, String feels_like) {
  return Container(
    width: double.infinity,
    padding: EdgeInsets.all(18),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Rüzgar",
                  style: titleFont,
                ),
                SizedBox(
                  height: 18,
                ),
                Text(
                  "Basınç",
                  style: titleFont,
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "$wind",
                  style: infoFont,
                ),
                SizedBox(
                  height: 18,
                ),
                Text(
                  "$pressure",
                  style: infoFont,
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Nem",
                  style: titleFont,
                ),
                SizedBox(
                  height: 18,
                ),
                Text(
                  "Hissedilen Sıcaklık",
                  style: titleFont,
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "$humidity",
                  style: infoFont,
                ),
                SizedBox(
                  height: 18,
                ),
                Text(
                  "$feels_like",
                  style: infoFont,
                ),
              ],
            ),
          ],
        )
      ],
    ),
  );
}
