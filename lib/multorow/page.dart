import 'package:flutter/material.dart';


class PageBody extends StatefulWidget {
  final Map mapData;
  PageBody(this.mapData);
  @override
  _PageBodyState createState() => _PageBodyState();
}

class _PageBodyState extends State<PageBody> {
   Map<String,TextEditingController> txtControllers={};
   List txtfield=[];
 List<String> itemListData=[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.pink,
              child: GridView.builder(
                itemCount: widget.mapData['Columns'].length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,childAspectRatio: 2), 
              itemBuilder: (ctx,index){
                return Container(
                  child: Text(widget.mapData['Columns'][index]['caption']),
                );
              }
              ),
          )
          ),
           Expanded(
            flex: 5,
              child: ListView.builder(
                itemCount: itemListData.length,
                itemBuilder:(ctx,index){
               return Column(
                 children: <Widget>[
                   Container(
                     color: Colors.blue,
                     height: 100,
                     child: GridView.builder(
                      itemCount: 6,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,childAspectRatio: 2), 
                      itemBuilder: (ctx,index){
                      return Container(
                        child: Text(itemListData[index]));
                      }
                     ),
                   ),
                   SizedBox(height: 4,)
                 ],
               );
            }
           ),
          
          )
        ],
      ),
    floatingActionButton: FloatingActionButton(
      child: Icon(Icons.add),
      onPressed:(){
       
        for (var item in widget.mapData['Columns']) {
          var txtController=TextEditingController();
          txtControllers.putIfAbsent(item['caption'],()=>txtController);
          txtfield.add(TextFormField(controller: txtController,
          decoration:InputDecoration(
            labelText: item['caption']
          ) ,));
        }
        showDialog(context: context,
        builder:(ctx){
          return AlertDialog(
            content: Container(
              height: 500,
              width: 200,
              child: Column(
                children: <Widget>[
                  Expanded(child: Container(

                    child: ListView.builder(
                      itemCount: txtfield.length,
                      itemBuilder: (ctx,index){
                      return txtfield[index];
                    }),
                  )
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      FlatButton(
                         child: Text('Cancel'),
                         onPressed: (){
                           Navigator.of(context).pop();
                         },),
                      FlatButton(
                         child: Text('Ok'),
                         onPressed: (){
                           for (var item in widget.mapData['Columns']) {
                             
                            var txtData=txtControllers[item['caption']].text;
                            itemListData.add(txtData);
                           
                           }
                           Navigator.of(context).pop();
                           setState(() {
                             
                           });
                         },
                         
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        }
        ).then((r){
          setState(() {
            
          });
        });
      }),
    );
  }
}