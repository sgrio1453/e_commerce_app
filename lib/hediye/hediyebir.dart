import 'package:e_ticaret/bilesenler/baslik.dart';
import 'package:e_ticaret/etiket.dart';
import 'package:flutter/material.dart';

class HediyeBirPage extends StatefulWidget {
  String urunBaslik;

  HediyeBirPage(this.urunBaslik);

  @override
  State<HediyeBirPage> createState() => _HediyeBirPageState();
}

class _HediyeBirPageState extends State<HediyeBirPage> {
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
                    etiket("Kadınlar çiçektir."),
                    SizedBox(
                      height: 25,
                    ),
                    Center(child: Image.asset("assets/images/hediye1.jpg")),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Açıklama: ",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Color(0XFF0A1034)),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    buildbilgi(),
                    buildbilgii(),
                    SizedBox(
                      height: 100,
                    ),
                    GestureDetector(
                      onTap: () {
                        print("ürün sepete eklendi.");
                        print("ürünün ismi:" + widget.urunBaslik);
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
                      height: 32,
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

Widget buildbilgi() {
  return Padding(
    padding: const EdgeInsets.only(top: 24.0),
    child: Text(
      "Eşinizle kötü bir gün mü geçirdiniz, onun kalbini mi kazanmak istiyorsunuz.İşte tam sizlik hediye.",
      style: TextStyle(
          fontSize: 18, color: Colors.blueGrey, fontWeight: FontWeight.bold),
    ),
  );
}

Widget buildbilgii() {
  return Padding(
    padding: const EdgeInsets.only(top: 24.0),
    child: Text(
      "NOT: TEK HEDİYE İLE KALBİNİ KAZANAMAZSINIZ!",
      style: TextStyle(
          fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
    ),
  );
}
