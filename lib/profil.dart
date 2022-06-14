import 'package:e_ticaret/cikis/item.dart';
import 'package:e_ticaret/cikis/menuitem.dart';
import 'package:e_ticaret/data/database.dart';
import 'package:e_ticaret/giris.dart';
import 'package:e_ticaret/models/kullanici.dart';
import 'package:e_ticaret/servis/auth.dart';
import 'package:flutter/material.dart';

class ProfilPage extends StatefulWidget {
  @override
  final String email;
  ProfilPage(this.email);
  _ProfilPage createState() => _ProfilPage();
}

class _ProfilPage extends State<ProfilPage> {
  late User user;
  bool isLoading = false;

  var auth = AuthService();
  var currentUser = AuthService().auth.currentUser;
  var listOfUser = [];
  late KulBilgiDatabase db;

  @override
  void initState() {
    user = User(userName: "userName", email: "email", uniqueId: "uniqueId");
    db = KulBilgiDatabase.instance;
    refreshUsers();
    super.initState();
  }

  Future refreshUsers() async {
    setState(() => isLoading = true);
    this.user = (await KulBilgiDatabase.instance
        .readUser(currentUser!.email.toString()));
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle headline = Theme.of(context).textTheme.headline6!;
    var size = MediaQuery.of(context).size;
    print("mail " + widget.email.toString());

    return Scaffold(
      appBar: AppBar(
        title: Text("Kullanıcı Bilgileri"),
        actions: [
          PopupMenuButton<MenuItem>(
            onSelected: (item) => onSelected(context, item),
            itemBuilder: (context) => [
              ...MenuItems.itemSecond.map(buildItem).toList(),
            ],
          )
        ],
      ),
      body: ListView(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Container(
                  height: size.height,
                  width: size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "E-TİCARET",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                        Bilgi("Kullanıcının adı :", user.userName, headline),
                        Bilgi("Kullanıcının emaili :", user.email, headline),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                        ),
                        Image.asset("assets/images/e-ticaret.gif"),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  PopupMenuItem<MenuItem> buildItem(MenuItem item) => PopupMenuItem(
        value: item,
        child: Row(
          children: [
            Icon(item.icon, color: Colors.black, size: 20),
            const SizedBox(width: 12),
            Text(item.text),
          ],
        ),
      );
  void onSelected(BuildContext context, MenuItem item) {
    if (item.text == MenuItems.itemSignOut.text) {
      auth.signOut();
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) => LoginPage()), (e) => false);
    }
  }

  Widget Bilgi(var userTitle, var kulbilgi, var headline) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Text("${userTitle.toString()} ",
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                Text(kulbilgi,
                    style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
