import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:async';

class LazyLoadingListView extends StatefulWidget {
  @override
  _LazyLoadingListViewState createState() => _LazyLoadingListViewState();
}

class _LazyLoadingListViewState extends State<LazyLoadingListView> {
  List myList;
  ScrollController _scrollController;
  int currentIndex=10;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
    _scrollController=ScrollController();
    myList=List.generate(10, (i)=>'item:${i+1}');
    _scrollController.addListener((){
      if (_scrollController.position.pixels==_scrollController.position.maxScrollExtent) {
        for (var i = currentIndex; i < currentIndex+10; i++) {
          myList.add('item:${i+1}');
        }
         currentIndex=currentIndex+10;
        setState(() {
         
        });
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lazy Laoding Listview'),
      ),
      body: Container(
        
        child: ListView.builder(
          controller: _scrollController,
          itemExtent: 100,
          itemCount: myList.length+1,
          itemBuilder: (ctx,index){
            if (index==myList.length) {
              return Center(child: CircularProgressIndicator());
              
            }
            return ListTile(
              leading: CircleAvatar(backgroundColor: Colors.pink,
              child: Text('${index+1}'),),
              title: Text('${myList[index]}'),
            );
          }
        ),
      ),
      
    );
  }
}