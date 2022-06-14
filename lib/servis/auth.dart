import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //giriş yap fonksiyon
  Future<User?> signIn(var email, var password) async {
    var user =
        await auth.signInWithEmailAndPassword(email: email, password: password);
    return user.user;
  }

  //çıkış yap fonksiyonu
  signOut() async {
    return await auth.signOut();
  }

  Future<User?> signUp(var email, var password) async {
    var user = await auth.createUserWithEmailAndPassword(
        email: email, password: password);
    return user.user;
  }

  //kayıt ol fonksiyonu
  Future<void> createPerson(String name, String email, String password) async {
    var users = _firestore.collection("users");
    return users
        .add({
          'name': name,
          'email': email,
          'password': password,
        })
        .then((value) => print("kullanıcı eklendi"))
        .catchError((error) => print("Kullanıcı eklenemedi: $error"));
  }
}
