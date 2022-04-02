import 'package:e_ticaret/bilesenler/baslik.dart';
import 'package:e_ticaret/etiket.dart';
import 'package:flutter/material.dart';

class MonsterPage extends StatefulWidget {
  String urunBaslik;

  MonsterPage(this.urunBaslik);
  @override
  State<MonsterPage> createState() => _MonsterPageState();
}

class _MonsterPageState extends State<MonsterPage> {
  int kapasiteSec = 256;

  List<int> kapasite = [256, 512, 1024];
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
                    Center(child: Image.asset("assets/images/monster.png")),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Kapasite",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Color(0XFF0A1034)),
                    ),
                    SizedBox(
                      height: 20,
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
                      height: 16,
                    ),
                    buildbilgi(),
                    SizedBox(
                      height: 16,
                    ),
                    buildbilgii(),
                    SizedBox(
                      height: 16,
                    ),
                    GestureDetector(
                      onTap: () {
                        print("ürün sepete eklendi.");
                        print("ürünün ismi:" + widget.urunBaslik);
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

Widget buildbilgi() {
  return Padding(
    padding: const EdgeInsets.only(top: 24.0),
    child: Text(
      "Manstır Hamsi V.12.1 Gücünü Karadenizin simgesi olan hamsiden almıştır.",
      style: TextStyle(
          fontSize: 18, color: Colors.blueGrey, fontWeight: FontWeight.bold),
    ),
  );
}

Widget buildbilgii() {
  return Padding(
    padding: const EdgeInsets.only(top: 24.0),
    child: Text(
      "ÖNEMLİ BİLGİ: Karadeniz tuzlu olmasının sebebi hamsilerin her gece ağlamasıdır.",
      style: TextStyle(
          fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
    ),
  );
}
