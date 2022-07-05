import 'package:flutter/material.dart';
import 'package:dexterflutterapp/src/widget/patient_note_display.dart';
import 'package:dexterflutterapp/src/model/patient_note.dart';
import 'package:dexterflutterapp/src/provider/patientnotes.dart';
import 'package:provider/provider.dart';

class PatientNoteListWidget extends StatelessWidget {
  const PatientNoteListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider=Provider.of<PatientNoteProvider>(context);
    final patientnotes=provider.patientnotes;

    return patientnotes.isEmpty
        ? Center(
      child: Text(
        'No Patient Notes available.',
        style: TextStyle(fontSize: 20),
      ),
    )
        : ListView.separated(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.all(16),
      separatorBuilder: (context, index)=>Container(height:8),
      itemCount: patientnotes.length,
      itemBuilder: (context, index){
        final patientnote=patientnotes[index];

        return PatientNoteWidget (patientnote:patientnote);
      },
    );
  }
}
