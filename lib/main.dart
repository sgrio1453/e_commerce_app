import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_ticaret/bilesenler/altani.dart';
import 'package:e_ticaret/bilesenler/urunDepo.dart';
import 'package:e_ticaret/bilesenler/urunKontrol.dart';
import 'package:e_ticaret/giris.dart';
import 'package:e_ticaret/servis/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyBbRXw-ZYL0vezfNIa9Kru_iBgYmIl5NnU",
          appId: "415816758327",
          messagingSenderId: "",
          projectId: "eticaretproje-b597f"));
  runApp(MyApp());
}

var auth = AuthService();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => UrunKontrol(urunDepo: Get.find()));
    Get.lazyPut(() => UrunDepo());
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Kaçtı Kaçıyor',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: endless());
  }
}

Widget endless() {
  return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasData) {
          return AlttaraffPage();
        } else if (snapshot.hasError) {
          return Center(child: Text("bir şeyler yanlış gitti"));
        } else {
          return LoginPage();
        }
      });
}
