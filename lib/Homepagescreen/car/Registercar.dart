import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'fetchcar.dart';
class RegisterN extends StatefulWidget {
  const RegisterN({Key? key}) : super(key: key);

  @override
  State<RegisterN> createState() => _RegisterNState();
}

class _RegisterNState extends State<RegisterN> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final Numplate = TextEditingController();
  final fleetno = TextEditingController();
  final Drivername = TextEditingController();
  final driverid = TextEditingController();
  final route = TextEditingController();
  final seats = TextEditingController();
  final CollectionReference  cars = FirebaseFirestore.instance.collection('cars');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title:  Text("Register member",
      //   style: GoogleFonts.roboto(color: Colors.green,
      //       fontWeight: FontWeight.bold,fontSize: 25),
      //   ),
      //   centerTitle: true,
      // ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Register Car Details",
                  style: GoogleFonts.aBeeZee(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20,),
                TextFormField(
                  keyboardType: TextInputType.text,
                  controller: Numplate,
                  decoration:  InputDecoration(
                      hoverColor: Colors.green,
                      label: const Text("Plate No"),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            color: Colors.green,
                            width: 2,
                          )
                      )
                  ),
                ),
                const SizedBox(height: 20,),
                TextFormField(
                  keyboardType: TextInputType.text,
                  controller: fleetno,
                  decoration:  InputDecoration(
                      labelText: "CarNo",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            color: Colors.green,
                            width: 2,
                          )
                      )
                  ),
                ),
                const SizedBox(height: 20,),
                TextFormField(
                  keyboardType: TextInputType.text,
                  controller: Drivername,
                  decoration:  InputDecoration(
                      labelText: "Drivername",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            color: Colors.green,
                            width: 2,
                          )
                      )
                  ),
                ),
                const SizedBox(height: 20,),
                TextFormField(
                  keyboardType: TextInputType.text,
                  controller: driverid,
                  decoration:  InputDecoration(
                      labelText: "Driverid",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            color: Colors.green,
                            width: 2,
                          )
                      )
                  ),
                ),
                const SizedBox(height: 20,),
                TextFormField(
                  keyboardType: TextInputType.text,
                  controller: route,
                  decoration:  InputDecoration(
                      labelText: "Route",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            color: Colors.green,
                            width: 2,
                          )
                      )
                  ),
                ),
                const SizedBox(height: 20,),
                TextFormField(
                  keyboardType: TextInputType.text,
                  controller: seats,
                  obscureText: true,
                  decoration:  InputDecoration(
                      labelText: " No seats",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            color: Colors.green,
                            width: 2,
                          )
                      )
                  ),
                ),
                const SizedBox(height: 30,),
                ElevatedButton(
                    onPressed: ()async{
                      String numplate = Numplate.text;
                      String FleetNo = fleetno.text.toString();
                      String drivername =Drivername.text;
                      String Driverid = driverid.text.toString();
                      String Route = route.text;
                      String seat = seats.text;
                      await firestore.collection('cars').doc().set({
                        "Numberplate": numplate,
                        "FleetNumber": FleetNo,
                        "Drivername": drivername,
                        "Driverid": Driverid,
                        "Route": Route,
                        'Seats': seat,
                      });
                    },
                    child:const  Text("Submit")),
                const  SizedBox(height: 30,),
                ElevatedButton(
                    onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const Fetchcar()));
                    },
                    child: const Text("Registered members")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}