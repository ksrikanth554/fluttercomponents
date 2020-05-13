import 'package:flutter/material.dart';
import 'package:fluttercomponents/providers/getcountproviders.dart';
import 'package:provider/provider.dart';



class CounterUI extends StatelessWidget {
  
  
  @override
  Widget build(BuildContext context) {
    final NumberProvider _numberProvider=Provider.of<NumberProvider>(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(_numberProvider.counter.toString()),
              RaisedButton(onPressed: (){
                _numberProvider.counter+=1;
              },
              child: Text('increment'),
            )
          ],
        ),
      ),
    );
  }
}