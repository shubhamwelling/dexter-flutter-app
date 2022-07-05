import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dexterflutterapp/src/screens/home.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late String signinemail, signinpassword;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('DigiHealth'),
      centerTitle: true,
      shadowColor: Colors.yellow,
      backgroundColor: Colors.purple,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5),),),
      body: Column(
        children: <Widget>[
          Container(
            height: 210,
            alignment: Alignment.center,
            child: Image.asset("assets/images/secondstethoscope.jpg",
                fit: BoxFit.contain,
                width:210),

          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                RichText(
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.ltr,
                  textScaleFactor: 1.0,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "DigiHealth\n",
                        style:TextStyle(color:Colors.black, fontSize: 40, fontWeight: FontWeight.bold),


                      ),
                      TextSpan(
                          text: "          Convenient application to digitalize patient notes and updates to EMR in a convenient manner",
                          style: TextStyle (color: Colors.grey, fontSize: 15)

                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(2),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  hintText: 'Enter Email',
                  hintStyle: TextStyle(fontWeight: FontWeight.w200),
                  hintTextDirection: TextDirection.ltr,


              ),
              onChanged: (value) {
                setState(() {
                  signinemail = value.trim();
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(2),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(hintText: 'Enter Password',
                hintStyle: TextStyle(fontWeight: FontWeight.w200),
                hintTextDirection: TextDirection.ltr,),
              onChanged: (value) {
                setState(() {
                  signinpassword = value.trim();
                });
              },
            ),

          ),

          SizedBox(
            width:double.infinity,
            child:
            ElevatedButton(
                style:ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green)
                ),
                child: Text('Sign In'),
                onPressed: (){
                  auth.signInWithEmailAndPassword(email: signinemail, password: signinpassword).then((_){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen()));
                  });

                }),

          )
        ],),
    );
  }
}