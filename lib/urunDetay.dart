import 'package:e_ticaret/bilesenler/baslik.dart';
import 'package:e_ticaret/etiket.dart';
import 'package:flutter/material.dart';

class UrunDetayPage extends StatefulWidget {
  String urunBaslik;

  UrunDetayPage(this.urunBaslik);

  @override
  State<UrunDetayPage> createState() => _UrunDetayPageState();
}

class _UrunDetayPageState extends State<UrunDetayPage> {
  Color renkSec = Colors.blueGrey;
  int kapasiteSec = 64;

  List<Color> renkler = [
    Colors.blueGrey,
    Colors.brown,
    Colors.white,
    Colors.green,
  ];

  List<int> kapasite = [64, 256, 512];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Stack(children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //baslik
            baslik(widget.urunBaslik, context),
            SizedBox(height: 32),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ListView(
                  children: [
                    etiket("Yeni mal"),
                    SizedBox(
                      height: 25,
                    ),
                    Center(child: Image.asset("assets/images/ip.png")),

                    SizedBox(
                      height: 30,
                    ),

                    //renk seçenek ksımı
                    Text(
                      "renk",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Color(0XFF0A1034)),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: renkler
                            .map((Color color) =>
                                telRenk(color, renkSec == color, () {
                                  setState(() {
                                    renkSec = color;
                                  });
                                }))
                            .toList()),

                    SizedBox(
                      height: 32,
                    ),
                    //kapasite seçenek kısmı
                    Text(
                      "Kapasite",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Color(0XFF0A1034)),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: kapasite
                          .map((int number) => kapasiteSecenek(
                                  number, kapasiteSec == number, () {
                                setState(() {
                                  kapasiteSec = number;
                                });
                              }))
                          .toList(),
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    // ürün sepete ekleme
                    GestureDetector(
                      onTap: () {
                        print("ürün sepete eklendi.");
                        print("ürünün ismi:" + widget.urunBaslik);
                        print("Ürünün rengi: " + renkSec.value.toString());
                        print("Ürünün kapasitesi: " +
                            kapasiteSec.toString() +
                            "gb ");
                      },
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(vertical: 16),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: Color(0XFF1F53E4)),
                        child: Text(
                          "Sepete yolla",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ])));
  }
}

// renk seçme
Widget telRenk(Color color, bool sec, var onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      margin: EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
          border: Border.all(color: Color(0XFF0001FC), width: sec ? 3 : 0)),
      width: 23,
      height: 23,
    ),
  );
}

//kapasite seçme
Widget kapasiteSecenek(int kapasite, bool sec, var onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      margin: EdgeInsets.only(right: 23),
      child: Text(
        "$kapasite gb",
        style: TextStyle(
            color: Color(sec ? 0XFF0001FC : 0XFFA7A9BE), fontSize: 16),
      ),
    ),
  );
}
