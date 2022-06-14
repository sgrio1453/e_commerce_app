import 'package:e_ticaret/bilesenler/altani.dart';
import 'package:e_ticaret/kayit.dart';
import 'package:e_ticaret/servis/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  AuthService _authService = AuthService();
  FirebaseAuth auth = FirebaseAuth.instance;
  var email = "";
  var password = "";

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white10,
                          child: Image.asset(
                            "assets/images/elon.png",
                          ),
                          radius: 90,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Yasal E-Ticaret",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "En uygun fiyata almak için hemen giriş yap",
                      style: TextStyle(fontSize: 15),
                    ),
                    SizedBox(
                      height: 80,
                    ),
                    TextField(
                        controller: _emailController,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        cursorColor: Colors.black,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.mail,
                            color: Colors.black,
                          ),
                          hintText: 'E-Mail',
                          prefixText: ' ',
                          hintStyle: TextStyle(color: Colors.black),
                          focusColor: Colors.black,
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.black,
                          )),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.black,
                          )),
                        )),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    TextField(
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        cursorColor: Colors.black,
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.vpn_key,
                            color: Colors.black,
                          ),
                          hintText: 'Parola',
                          prefixText: ' ',
                          hintStyle: TextStyle(
                            color: Colors.black,
                          ),
                          focusColor: Colors.black,
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.black,
                          )),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.black,
                          )),
                        )),
                    SizedBox(
                      height: size.height * 0.08,
                    ),
                    InkWell(
                      onTap: () {
                        _authService
                            .signIn(
                                _emailController.text, _passwordController.text)
                            .then((value) {
                          return Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AlttaraffPage.withEmail(
                                      _emailController.text.toString())));
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 2),
                            //color: colorPrimaryShade,
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Center(
                              child: Text(
                            "Giriş yap",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          )),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => KayitPage()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 1,
                            width: 75,
                            color: Colors.black,
                          ),
                          Text(
                            "Kayıt ol",
                            style: TextStyle(color: Colors.black),
                          ),
                          Container(
                            height: 1,
                            width: 75,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
