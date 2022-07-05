import 'package:flutter/cupertino.dart';
import 'package:dexterflutterapp/src/model/patient_note.dart';


class PatientNoteProvider extends ChangeNotifier {
  List<PatientNote> _patientnotes = [

  ];

  List<PatientNote> get patientnotes => _patientnotes.where((patientnote) => patientnote.check == false).toList();

  void addPatientNote (PatientNote patientnote){
    _patientnotes.add(patientnote);

    notifyListeners();
  }
}