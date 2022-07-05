import 'package:flutter/material.dart';


class CreatePatientNoteFieldWidget extends StatelessWidget {
  const CreatePatientNoteFieldWidget({
    Key? key,
    required this.title,
    required this.isUrgent,
    required this.highlight,
    required this.valueChoose,
    required this.description,
    required this.onChangedTitle,
    required this.onChangedisUrgent,
    required this.onChangedValueChoose,
    required this.onChangedDescription,
    required this.onSavedNote, required this.onChangedHighlight}) : super(key: key);

  final String title;
  final bool isUrgent;
  final bool highlight;
  final String valueChoose;
  final String description;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedHighlight;
  final ValueChanged<String> onChangedisUrgent;
  final ValueChanged<String> onChangedValueChoose;
  final ValueChanged<String> onChangedDescription;
  final VoidCallback onSavedNote;



  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        buildName(),
        SizedBox(height: 8),
        buildNote(),
        SizedBox(height: 32),
        buildButton(),
      ],
    ),
  );
  Widget buildName() => TextFormField(
    maxLines: 1,
    initialValue: title,
    onChanged: onChangedTitle,
    validator: (title) {
      if (title!.isEmpty) {
        return 'Enter a name';
      }
      return null;
    },
    decoration: InputDecoration(
      border: UnderlineInputBorder(),
      labelText: 'Patient Name',
    ),
  );

  Widget buildNote() => TextFormField(
    maxLines: 3,
    initialValue: description,
    onChanged: onChangedDescription,
    decoration: InputDecoration(
      border: UnderlineInputBorder(),
      labelText: 'Notes',
    ),
  );

  Widget buildButton() => SizedBox(
    width: double.infinity,
    child: ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.green),
      ),
      onPressed: onSavedNote,
      child: Text('Add', style: TextStyle(color: Colors.white),),
    ),
  );
}