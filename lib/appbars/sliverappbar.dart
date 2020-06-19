import 'package:flutter/material.dart';

class SliverAppBarExample extends StatefulWidget {
  @override
  _SliverAppBarExampleState createState() => _SliverAppBarExampleState();
}

class _SliverAppBarExampleState extends State<SliverAppBarExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(

          slivers: <Widget>[
              SliverAppBar(
                //expandedHeight: 150,
                  floating: false,
                  pinned: false,
                  title: Text('Sliver app'),
              ),
              SliverList(
              
               delegate: SliverChildBuilderDelegate(
                 
                 (ctx,index){
                 
                return ListTile(
                    title: Text('Listtile $index'),
                 );
               },
               childCount: 20
              ),
              )
          ],
      ),
    
      
    );
  }
}