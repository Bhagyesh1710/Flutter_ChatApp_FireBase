import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chatapp/Authenticat/login_screen.dart';

Future<User?> createAccount(String name, String email, String password) async {
  //Firbase Authentication
  FirebaseAuth _auth = FirebaseAuth.instance;
  //Firbase FireStore
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  try {
    UserCredential userCrendetial = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);

    print("Account created Succesfull");

    userCrendetial.user!.updateDisplayName(name);

    await _firestore.collection('users').doc(_auth.currentUser!.uid).set({
      "name": name,
      "email": email,
      "status": "Unavalible",
      "uid": _auth.currentUser!.uid,
    });

    return userCrendetial.user;
  }  catch (e) {
    print(e);
    return null;
  }
}

Future<User?> logIn(String email, String password) async{
  FirebaseAuth _auth = FirebaseAuth.instance;
  try{
    User? user = (await _auth.signInWithEmailAndPassword(
        email: email, password: password))
        .user;
    if (user != null) {
      print("Login Succesfull");
      return user;
    } else {
      print("Login Failed!");
      return user;
    }
  }catch (e){
    print(e);
    return null;
  }

}

Future logOut(BuildContext context) async{
  FirebaseAuth _auth = FirebaseAuth.instance;
  try{
    await _auth.signOut().then((value){
    Navigator.push(context, MaterialPageRoute(builder: (_) => LoginScreen()));
    });
  }catch(e){
    print("Error");
  }
}