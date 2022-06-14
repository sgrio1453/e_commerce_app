import 'package:e_ticaret/benzin.dart';
import 'package:e_ticaret/encok/barbie.dart';
import 'package:e_ticaret/encok/ben.dart';
import 'package:e_ticaret/etiket.dart';
import 'package:e_ticaret/favori/compass.dart';
import 'package:e_ticaret/favori/nokia.dart';
import 'package:e_ticaret/hediye/aycicek.dart';
import 'package:e_ticaret/hediye/hediyebir.dart';
import 'package:e_ticaret/kulaklik.dart';
import 'package:e_ticaret/monster.dart';
import 'package:e_ticaret/urunDetay.dart';
import 'package:flutter/material.dart';
import 'package:e_ticaret/bilesenler/baslik.dart';

class TumUrunlerPage extends StatefulWidget {
  const TumUrunlerPage({Key? key}) : super(key: key);

  @override
  State<TumUrunlerPage> createState() => _TumUrunlerPageState();
}

class _TumUrunlerPageState extends State<TumUrunlerPage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        body: SafeArea(
            child: ListView(children: [
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //baslik
              baslik("Tüm ürünler", context),
              SizedBox(
                height: 32,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MaterialButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) =>
                                  UrunDetayPage("Kaçak Afyon 13 pro dubleks")));
                    },
                    child: buildSatis(
                      "Kaçak Afyon 13 pro dubleks",
                      "assets/images/ip.png",
                      "-%99",
                      "1300 YTL",
                      screenWidth,
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) =>
                                  MonsterPage("Manstır Hamsi V.12.1")));
                    },
                    child: buildSatis(
                      "Manstır Hamsi V.12.1",
                      "assets/images/monster.png",
                      "-%99",
                      "1500 YTL",
                      screenWidth,
                    ),
                  ),
                ],
              ),
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
                      )),
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
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MaterialButton(
                      onPressed: (() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => CompassPage("Compass")));
                      }),
                      child: buildSatis(
                        "Compass 1982",
                        "assets/images/compass.png",
                        "-%99",
                        "400 YTL",
                        screenWidth,
                      )),
                  MaterialButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => BenPage("Ben 10")));
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MaterialButton(
                    onPressed: (() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) =>
                                  KulaklikPage("Orijinal Kulaklık")));
                    }),
                    child: buildSatis(
                      "Kulaklık",
                      "assets/images/kulak.png",
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
                              builder: (_) => BenzinPage("1 Litre benzin")));
                    },
                    child: buildSatis(
                      "1 Litre Benzin",
                      "assets/images/benzinn.png",
                      "-%99",
                      "50 YTL",
                      screenWidth,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 80,
              ),
            ],
          )),
    ])));
  }
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
        //%50

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
