import 'package:e_ticaret/data/database.dart';
import 'package:e_ticaret/giris.dart';
import 'package:e_ticaret/models/kullanici.dart';
import 'package:e_ticaret/servis/auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class KayitPage extends StatefulWidget {
  @override
  _KayitPageState createState() => _KayitPageState();
}

class _KayitPageState extends State<KayitPage> {
  late KulBilgiDatabase db;
  late User user;
  var uuid = Uuid();
  int id = 0;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordAgainController =
      TextEditingController();
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  AuthService _authService = AuthService();

  @override
  void initState() {
    db = KulBilgiDatabase.instance;
    super.initState();
  }

  Future addUser(var username, var email, var uniqueId) async {
    var user = User(userName: username, email: email, uniqueId: uniqueId);
    await KulBilgiDatabase.instance.create(user);
  }

  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 90),
                child: Center(
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.white10,
                              child: Image.asset(
                                "assets/images/elonn.png",
                              ),
                              radius: 90,
                            ),
                            Text("Hemen kayıt ol",
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold)),
                            SizedBox(
                              height: 10,
                            ),
                            TextField(
                                controller: _nameController,
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                                cursorColor: Colors.black,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.person,
                                    color: Colors.black,
                                  ),
                                  hintText: 'Kullanıcı adı',
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
                            TextField(
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                                cursorColor: Colors.black,
                                controller: _passwordAgainController,
                                obscureText: true,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.vpn_key,
                                    color: Colors.black,
                                  ),
                                  hintText: 'Parola Tekrar',
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
                              height: 50,
                            ),
                            InkWell(
                              onTap: () {
                                var uniqueId = uuid.v4();
                                id++;
                                setState(() {
                                  if (_nameController.text
                                          .toString()
                                          .isNotEmpty &&
                                      _emailController.text
                                          .toString()
                                          .isNotEmpty &&
                                      _passwordController.text
                                          .toString()
                                          .isNotEmpty &&
                                      _passwordAgainController.text
                                          .toString()
                                          .isNotEmpty) {
                                    if (_passwordController.text.toString() ==
                                        _passwordAgainController.text
                                            .toString()) {
                                      if (_passwordController.text.length >=
                                          6) {
                                        _authService.signUp(
                                            _emailController.text.toString(),
                                            _passwordController.text
                                                .toString());

                                        _authService.createPerson(
                                          _nameController.text.toString(),
                                          _emailController.text.toString(),
                                          _passwordController.text.toString(),
                                        );

                                        addUser(
                                            _nameController.text.toString(),
                                            _emailController.text.toString(),
                                            uniqueId.toString());

                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    LoginPage()));
                                      } else {
                                        var alert = AlertDialog(
                                          actions: [
                                            FlatButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Text("Tamam"))
                                          ],
                                          title: Text("HATA!"),
                                          content: Text(
                                              "Şifre en az 6 karakter olmalI"),
                                        );
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return alert;
                                            });
                                      }
                                    } else {
                                      var alert2 = AlertDialog(
                                        actions: [
                                          FlatButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text("Tamam"))
                                        ],
                                        title: Text("HATA!"),
                                        content: Text("Şifreler aynı değil"),
                                      );

                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return alert2;
                                          });
                                    }
                                  } else {
                                    var alert3 = AlertDialog(
                                      actions: [
                                        FlatButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text("Tamam"))
                                      ],
                                      title: Text("HATA!"),
                                      content: Text("Boş bırakılan yerler var"),
                                    );

                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return alert3;
                                        });
                                  }
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 5),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black, width: 2),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Center(
                                      child: Text(
                                    "KAYDET",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24,
                                    ),
                                  )),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: size.height * .05, left: size.width * .02),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(
                          Icons.arrow_back_ios_outlined,
                          color: Colors.black.withOpacity(.75),
                          size: 26,
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.3,
                      ),
                      Text(
                        "Kayıt ol",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black.withOpacity(.75),
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    ));
  }
}
