import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:dexterflutterapp/src/widget/patient_note_field_widget.dart';
import 'package:provider/provider.dart';
import 'package:dexterflutterapp/src/provider/patientnotes.dart';
import 'package:dexterflutterapp/src/model/patient_note.dart';
import 'package:dexterflutterapp/src/provider/patientnotes.dart';
import 'package:flutter_switch/flutter_switch.dart';



class AddPatientNoteWidget extends StatefulWidget {
  const AddPatientNoteWidget({Key? key}) : super(key: key);

  @override
  State<AddPatientNoteWidget> createState() => _AddPatientNoteWidgetState();
}

class _AddPatientNoteWidgetState extends State<AddPatientNoteWidget> {
  final _formKey = GlobalKey<FormState>();
  String valueChoose = 'Prescriptions' ;
  List listItem=[
    'Prescriptions' ,'Symptoms', 'Progress Notes', 'Medical History','Vaccinations', 'Other'];

  String title = '';
  String description = '';
  bool isUrgent = false;
  bool highlight = false;

 
  @override
  Widget build(BuildContext context) => AlertDialog(
    backgroundColor: Colors.white,

    content: Form(

      key:_formKey,

      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Add Patient Note',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              fontSize: 20,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(3.0),
            child: Row(
                children: <Widget> [
                  FlutterSwitch(
                width: 40,
                height:25,
                toggleSize:15,

                  value: highlight,


                  onToggle: (bool value){
                    setState((){
                     if(value!=null)
                      highlight=value;
                      print(highlight);
                    });
                  }),
            Text('Highlight this note?'),
                ]),
    ),


          Padding(
            padding: const EdgeInsets.all(2.0),

            child: DropdownButton(
              hint: Text('Select Patient Note Type: '),
              dropdownColor: Colors.grey,
              icon: Icon(Icons.arrow_drop_down),
              iconSize: 25,
              isExpanded: true,
              style:TextStyle(
                color: Colors.black,
                fontSize:16,

              ),
              value: valueChoose,
              onChanged: (newValue){
                setState(() {
                  if (newValue!=null){
                    valueChoose = newValue.toString();
                  }});

              },

              items: listItem.map((valueItem){
                return DropdownMenuItem(
                  value: valueItem,
                  child:Text(valueItem),
                );
              }).toList(),
            ),
          ),

          Row(
            children: <Widget> [
              Checkbox(
                  value: isUrgent,
                  onChanged: (bool? value) {
                    print(value);
                    setState((){

                      isUrgent = value!;
                    });

                  }),
              Text('Immediate Care Required?'),
            ],
          ),
          const SizedBox(height: 4),
          CreatePatientNoteFieldWidget(
            onChangedTitle: (title) => setState(() => this.title = title),
            onChangedValueChoose: (valueChoose)=>setState(()=>this.valueChoose=valueChoose),
            onChangedisUrgent: (isUrgent)=>setState(()=>this.isUrgent=isUrgent as bool),
            onChangedHighlight: (highlight)=>setState(()=>this.highlight=highlight as bool),
            onChangedDescription: (description) =>
                setState(() => this.description = description),
            onSavedNote: addPatientNote, description: '', title: '', valueChoose: '', isUrgent: false, highlight: false,
          ),
        ],
      ),
    ),

  );

  void addPatientNote() {
    final isValid = _formKey.currentState?.validate();

    if(!isValid!){
      return;
    }
    else{
      final patientnote=PatientNote(
        id: DateTime.now().toString(),
        title: title,
        isUrgent: isUrgent,
        valueChoose: valueChoose,
        highlight: highlight,
        description:description,
        createdTime: DateTime.now(),

      );

      final provider=Provider.of<PatientNoteProvider>(context,listen:false);
      provider.addPatientNote(patientnote);

      Navigator.of(context).pop();
    }
  }
}


