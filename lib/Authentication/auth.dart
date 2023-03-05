import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import '../Homepagescreen/Homepage.dart';
class Authentication{
  Future<User?> registerUser({required email,required password,required BuildContext context})async{
    User? user;
    try{
      user = (await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password)).user;
      if(user!=null){
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>const Bottomnav()));
        return user;
      }
      else{
        print("User not created");
      }
    }
    catch(e){
      print("flutter error is $e");
    }
  }
  Future<User?> LoginUser({required email,required password,required BuildContext context})async{
    User? user;
    try{
      user = (await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password)).user;
      if(user!=null){
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>const Bottomnav()));
        return user;
      }
      else{
        print("User not created");
      }
    }
    catch(e){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Invalid credentials",
          style: TextStyle(color: Colors.red),),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }
  Future <User?> Logoutuser()async{
    User? user;
    try{
      await FirebaseAuth.instance.signOut();
    }
    catch(e){
      print('flutter error is $e');
    }
    return user;
  }
}