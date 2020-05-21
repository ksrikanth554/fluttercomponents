import 'package:flutter/material.dart';

class WhatsAppHome extends StatefulWidget {
  @override
  _WhatsAppHomeState createState() => _WhatsAppHomeState();
}

class _WhatsAppHomeState extends State<WhatsAppHome> with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController=TabController(length: 4, vsync: this,initialIndex: 1);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WhatsApp'),
        bottom:TabBar(
          controller: _tabController,
          tabs: [
            Tab(
              child: IconButton(icon: Icon(Icons.camera_alt), onPressed: (){}),
            ),
            Tab(
              child: Text('chats'),
            ),
            Tab(
              child: Text('status'),
            ),
            Tab(
              child: Text('calls'),
            ),
          ]
        ) ,
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Center(
           child: Text('chats')
          ),
          Center(
           child: Text('chats')
          ),
          Center(
           child: Text('status')
          ),
          Center(
           child: Text('calls')
          ),
        ],
      ),
      
    );
  }
}