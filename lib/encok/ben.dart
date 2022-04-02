import 'package:e_ticaret/bilesenler/baslik.dart';
import 'package:e_ticaret/etiket.dart';
import 'package:flutter/material.dart';

class BenPage extends StatefulWidget {
  String urunBaslik;

  BenPage(this.urunBaslik);

  @override
  State<BenPage> createState() => _BenPageState();
}

class _BenPageState extends State<BenPage> {
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
                    etiket("Oyuncaktır!!!"),
                    SizedBox(
                      height: 25,
                    ),
                    Center(child: Image.asset("assets/images/ben.png")),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Açıklama: ",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    buildbilgi(),
                    buildbilgii(),
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

Widget buildbilgi() {
  return Padding(
    padding: const EdgeInsets.only(top: 24.0),
    child: Text(
      "Ben 10 eğitici bilgisayarı kullanarak çocukluğunuzu yaşabilirsiniz,kendinizi eğlendirebilrsiniz.",
      style: TextStyle(
          fontSize: 18, color: Colors.blueGrey, fontWeight: FontWeight.bold),
    ),
  );
}

Widget buildbilgii() {
  return Padding(
    padding: const EdgeInsets.only(top: 24.0),
    child: Text(
      "NOT: STOKTA YOKTUR",
      style: TextStyle(
          fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
    ),
  );
}
