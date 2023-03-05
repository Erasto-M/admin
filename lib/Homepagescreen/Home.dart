import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children:  [
              Text(' Welcome erastus',
                style: GoogleFonts.abel(color: Colors.green,
                    fontSize: 30,fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
