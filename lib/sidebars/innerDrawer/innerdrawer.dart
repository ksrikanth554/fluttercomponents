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
enum ViewType{
  Noraml,
  ListType
}
class DrawerContent extends StatefulWidget{
  
  @override
  _DrawerContentState createState() => _DrawerContentState();
}

class _DrawerContentState extends State<DrawerContent> {
var textData='hello';
  var view=ViewType.Noraml;
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
      scaffold: conditioanlView(view),
      // scaffold: Container(
      //   color: Colors.white,
      //   child: Center(
      //     child: Text(textData),
      //   ),
      // ),
      leftChild: innerDrawerContent(context),
      rightChild: innerDrawerContent(context),
      onTapClose: true,
      );
  }
        Widget conditioanlView(var view){
          Widget widget;
            if (view==ViewType.Noraml) {
                widget= Container(
                color: Colors.white,
                child: Center(
                  child: Text(textData),
                ),
              );
            }
            else if (view==ViewType.ListType) {
              widget=Container(
                color: Colors.white,
                child: ListView(
                  children: <Widget>[
                    Text('data1'),
                    Text('data1'),
                    Text('data1'),
                    Text('data1'),
                  ],
                ),
              );
            }

          return widget;
          
          }

  

              Widget innerDrawerContent(BuildContext context){
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
                              InkWell(child: Text('Item 1'),onTap: (){
                                Navigator.pop(context);
                                setState(() {
                                  view=ViewType.ListType;
                                });
                              },),
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