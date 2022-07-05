import 'package:flutter/cupertino.dart';

class PatientNoteField {
  static const createdTime = 'createdTime';
}

class PatientNote {
  DateTime createdTime;
  String title;
  bool check;
  String id;
  String valueChoose;
  String description;
  bool isUrgent;
  bool highlight;

  PatientNote({
    this.check = false,
    required this.createdTime,
    required this.title,
    this.description = '',
    this.id='',
    this.isUrgent = false,
    this.highlight = false,
    required this.valueChoose,
  });
}