import 'package:e_ticaret/bilesenler/baslik.dart';
import 'package:e_ticaret/etiket.dart';
import 'package:flutter/material.dart';

class NokiaPage extends StatefulWidget {
  String urunBaslik;

  NokiaPage(this.urunBaslik);

  @override
  State<NokiaPage> createState() => _NokiaPageState();
}

class _NokiaPageState extends State<NokiaPage> {
  int kapasiteSec = 16;

  List<int> kapasite = [16, 32, 64];

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
                    etiket("Eski mal"),
                    SizedBox(
                      height: 25,
                    ),
                    Center(child: Image.asset("assets/images/nokia.png")),
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
                      height: 16,
                    ),
                    buildbilgi(),
                    SizedBox(
                      height: 32,
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
                    GestureDetector(
                      onTap: () {
                        print("ürün sepete eklendi.");
                        print("ürünün ismi:" + widget.urunBaslik);
                        print("Ürünün kapasitesi: " +
                            kapasiteSec.toString() +
                            "mb ");
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

Widget kapasiteSecenek(int kapasite, bool sec, var onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      margin: EdgeInsets.only(right: 23),
      child: Text(
        "$kapasite mb",
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
      "Arama, mesajlaşma oyun gibi seçenekleri vardır. Çok sağlamdır. 3. Dünya savaşını bilmem ama 4. Dünya savaşında Nokia 3310 silah olarak kullanılacaktır.",
      style: TextStyle(
          fontSize: 18, color: Colors.blueGrey, fontWeight: FontWeight.bold),
    ),
  );
}
