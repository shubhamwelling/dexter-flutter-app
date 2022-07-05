import 'package:dexterflutterapp/src/provider/patientnotes.dart';
import 'package:flutter/material.dart';
import 'package:dexterflutterapp/src/screens/login.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
    create: (context) => PatientNoteProvider(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Patient Notes',
      theme: ThemeData(
        primarySwatch: Colors.blue,

      ),
      home: LoginScreen(),
    ),
  );
}

