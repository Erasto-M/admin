import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  CollectionReference members = FirebaseFirestore.instance.collection('members');
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  Future getcurrentuser()async{
    return  await  firebaseAuth.currentUser;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child:  StreamBuilder<QuerySnapshot>(
            stream: members.snapshots(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return const Text('Something went wrong');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              return ListView(
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  return Card(
                    child: Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          boxShadow: const  [
                            BoxShadow(
                              blurRadius: 15,
                              spreadRadius: 5,
                              color: Colors.white54,
                            ),
                          ]
                      ),
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children:  [
                                const  Text(" Welcome ",
                                  style: TextStyle(color: Colors.black,fontSize: 20,),
                                ),
                                const SizedBox(width: 15,),
                                Text(document['Firstname']),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              );
            },
          ),
        ),
      ),
    );
  }
}
