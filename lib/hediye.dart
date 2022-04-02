import 'package:e_ticaret/bilesenler/baslik.dart';
import 'package:e_ticaret/etiket.dart';
import 'package:e_ticaret/hediye/aycicek.dart';
import 'package:e_ticaret/hediye/hediyebir.dart';
import 'package:flutter/material.dart';

class hediyePage extends StatelessWidget {
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
                baslik("Hediyeler", context),

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
                                builder: (_) => HediyeBirPage(
                                    "Karıcığım beni affet hediye kutusu")));
                      }),
                      child: buildSatis(
                        "Hanıma hediye",
                        "assets/images/hediye1.jpg",
                        "-%99",
                        "1000 YTL",
                        screenWidth,
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) =>
                                    AycicekPage("Ayçiçek Yağı 5 lt")));
                      },
                      child: buildSatis(
                        "Ayçiçek Yağı",
                        "assets/images/aycicek.png",
                        "-%99",
                        "250 YTL",
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
