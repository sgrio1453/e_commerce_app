import 'package:flutter/material.dart';

class OdulPage extends StatelessWidget {
  final Color barColor = Colors.white;
  final Color barBackgroundColor = const Color(0xff72d8bf);
  final double width = 22;

  const OdulPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Ödüllerimiz",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Önceden işler illegaldi artık legal.",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "                                           ~Sir Elon Musk~",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Card(
                    margin: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                    child: Image.asset(
                      "assets/images/enuygun.gif",
                      width: 280,
                      height: 280,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Yılın en uygun fiyatlı e-ticaret uygulaması",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  tire(),
                  Card(
                    margin: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                    child: Image.asset(
                      "assets/images/yilin.png",
                      width: 280,
                      height: 280,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Yılın en iyi e-ticaret uygulaması",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  tire(),
                  Card(
                    margin: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                    child: Image.asset(
                      "assets/images/bos.png",
                      width: 280,
                      height: 280,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Yılın en iyi kaçak imalatçısı",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  tire(),
                  Card(
                    margin: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                    child: Image.asset(
                      "assets/images/oscarr.png",
                      width: 280,
                      height: 370,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Yılın en iyi iş adamı",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  tire(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget tire() {
  return Container(
    child: Text(
      "---------------------------------------------------------------",
      style: TextStyle(fontSize: 20, color: Colors.blueGrey),
    ),
  );
}
