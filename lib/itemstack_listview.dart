import 'package:flutter/material.dart';

class ItemStackListView extends StatefulWidget {
  @override
  _ItemStackListViewState createState() => _ItemStackListViewState();
}

class _ItemStackListViewState extends State<ItemStackListView> {
  ScrollController scrollController=ScrollController();
  bool topLevelScrollController=false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController.addListener(
      (){
        setState(() {
          topLevelScrollController=scrollController.offset>20;
          
        });
      }
    );
  }
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Item Stack Listview'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            AnimatedContainer(
              
              duration: Duration(milliseconds: 200),
              width: size.width,
              height:topLevelScrollController?0: size.height*0.2,
              
              child: Card(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                     child: Row(
                    children: <Widget>[
                      Container(
                        height: size.height*0.2,
                        child: Card(
                          elevation: 4,
                          child: Center(child: Text('items appear here'))
                        ),
                      ),
                      Container(
                        height: size.height*0.2,
                        child: Card(
                          elevation: 4,
                          child: Center(child: Text('items appear here'))
                        ),
                      ),
                      Container(
                        height: size.height*0.2,
                        child: Card(
                          elevation: 4,
                          child: Center(child: Text('items appear here'))
                        ),
                      ),
                      Container(
                        height: size.height*0.2,
                        child: Card(
                          elevation: 4,
                          child: Center(child: Text('items appear here'))
                        ),
                      ),
                    ],
                ),
                  ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                controller: scrollController,
                itemCount: 20,
                itemBuilder: (ctx,index){
                  return ListTile(
                    leading: Icon(Icons.textsms),
                    title: Text('Item $index'),
                  );
                }
              )
            )
          ],
        ),
      ),
    );
  }
}