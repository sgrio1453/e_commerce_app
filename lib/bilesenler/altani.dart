import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:e_ticaret/hava.dart';
import 'package:e_ticaret/home.dart';
import 'package:e_ticaret/profil.dart';
import 'package:e_ticaret/odul.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}

class AlttaraffPage extends StatefulWidget {
  @override
  String? email;
  AlttaraffPage.withEmail(this.email);
  AlttaraffPage();
  State<AlttaraffPage> createState() => _AlttaraffPageState();
}

class _AlttaraffPageState extends State<AlttaraffPage> {
  int index = 0;

  final navigationKey = GlobalKey<CurvedNavigationBarState>();

  @override
  Widget build(BuildContext context) {
    final screens = [
      HomePage(),
      Havapage(),
      OdulPage(),
      ProfilPage(widget.email.toString()),
    ];
    //İkonlar
    final items = <Widget>[
      Icon(
        Icons.home,
        size: 30,
      ),
      Icon(
        Icons.sunny,
        size: 30,
      ),
      Icon(
        Icons.star,
        size: 30,
      ),
      Icon(
        Icons.person,
        size: 30,
      ),
    ];
    //özellikleri
    return Container(
      color: Colors.blue,
      child: SafeArea(
        top: false,
        child: Scaffold(
          extendBody: true,
          body: screens[index],
          bottomNavigationBar: Theme(
            data: Theme.of(context)
                .copyWith(iconTheme: IconThemeData(color: Colors.white)),
            child: CurvedNavigationBar(
              key: navigationKey,
              color: Colors.blue,
              buttonBackgroundColor: Colors.blueGrey,
              backgroundColor: Colors.transparent,
              height: 60,
              animationCurve: Curves.easeInOut,
              animationDuration: Duration(milliseconds: 300),
              index: index,
              items: items,
              onTap: (index) => setState(() => this.index = index),
            ),
          ),
        ),
      ),
    );
  }
}
