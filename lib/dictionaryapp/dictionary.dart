import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DictionaryApp extends StatefulWidget {
  @override
  _DictionaryAppState createState() => _DictionaryAppState();
}

class _DictionaryAppState extends State<DictionaryApp> {
  
  var url='https://owlbot.info/api/v4/dictionary/';
  var token='5f4f908b3653735c24fd9cb7bcf166bac6c63f25';
  TextEditingController _controller=TextEditingController();
  StreamController _streamController;
  Stream _stream;
  Timer _timer;
  
  @override
  void initState() {
    super.initState();
    _streamController=StreamController();
    _stream=_streamController.stream;
  }
  _search()async{
    if (_controller.text==null || _controller.text.length==0) {
      _streamController.add(null);
    }
    _streamController.add('waiting');
    http.Response response=await http.get('$url${_controller.text.trim()}',headers:{'Authorization':'Token $token'});
    if (response.statusCode==404) {
      _streamController.add('Data Not Found');
    }
    else{
    _streamController.add(json.decode(response.body));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Dictionary app',),
      ),
        body: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height*0.08,
              color: Color(0xff075E54),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                         child: Container(
                           
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: TextFormField(
                            controller: _controller,
                            decoration: InputDecoration(
                              hintText: 'Search Word Here',
                              border: InputBorder.none
                            ),
                            onChanged: (val){
                              if (val==null||val=='') {
                                 _streamController.add(null);
                                
                                _timer.cancel();
                                
                              }
                              else{
                                if (_timer?.isActive==true) {
                                _timer.cancel();
                                }
                                _timer=Timer(Duration(milliseconds: 1000), (){
                                  _search();
                                });
                                
                              }
                              
                            },
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.search,color: Colors.white,), 
                      onPressed: (){
                          _search();
                      }
                    )
                  ],
                ),
              ),
            ),
            Expanded(
                 child: Container(
                child: StreamBuilder(
                  stream: _stream,
                  builder: (BuildContext context,AsyncSnapshot snapshot){
                      if (snapshot.data==null) {
                        return Center(
                          child: Text('Enter the Word To Search'),
                        );
                      }
                      if (snapshot.data=='waiting') {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (snapshot.data=='Data Not Found') {
                        return Center(
                          child: Text('Data Not Found'),
                        );
                      }
                      return ListView.builder(
                        itemCount: snapshot.data['definitions'].length,
                        itemBuilder: (ctx,index){
                          Map mapData=snapshot.data['definitions'][index];
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListBody(
                              children: <Widget>[
                                Container(
                                  color: Colors.grey[400],
                                  child:ListTile(
                                    
                                    leading: mapData['image_url']==null?null:CircleAvatar(
                                      backgroundImage:NetworkImage(mapData['image_url']) ,
                                    ),
                                     title: Container(
                                        child: Text('${_controller.text}:${mapData['type']}',style:TextStyle(fontWeight:FontWeight.bold),)
                                      ),
                                    
                                  ),
                                  
                                ),
                                Container(
                                  color: Colors.white,
                                  child: Text(mapData['definition']),
                                )
                              ],
                            ),
                          );
                        }
                    );
                  }
                ),
              ),
            )
          ],
        ),
      
    );
  }
}