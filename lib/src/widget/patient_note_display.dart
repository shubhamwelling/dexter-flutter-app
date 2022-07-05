import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:dexterflutterapp/src/model/patient_note.dart';
import 'package:intl/date_time_patterns.dart';



class PatientNoteWidget extends StatelessWidget {



  final PatientNote patientnote;

  const PatientNoteWidget({
    required this.patientnote,


    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) => Container(



    color: Colors.white,
    padding: EdgeInsets.all(20),
    child: Row(
      children: [

        const SizedBox(width: 20),

        Expanded(
          child: Column(


            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text(

                patientnote.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                  fontSize: 22,

                ),
              ),

              if(patientnote.isUrgent!=null)
                if(patientnote.isUrgent==false)
                  Container(

                    child:Text(
                      'Not Urgent (Wait & Watch)',
                      style: TextStyle(fontWeight:FontWeight.w400,
                          color:Colors.green, fontSize:12),

                    ),
                  ),
              if(patientnote.isUrgent==true)
                Container(
                  child:Text(
                    'Immediate Medical Attention is NEEDED',
                    style: TextStyle(fontWeight:FontWeight.w400,
                        color:Colors.red,
                        fontSize:12),
                  ),
                ),

              if (patientnote.valueChoose!=null)
                Container(
                    child: Text(
                      'Classification: ${patientnote.valueChoose}',
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          color: Colors.blue,
                          fontSize:16
                      ),

                    )
                ),

              if (patientnote.description.isNotEmpty)
                Container(
                  margin: EdgeInsets.only(top: 4),
                  child: Text(
                    patientnote.description,
                    style: TextStyle(fontSize: 20, height: 1.5),
                  ),
                ),



                if(patientnote.highlight==false)
                  Container(

                    child:Text(
                      'FILLERFILLERFILLERFILLERFILLERFILLER',
                      style: TextStyle(fontWeight:FontWeight.w400,
                          color:Colors.white, backgroundColor: Colors.white, fontSize:12),

                    ),
                  ),
              if(patientnote.highlight==true)
                Container(
                  child:Text(
                    'FILLERFILLERFILLERFILLERFILLERFILLER',
                    style: TextStyle(fontWeight:FontWeight.w400,
                        color:Colors.yellow, backgroundColor: Colors.yellow,
                        fontSize:12),
                  ),
                ),



              Text('Date: ${DateFormat('dd MMM yyyy - hh:mm aaa').format(patientnote.createdTime)}'),


            ],
          ),
        ),
      ],
    ),

  );
}
