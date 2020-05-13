import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttercomponents/sqlite_example/notes_details.dart';
import '../sqlite_example/utils/database_helper.dart';
import '../sqlite_example/models/note.dart';

class NoteList extends StatefulWidget {
  @override
  _NoteListState createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  DataBaseHelper dataBaseHelper=DataBaseHelper();
  List<Note> noteList=[];
  int count=0;
  @override
  Widget build(BuildContext context) {
    if (noteList.isEmpty) {
      updateListView();
    }
    TextStyle textStyle=Theme.of(context).textTheme.subhead;
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
      
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount:count,
          itemBuilder: (ctx,index){
            return Card(
              child: ListTile(
                leading: CircleAvatar(backgroundColor:getProrityColor(noteList[index].priority),child:getPriorityIcon(noteList[index].priority) ),
                title: Text(noteList[index].title),
                subtitle: Text(noteList[index].description,style: textStyle,),
                trailing: IconButton(
                  icon: Icon(Icons.delete), 
                  onPressed: ()async{
                   await dataBaseHelper.deleteNote(noteList[index].id).then((res){
                     updateListView();
                    //  setState(() {
                    //    final snackBar=SnackBar(content: Text('data'));
                    //  Scaffold.of(context).showSnackBar(snackBar);
                    //  });
                   });
                  }
                ),
                onTap: ()async{
               bool res=await Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>NoteDetails(noteList[index],'Edit Notes')));
               if (res) {
                 updateListView();
               }
                },
              ),
              
            );
          }
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: ()async {
          bool res=await Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>NoteDetails(Note('','',null),'Add Notes')));
          if (res) {
            updateListView();
          }
      }),
    );
  }
  Color getProrityColor(int priority){
    switch(priority){
      case 1:return Colors.yellow;
      break;
      case 2:return Colors.red;
      break;
      default:
      return null;
    }
  }
  Icon getPriorityIcon(int priority){
    switch (priority) {
      case 1:return Icon(Icons.keyboard_arrow_right);
      break;
      case 2:return Icon(Icons.play_arrow);
      break;
      default:
      return null;
    }
  }
  void updateListView(){
    dataBaseHelper.initializeDataBase().then((dataBase){
     dataBaseHelper.getNoteList().then((noteList){
        setState(() {
          this.noteList=noteList;
          this.count=noteList.length;
        });
      });
   });
  }
}