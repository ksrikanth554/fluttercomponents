import 'package:flutter/material.dart';
import 'package:flutter_inner_drawer/inner_drawer.dart';

class InnerDrawerExample extends StatelessWidget {
  var _scaffoldKey=GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Inner Drawer'),
        leading: Container(),
        actions: <Widget>[
          IconButton(icon:Icon(Icons.menu), onPressed: (){
            _scaffoldKey.currentState.openDrawer();
          })
        ],
      ),
      
      drawer: content(),
      body: DrawerContent(),
    );
  }
}

class DrawerContent extends StatelessWidget{
  

  

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InnerDrawer(
      scale: IDOffset.only(left: 0.9,right: 0.9,),
      borderRadius: 20.0,
      rightAnimationType: InnerDrawerAnimation.quadratic,
      backgroundDecoration: BoxDecoration(
        color: Colors.lightBlue,
        
        
      ),
      scaffold: Container(
        color: Colors.white,
        child: Center(
          child: Text('data'),
        ),
      ),
      leftChild: innerDrawerContent(),
      rightChild: innerDrawerContent(),
      onTapClose: true,
      );
  }
}
Widget innerDrawerContent(){
  return Container(
    
        child: Column(
          children: <Widget>[
            Container(
              height: 100,
            ),
            ExpansionTile(
              title: Text('Products'),
              trailing: Icon(Icons.arrow_drop_down),
              children: <Widget>[
                  Text('Item 1'),
                  Text('Item 2'),
                  Text('Item 3'),
                  Text('Item 4')
              ],
            ),
            ExpansionTile(
              title: Text('Category'),
              trailing: Icon(Icons.arrow_drop_down),
              children: <Widget>[
                  Text('Category 1'),
                  Text('Category 2'),
                  Text('Category 3'),
                  Text('Category 4')
              ],
            ),
          ],
        ),
      );
}
Drawer content(){
    return Drawer(
        child: Column(
          children: <Widget>[
            Container(
              child: ExpansionTile(
                title: Text('Products'),
                trailing: Icon(Icons.arrow_drop_down),
                children: <Widget>[
                  Text('Vijay sales'),
                  Text('Auto Popular'),
                  Text('Yamaha'),
                  Text('Muthoot Motors')
                ],

                ),
            ),
            Container(
              child: ExpansionTile(
                title: Text('Products'),
                trailing: Icon(Icons.arrow_drop_down),
                children: <Widget>[
                  Text('Vijay sales'),
                  Text('Auto Popular'),
                  Text('Yamaha'),
                  Text('Muthoot Motors')
                ],

                ),
            ),
          ],
        ),
      );
  }