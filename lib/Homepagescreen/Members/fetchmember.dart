import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class Fetchmember extends StatefulWidget {
  const Fetchmember({Key? key}) : super(key: key);

  @override
  State<Fetchmember> createState() => _FetchmemberState();
}

class _FetchmemberState extends State<Fetchmember> {
  CollectionReference members = FirebaseFirestore.instance.collection('members');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registered Members",
          style: GoogleFonts.roboto(color: Colors.white,
              fontWeight: FontWeight.bold,fontSize: 30),
        ),
        centerTitle: true,
      ),
      body:  StreamBuilder<QuerySnapshot>(
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
                            const  Text("FirstName:",
                              style: TextStyle(color: Colors.black,fontSize: 20,),
                            ),
                            const SizedBox(width: 15,),
                            Text(document['Firstname']),
                          ],
                        ),
                        Row(
                          children:  [
                            const  Text("LastName:",
                              style: TextStyle(color: Colors.black,fontSize: 20,),
                            ),
                            const SizedBox(width: 15,),
                            Text(document['Lastname']),
                          ],
                        ),

                        Row(
                          children:  [
                            const  Text("Age:",
                              style: TextStyle(color: Colors.black,fontSize: 20,),
                            ),
                            const SizedBox(width: 15,),
                            Text(document['Age']),
                          ],
                        ),
                        Row(
                          children:  [
                            const  Text("Email:",
                              style: TextStyle(color: Colors.black,fontSize: 20,),
                            ),
                            const SizedBox(width: 15,),
                            Text(document['Email']),
                          ],
                        ),
                        Row(
                          children:  [
                            const  Text("Password:",
                              style: TextStyle(color: Colors.black,fontSize: 20,),
                            ),
                            const SizedBox(width: 15,),
                            Text(document['Password']),
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
    );
  }
}
