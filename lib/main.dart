import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttercomponents/animated_List.dart';
import 'package:fluttercomponents/animations/loginpage_animation.dart';
import 'package:fluttercomponents/providers/counterui.dart';
import 'package:fluttercomponents/providers/getcountproviders.dart';
import 'package:fluttercomponents/sfsimplechart.dart';
import 'package:fluttercomponents/whatsappclone.dart';
import 'package:provider/provider.dart';
//import 'package:syncfusion_flutter_core/core.dart';

import 'animations/delayed_animation.dart';
import 'animations/parenting_animation.dart';
import 'animations/transfroming_animation.dart';
import 'multorow/tabpage.dart';
import 'sqlite_example/note_list.dart';

void main(){
 // SyncfusionLicense.registerLicense('licenseKey');
  runApp(Home());
}
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
        value: NumberProvider(),
        ),
      ],
          child: MaterialApp(
            theme: ThemeData(
              primaryColor: Color(0xff075E54)
            ),
        home: FirstPage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          RaisedButton(
            child: Text('Animated List'),
            onPressed: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>AnimatedListExample()))
          ),
          RaisedButton(
            child: Text('MultirowTabUsing Future Builder'),
            onPressed: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>MultiRowTab()))
          ),
          RaisedButton(
            child: Text('Syncfusion simple chart'),
            onPressed: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>SyncfusionSimpleChart()))),
          RaisedButton(
            child: Text('Provider Example'),
            onPressed: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>CounterUI()))),
          RaisedButton(
            child: Text('Login Animation'),
            onPressed: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>LoginPageAnimation()))),
          RaisedButton(
            child: Text('Delayed Animation'),
            onPressed: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>DelayedAnimationExample()))),
          RaisedButton(
            child: Text('Parenting Animation'),
            onPressed: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>ParentingAnimationExample()))),
          RaisedButton(
            child: Text('Transforming Animation'),
            onPressed: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>TransaformingAnimation()))),
          RaisedButton(
            child: Text('Sq Lite Example'),
            onPressed: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>NoteList()))),
          RaisedButton(
            child: Text('Whats App Clone'),
            onPressed: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>WhatsAppHome()))),
        ],
      )
    );
  }
}