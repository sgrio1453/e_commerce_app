import 'package:e_ticaret/encok.dart';
import 'package:e_ticaret/encok/barbie.dart';
import 'package:e_ticaret/etiket.dart';
import 'package:e_ticaret/favori/nokia.dart';
import 'package:e_ticaret/favoriler.dart';
import 'package:e_ticaret/hediye.dart';
import 'package:e_ticaret/hepsi.dart';
import 'package:e_ticaret/monster.dart';
import 'package:e_ticaret/urunDetay.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ListView(
                children: [
                  //BAŞLIKKKK
                  buildbaslik(),
                  // BANNEsR
                  buildbanner(context),
                  SizedBox(
                    height: 20,
                  ),
                  Image.asset("assets/images/ramazan.gif"),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Text(
                      "Mübarek Ramazan ayına özel tüm ürünlerde %99 indirim vardır.    ",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  // BUTONLAR
                  Padding(
                    padding: EdgeInsets.only(top: 48.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // ürünler,favoriler,hediyeler,en çok satılan
                          buildNavgation("Tüm ürünler", Icons.menu,
                              TumUrunlerPage(), context),
                          buildNavgation("Favoriler", Icons.star_border,
                              favoriPage(), context),
                          buildNavgation("Hediyeler", Icons.card_giftcard,
                              hediyePage(), context),
                          buildNavgation("en çok satılan", Icons.people,
                              encokPage(), context),
                        ]),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  //öne çıkanlar yazısı
                  Text(
                    "ÖNE ÇIKAN ÜRÜNLER",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 16,
                  ),

                  //SAtış kısmı
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MaterialButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => UrunDetayPage(
                                      "Kaçak Afyon 13 pro dubleks")));
                        },
                        child: buildSatis(
                          "Kaçak Afyon 13 pro dubleks",
                          "assets/images/ip.png",
                          "-%99",
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
                          screenWidth,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// en üst kısım
Widget buildbaslik() {
  return Padding(
    padding: const EdgeInsets.only(top: 24.0),
    child: Text(
      "Yasal alışveriş uygulamasına hoşgeldiniz :)",
      style: TextStyle(
          fontSize: 18, color: Colors.blueGrey, fontWeight: FontWeight.bold),
    ),
  );
}

// en üst telefon
Widget buildbanner(BuildContext context) {
  return Padding(
    padding: EdgeInsets.only(top: 24.0),
    child: Container(
      width: double.infinity,
      padding: EdgeInsets.only(left: 24.0, right: 36, top: 14, bottom: 18),
      decoration: BoxDecoration(
          color: Colors.blueGrey, borderRadius: BorderRadius.circular(6)),
      child: MaterialButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) =>
                      UrunDetayPage("Kaçak Afyon 13 pro dubleks ")));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("kaçak afyon 13",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600)),
                SizedBox(
                  height: 4,
                ),
                Text("pro dubleks",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600)),
                SizedBox(
                  height: 4,
                ),
                Text("1300 YTL",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w500)),
              ],
            ),
            Image.asset(
              "assets/images/ipho.png",
            ),
          ],
        ),
      ),
    ),
  );
}

// Kategori,favoriler,hediyeler,en çok satılan
Widget buildNavgation(
  @required String text,
  @required IconData icon,
  Widget widget,
  BuildContext context,
) {
  return GestureDetector(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return widget;
      }));
    },
    child: Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 19, vertical: 22),
          decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
          child: Icon(
            icon,
            color: Colors.white,
            size: 18,
          ),
        ),
        SizedBox(
          height: 8,
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          text,
          style: TextStyle(
              color: Colors.blueGrey,
              fontSize: 14,
              fontWeight: FontWeight.w500),
        ),
      ],
    ),
  );
}

//satış kısmı yazı resim
Widget buildSatis(
  @required String text,
  @required String photoUrl,
  @required String discount,
  @required double screenWidth,
) {
  return Column(
    children: [
      Container(
        width: (screenWidth - 60) * 0.4,
        padding: EdgeInsets.only(left: 12, top: 12, bottom: 21, right: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //%99

            etiket(discount),

            // telefon resmi

            Container(child: Image.asset(photoUrl)),
            SizedBox(
              height: 22,
            ),

            //ismi
            Container(
              child: Center(
                child: Text(
                  text,
                  style: TextStyle(fontSize: 18, color: Color(0xFF0A1034)),
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
