import 'package:e_ticaret/encok/barbie.dart';
import 'package:e_ticaret/bilesenler/baslik.dart';
import 'package:e_ticaret/encok/ben.dart';
import 'package:e_ticaret/etiket.dart';
import 'package:flutter/material.dart';

class encokPage extends StatelessWidget {
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
                baslik("En Çok Satılan", context),
                SizedBox(
                  height: 16,
                ),
                Padding(padding: EdgeInsets.only(top: 24)),
                //Satış  kısmı
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MaterialButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => BarbiePage("Barbie")));
                      },
                      child: buildSatis(
                        "Barbie Sesli Oyuncak Telefon",
                        "assets/images/barbie.png",
                        "-%99",
                        "50 YTL",
                        screenWidth,
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => BenPage("Ben")));
                      },
                      child: buildSatis(
                        "Ben 10 laptop",
                        "assets/images/ben.png",
                        "-%99",
                        "100 YTL",
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
      padding: EdgeInsets.only(left: 12, top: 12, bottom: 21, right: 12),
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
