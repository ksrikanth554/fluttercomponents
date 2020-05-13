import 'package:flutter/material.dart';
import 'package:fluttercomponents/data/mapData.dart';
import 'package:fluttercomponents/main.dart';
import 'package:fluttercomponents/multorow/firstpage.dart';
import 'package:fluttercomponents/multorow/page.dart';

class MultiRowTab extends StatefulWidget {
  @override
  _MultiRowTabState createState() => _MultiRowTabState();
}

class _MultiRowTabState extends State<MultiRowTab> {
  List<Tab> _tabs(){
      List<Tab> lTabs=[];
      var list=multorowMap['Tables'];
      for (var item in list) {
        lTabs.add(Tab(text:item['TableName'],));
      }
      return lTabs;
    }

  @override
  Widget build(BuildContext context) {
    
    return DefaultTabController(
          length: _tabs().length,
          child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: _tabs()
          ),
        ),
        body:  TabBarView(
          children:_getBody(),
          
        )
        
      ),
    );
  }
  List<Widget> _getBody(){
    List<Widget> _tabBody=[];

      for (int i=0;i<_tabs().length;i++) {
        if(i==0){

          _tabBody.add(FirstTab());
        }
        else{

         _tabBody.add(PageBody(multorowMap['Tables'][i])) ;           
        }
        
      }
      return _tabBody;

  }
}