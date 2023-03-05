import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class Fetchcar extends StatefulWidget {
  const Fetchcar({Key? key}) : super(key: key);

  @override
  State<Fetchcar> createState() => _FetchcarState();
}

class _FetchcarState extends State<Fetchcar> {
  CollectionReference cars = FirebaseFirestore.instance.collection('cars');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registered cars",
          style: GoogleFonts.roboto(color: Colors.white,
              fontWeight: FontWeight.bold,fontSize: 30),
        ),
        centerTitle: true,
      ),
      body:  StreamBuilder<QuerySnapshot>(
        stream: cars.snapshots(),
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
                            const  Text("Numberplate:",
                              style: TextStyle(color: Colors.black,fontSize: 20,),
                            ),
                            const SizedBox(width: 15,),
                            Text(document['Numberplate']),
                          ],
                        ),
                        Row(
                          children:  [
                            const  Text("FleetNo:",
                              style: TextStyle(color: Colors.black,fontSize: 20,),
                            ),
                            const SizedBox(width: 15,),
                            Text(document['FleetNumber']),
                          ],
                        ),

                        Row(
                          children:  [
                            const  Text("Drivername:",
                              style: TextStyle(color: Colors.black,fontSize: 20,),
                            ),
                            const SizedBox(width: 15,),
                            Text(document['Drivername']),
                          ],
                        ),
                        Row(
                          children:  [
                            const  Text("Driverid:",
                              style: TextStyle(color: Colors.black,fontSize: 20,),
                            ),
                            const SizedBox(width: 15,),
                            Text(document['Driverid']),
                          ],
                        ),
                        Row(
                          children:  [
                            const  Text("Route:",
                              style: TextStyle(color: Colors.black,fontSize: 20,),
                            ),
                            const SizedBox(width: 15,),
                            Text(document['Route']),
                          ],
                        ),
                        Row(
                          children:  [
                            const  Text("Seats:",
                              style: TextStyle(color: Colors.black,fontSize: 20,),
                            ),
                            const SizedBox(width: 15,),
                            Text(document['Seats']),
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
