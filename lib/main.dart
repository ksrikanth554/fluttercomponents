import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttercomponents/animated_List.dart';
import 'package:fluttercomponents/animations/loginpage_animation.dart';
import 'package:fluttercomponents/appbars/sliverappbar.dart';
import 'package:fluttercomponents/dictionaryapp/dictionary.dart';
import 'package:fluttercomponents/itemstack_listview.dart';
import 'package:fluttercomponents/listviews/lazy_laoding_listview.dart';
import 'package:fluttercomponents/razor_pay.dart';
import 'package:fluttercomponents/sidebars/multilevel_sidebar.dart';
import 'package:http/http.dart';
import './sidebars/foldedsidebar.dart';
import 'package:fluttercomponents/providers/counterui.dart';
import 'package:fluttercomponents/providers/getcountproviders.dart';
import 'package:fluttercomponents/sfsimplechart.dart';
import 'package:fluttercomponents/whatsappclone.dart';
import 'package:provider/provider.dart';
//import 'package:syncfusion_flutter_core/core.dart';

import 'animations/delayed_animation.dart';
import 'animations/parenting_animation.dart';
import 'animations/transfroming_animation.dart';
import 'google_maps_example/googe_map_example.dart';
import 'multorow/tabpage.dart';
import 'sidebars/innerDrawer/innerdrawer.dart';
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
        home: SplashScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
class SplashScreen extends StatefulWidget {
  
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(milliseconds: 2000), ()=>Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(ctx)=>FirstPage())));
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.pink,
      child: Center(child: Icon(Icons.home)),
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
          RaisedButton(
            child: Text('Folded SideBar'),
            onPressed: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>FoldedSideBar()))),
          RaisedButton(
            child: Text('Multi Level SideBar'),
            onPressed: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>MultiLevelSideBar()))),
          RaisedButton(
            child: Text('Item Stack ListView'),
            onPressed: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>ItemStackListView()))),
          RaisedButton(
            child: Text('Google Map Example'),
            onPressed: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>GoogleMapExample()))),
          RaisedButton(
            child: Text('Dictionary App'),
            onPressed: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>DictionaryApp()))
            ),
          RaisedButton(
            child: Text('Inner Drawer'),
            onPressed: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>InnerDrawerExample()))
            ),
          RaisedButton(
            child: Text('Sliver App Bar With Custom Scrollview'),
            onPressed: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>SliverAppBarExample()))
            ),
          RaisedButton(
            child: Text('Lazy Loading Listview'),
            onPressed: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>LazyLoadingListView()))
            ),
          RaisedButton(
            child: Text('RazorPay example'),
            onPressed: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>RazorPayExample()))
            ),
          RaisedButton(
              child: Text('Printing example'),
              onPressed: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>RazorPayExample()))
          ),

        ],
      )
    );
  }
}