import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'fetchmember.dart';
class RegisterM extends StatefulWidget {
  const RegisterM({Key? key}) : super(key: key);

  @override
  State<RegisterM> createState() => _RegisterMState();
}

class _RegisterMState extends State<RegisterM> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final Fnamecontroller = TextEditingController();
  final Lnamecontroller = TextEditingController();
  final agecontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final idcontroller = TextEditingController();
  final CollectionReference  members = FirebaseFirestore.instance.collection('members');
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
                Text("Register A Member",
                  style: GoogleFonts.aBeeZee(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20,),
                TextFormField(
                  keyboardType: TextInputType.text,
                  controller: Fnamecontroller,
                  decoration:  InputDecoration(
                      hoverColor: Colors.green,
                      label: const Text("Firstname"),
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
                  controller: Lnamecontroller,
                  decoration:  InputDecoration(
                      labelText: "Lastname",
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
                  keyboardType: TextInputType.emailAddress,
                  controller: emailcontroller,
                  decoration:  InputDecoration(
                      labelText: "Email",
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
                  controller: agecontroller,
                  decoration:  InputDecoration(
                      labelText: "Age",
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
                  controller: passwordcontroller,
                  obscureText: true,
                  decoration:  InputDecoration(
                      labelText: "password",
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
                      String fname = Fnamecontroller.text;
                      String lname = Lnamecontroller.text;
                      String age = agecontroller.text;
                      String email = emailcontroller.text;
                      String passoword = passwordcontroller.text;
                      await firestore.collection('members').doc().set({
                        'Firstname': fname,
                        'Lastname': lname,
                        'Age': age,
                        'Email': email,
                        'Password': passoword,
                      });
                    },
                    child:const  Text("Submit")),
                const SizedBox(height: 30,),
                ElevatedButton(
                    onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Fetchmember()));
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
