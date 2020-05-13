import 'package:flutter/material.dart';
import 'package:fluttercomponents/multorow/textformfield.dart';

class FirstTab extends StatefulWidget {
 static final formKey=GlobalKey<FormState>();
  @override
  _FirstTabState createState() => _FirstTabState();
}

class _FirstTabState extends State<FirstTab> {
  

  Map<String,TextEditingController> txtControllers={};

  List<TextFormField> txtfield=[];

  List<String> cnames=['firstName','LastName','Email','Password'];

  @override
  Widget build(BuildContext context) {
    if (txtfield.isEmpty) {
      cnames.forEach((str){
        var controller=TextEditingController();
        txtControllers.putIfAbsent(str, ()=>controller);
        txtfield.add(getTextForm(controller, str)
        );
      });
    }
    return Form(
      key: FirstTab.formKey,
      autovalidate: true,
          child: Scaffold(
        body: Column(
          children: <Widget>[
            Container(
              height: 300,
              child: ListView.builder(
                itemCount:txtfield.length ,
                itemBuilder: (ctx,index){
                  return txtfield[index];
                }
              ),
            ),
            // FlatButton(onPressed:(){
            //   _formKey.currentState.validate();
            // }, child: Text('Submit')),
            // Text(txtControllers[cnames[0]].text),
            // Text(txtControllers[cnames[1]].text),
            // Text(txtControllers[cnames[2]].text),
            // Text(txtControllers[cnames[3]].text),

          ],
        ),
        
      ),
    );
  }
}