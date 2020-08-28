import 'package:flutter/material.dart';
import 'package:fluttercomponents/mysql_example/db_helper.dart';


class MySqlExample extends StatefulWidget {
  @override
  _MySqlExampleState createState() => _MySqlExampleState();
}

class _MySqlExampleState extends State<MySqlExample> {
  var db=MySql();
  String cityName='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mysql Exmaple'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RichText(text: TextSpan(
                children: [
                  TextSpan(text: 'City',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
                  TextSpan(text: cityName,style: TextStyle(color: Colors.black))
                ]
            )),
            RaisedButton(onPressed:_getData,
              child: Text('GetCityName'),
            )
          ],
        ),
      ),
    );
  }
  void _getData()async{
    await db.getConnection().then((conn)async{
      var sql='select * from city where id=1028';
     await conn.query(sql).then((reslut){
        print(reslut.toString());
      });
    });
  }
}