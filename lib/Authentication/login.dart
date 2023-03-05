import 'package:flutter/material.dart';
import 'Signup.dart';
import 'auth.dart';
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: height*0.3,
                  width: width*0.8,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: const  DecorationImage(
                          image: AssetImage('Assets/images/boy.jpeg'),
                          fit: BoxFit.cover
                      )
                  ),
                ),
                const  SizedBox(height: 20,),
                const Text("Login"),
                const  SizedBox(height: 20,),
                TextFormField(
                  controller: emailcontroller,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 1,
                      ),
                    ),
                    label: Text("Email"),
                  ),
                ),
                const SizedBox(height: 20,),
                TextFormField(
                  controller: passwordcontroller,
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.lock_outline),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 1,
                      ),
                    ),
                    label: Text("password"),
                  ),
                ),
                const SizedBox(height: 30,),
                ElevatedButton(onPressed: ()async{
                  if(emailcontroller.text.isEmpty||passwordcontroller.text.isEmpty){
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text("please fill in fields",
                              style: TextStyle(color: Colors.red),
                            ),
                            duration: Duration(seconds: 2)));
                  }
                  else{
                    await Authentication().LoginUser(
                        email: emailcontroller.text,
                        password: passwordcontroller.text,
                        context: context);
                  }
                },
                    child: const Text("Login")),
                const  SizedBox(height: 20,),
                TextButton(onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const Signup()));
                },
                    child: const Text("Don't have an account Register"))
              ],
            ),
          ),
        ),
      ) ,
    );
  }
}
