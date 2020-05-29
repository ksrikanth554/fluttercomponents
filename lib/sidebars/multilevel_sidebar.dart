import 'package:flutter/material.dart';
import 'package:multilevel_drawer/multilevel_drawer.dart';

class MultiLevelSideBar extends StatefulWidget {
  @override
  _MultiLevelSideBarState createState() => _MultiLevelSideBarState();
}

class _MultiLevelSideBarState extends State<MultiLevelSideBar> {
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
       appBar: AppBar(
         title: Text('MultiLevel Side Bar'),
         
       ),   
       drawer:MultiLevelDrawer(
         rippleColor: Colors.pink,
         subMenuBackgroundColor: Colors.teal,
         divisionColor: Colors.orangeAccent,
         gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
           colors: [
           Colors.red,
           Colors.purple

         ]),
         header: Container(
           height: size.height*0.1,
           child: Icon(Icons.person,size: 50,),
         ), 
         children: [
          MLMenuItem(
            leading: Icon(Icons.home),
            trailing: Icon(Icons.arrow_right),
             content: Text('Home'), 
             onClick: (){},
             subMenuItems: [
               MLSubmenu(
                submenuContent:Text('Transactions'),
                onClick: (){
                  Navigator.pop(context);
                }
              ),
               MLSubmenu(

                submenuContent:Text('Reports'),
                onClick: (){
                  Navigator.pop(context);
                }
              )
             ]
          ),
          MLMenuItem(
            leading: Icon(Icons.settings),

             content: Text('Settings'), 
             onClick: (){}
          ),
          MLMenuItem(
            leading: Icon(Icons.exit_to_app),
             content: Text('Exir'), 
             onClick: (){}
          ),
         ]
        ) ,
      body: Center(
        child: Container(
          child: Text('Content will appear here'),
        ),
       ),
      ),
    );
  }
}