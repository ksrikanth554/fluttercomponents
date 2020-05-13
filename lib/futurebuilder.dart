import 'package:flutter/material.dart';
import 'package:fluttercomponents/data/mapData.dart';

class FutureBuilderExample extends StatefulWidget {
  @override
  _FutureBuilderExampleState createState() => _FutureBuilderExampleState();
}

class _FutureBuilderExampleState extends State<FutureBuilderExample> {
  Future _getList()async{
   return multorowMap['Tables'];
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future:_getList(),
      builder: (context,snapshot){
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (ctx,index){
                return Text(snapshot.data[index]['TableName']);

            });
       },
      );
    
  }
}

