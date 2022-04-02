import 'package:e_ticaret/bilesenler/baslik.dart';
import 'package:e_ticaret/favori/compass.dart';
import 'package:e_ticaret/etiket.dart';
import 'package:e_ticaret/favori/nokia.dart';
import 'package:flutter/material.dart';

class favoriPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                baslik("Favoriler", context),

                SizedBox(
                  height: 16,
                ),
                Padding(padding: EdgeInsets.only(top: 24)),
                //Satış kısmı
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MaterialButton(
                      onPressed: (() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => NokiaPage("Nokia")));
                      }),
                      child: buildSatis(
                        "Nokia 3310",
                        "assets/images/nokia.png",
                        "-%99",
                        "100 YTL",
                        screenWidth,
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => CompassPage("Compass")));
                      },
                      child: buildSatis(
                        "Compass 1982",
                        "assets/images/compass.png",
                        "-%99",
                        "400 YTL",
                        screenWidth,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 80,
          ),
        ],
      )),
    );
  }

  Widget buildSatis(
    @required String text,
    @required String photoUrl,
    @required String discount,
    @required String fiyat,
    @required double screenWidth,
  ) {
    return Container(
      width: (screenWidth - 60) * 0.4,
      padding: EdgeInsets.only(left: 0, top: 12, bottom: 21, right: 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //%99

          etiket(discount),

          // telefon resmi

          Image.asset(photoUrl),
          SizedBox(
            height: 22,
          ),

          //ismi
          Center(
            child: Text(
              text,
              style: TextStyle(fontSize: 18, color: Color(0xFF0A1034)),
            ),
          ),
          Center(
            child: Text(
              fiyat,
              style: TextStyle(fontSize: 18, color: Color(0xFF0A1034)),
            ),
          ),
        ],
      ),
    );
  }
}
/*
Widget buildicerik(String title, String fotoUrl, String fiyat, context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return NokiaPage(title);
      }));
    },
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 24,
                offset: Offset(0, 16))
          ]),
      child: Column(children: [
        SizedBox(
          height: 16,
        ),
        Image.asset(fotoUrl),
        SizedBox(
          height: 34,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                  color: Color(0XFF3A1034),
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
            Text(
              "$fiyat YTL",
              style: TextStyle(
                  color: Color(0XFF0001FC),
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
            )
          ],
        )
      ]),
    ),
  );
}
*/