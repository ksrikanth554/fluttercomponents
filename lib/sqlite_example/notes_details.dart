import 'package:flutter/material.dart';
import 'package:fluttercomponents/sqlite_example/utils/database_helper.dart';
import 'package:intl/intl.dart';

import 'models/note.dart';


class NoteDetails extends StatefulWidget {
  final String title;
  final Note note;
  NoteDetails(this.note,this.title);
  @override
  _NoteDetailsState createState() => _NoteDetailsState(this.note,this.title);
}

class _NoteDetailsState extends State<NoteDetails> {
 final String title;
 final Note note;
 DataBaseHelper dataBaseHelper=DataBaseHelper();
 _NoteDetailsState(this.note,this.title);
  List<String> dropdown=['High','Low'];
  String dropDownVal;
  
  var titleContorller=TextEditingController();
  var descriptinController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle=Theme.of(context).textTheme.title;
    titleContorller.text=note.title;
    descriptinController.text=note.description;
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body:Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            ListTile(
              title: DropdownButton(
              items:dropdown.map((String str){
                return DropdownMenuItem<String>(
                value: str,
                child: Text(str),
                );
              }).toList() , 
              onChanged: (val){
                  setState(() {
                   // dropDownVal=val;
                    getPriorityAsInt(val);
                  });
              },
              hint: Text('Select'),
              value:getPriorityAsString(note.priority) ,
          ),
         ),
         Container(
           child: TextField(
             controller: titleContorller,
             decoration: InputDecoration(
               
               labelStyle: textStyle,
               labelText: 'Title',
               border: OutlineInputBorder(
                 borderRadius: BorderRadius.circular(10.0),
                 
               )
             ),
           )
         ),
         SizedBox(height: 20,),
         Container(
           child: TextField(
             maxLines: 2,
             controller: descriptinController,
             decoration: InputDecoration(
               labelStyle: textStyle,
               labelText: 'Description',
               border: OutlineInputBorder(
                 borderRadius: BorderRadius.circular(10.0)
               )
             ),
           )
         ),
         SizedBox(height: 20,),
         Row(
           children: <Widget>[
             Expanded(
                  child: RaisedButton(
                 child: Text('Save'),
                 onPressed:()async{
                   if (note.id!=null) {
                      note.date=DateFormat.yMMMd().format(DateTime.now());
                      note.title=titleContorller.text;
                      note.description=descriptinController.text;
                      var res =await dataBaseHelper.updateNote(note);
                      if (res!=0) {
                        
                        Navigator.pop(context,true);
                        Scaffold.of(context).showSnackBar(SnackBar(content: Text('Updated successfully')));
                      }
                      
                   }
                   else{
                      note.date=DateFormat.yMMMd().format(DateTime.now());
                      note.title=titleContorller.text;
                      note.description=descriptinController.text;
                      var res =await dataBaseHelper.insertNote(note);
                      if (res!=0) {
                        Navigator.pop(context,true);
                      }
                   }
                   
                   
                 }
               ),
             ),
             SizedBox(width: 5.0,),
             Expanded(
                  child: RaisedButton(
                 child: Text('Delete'),
                 onPressed:()async{
                   if (note.id!=null) {
                    await dataBaseHelper.deleteNote(note.id).then((res){
                      Navigator.pop(context,true);
                    });
                   }
                   
                 }
               ),
             ),
           ],
         )
        ],
      ),
    ),
      
    );
  }
 String getPriorityAsString(int priority){
   String priorityValue;
    switch (priority) {
      case 1:priorityValue='Low';
      break;
      case 2:priorityValue='High';
      break;
     
    }
    return priorityValue;
  }
  void getPriorityAsInt(String priority){
    
    switch (priority) {
      case 'Low':note.priority=1;
      break;
      case 'High':note.priority=2;
      break;
    
    }
    
  }
}