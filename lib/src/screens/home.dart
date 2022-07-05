import 'dart:math';

import 'package:flutter/material.dart';
import 'package:dexterflutterapp/src/widget/add_patient_note_widget.dart';
import 'package:dexterflutterapp/src/widget/patient_note_list_widget.dart';
import 'package:dexterflutterapp/main.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);



  @override
  State<HomeScreen> createState() => _HomePageState();
}

class _HomePageState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {

      PatientNoteListWidget();



    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text('Patient Notes'),
        centerTitle: true,
        backgroundColor: Colors.purple,
        shadowColor: Colors.green,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5),),

      ),

      body: PatientNoteListWidget(),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        backgroundColor: Colors.black,
        foregroundColor: Colors.green,
        elevation: 114,
        autofocus: true,



        onPressed: () => showDialog(
          context: context,
          builder: (context) => AddPatientNoteWidget(),
          barrierDismissible: true,
        ),
        child: Icon(
            Icons.add_task,
          semanticLabel: "Add",
        ),
      ),
    );
  }
}
