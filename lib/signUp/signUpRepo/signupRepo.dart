import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpRepo {
  Future<bool> createUser(
      String email, String password, String username) async {
    final auth = FirebaseAuth.instance;
    final CollectionReference users =
        FirebaseFirestore.instance.collection('User_Details');
    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // await users.add({
      //   'user_id': 1,
      //   'user_name': 'anushka',
      //   'email': 'anu@gmail.com',
      //   'password': '1234tegfh',
      //   'profileImage': ''
      // });
      await users.doc(auth.currentUser!.uid).set({
        'userId': auth.currentUser!.uid,
        'userName': username,
        'email': email,
        'password': password,
        'profileImage': '',
      });
      return true;
    } on FirebaseAuthException catch (e) {
      print(e.code);
      return false;
    }
  }
}
