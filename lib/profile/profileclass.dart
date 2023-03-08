import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
class Auth{
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  Future<String> getuserId()async{
    return (await firebaseAuth.currentUser!).uid;
  }
  Future getcurrentuser()async{
    return await firebaseAuth.currentUser;
  }
}