import 'package:flutter/material.dart';
import 'package:foldable_sidebar/foldable_sidebar.dart';
import 'package:swipedetector/swipedetector.dart';

class FoldedSideBar extends StatefulWidget {
  @override
  _FoldedSideBarState createState() => _FoldedSideBarState();
}

class _FoldedSideBarState extends State<FoldedSideBar> {
  FSBStatus drawerStatus;
  @override
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
        // appBar: AppBar(
        //   title: Text('Foldable SideBar'),
          
        // ),
        appBar: AppBar(),
        body: SwipeDetector(
            onSwipeLeft: (){
              setState(() {
                drawerStatus=FSBStatus.FSB_CLOSE;
              });
            },
            onSwipeRight: (){
              setState(() {
                drawerStatus=FSBStatus.FSB_OPEN;
              });
            },
            child: FoldableSidebarBuilder(
            drawerBackgroundColor: Colors.deepOrange,
            status: drawerStatus, 
            drawer: CustomeDrawer(
              closeDrawer: (){
                setState(() {
                  drawerStatus=FSBStatus.FSB_CLOSE;
                });
              },
            ), 
            screenContents: SideBarContent(),
            
          ),
        ),
        floatingActionButton: FloatingActionButton(
                               child: Icon(Icons.menu),
                              onPressed: (){
                                setState(() {
                                  drawerStatus=drawerStatus==FSBStatus.FSB_OPEN?FSBStatus.FSB_CLOSE:FSBStatus.FSB_OPEN;
                                });
                              }),
        
      ),
    );
  }
}

class SideBarContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Content will appear here'),
    );
  }
}
class CustomeDrawer extends StatelessWidget {
  final Function closeDrawer;
  CustomeDrawer({this.closeDrawer});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width*0.6,
      height: MediaQuery.of(context).size.height,
      child: ListView(
        children: <Widget>[
          // Container(
          //   height: MediaQuery.of(context).size.height*0.2,
          // ),
          GestureDetector(
                      child: ListTile(
              title: Text('Page1'),
            ),
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>Page1Content()));
              closeDrawer();
            },
          ),
          ListTile(
            title: Text('Page2'),
          ),
          ListTile(
            title: Text('Page3'),
          )
        ],
        
      ),
    );
  }
}
class Page1Content extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('This is Page1'),),
    );
  }
}