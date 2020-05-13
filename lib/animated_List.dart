import 'package:flutter/material.dart';

class AnimatedListExample extends StatefulWidget {
  @override
  _AnimatedListExampleState createState() => _AnimatedListExampleState();
}

class _AnimatedListExampleState extends State<AnimatedListExample> with SingleTickerProviderStateMixin {
  List _myList=[];
  var _myListKey=GlobalKey<AnimatedListState>();
  AnimationController emptyController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emptyController=AnimationController(
      vsync:this,
      duration: Duration(milliseconds: 1000)
     );
     emptyController.forward();
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated List'),
      ),
      body:_myList.length==0?FadeTransition(opacity: emptyController,child: Center(child:Text('No Items'))):AnimatedList(
        key: _myListKey,
        initialItemCount: _myList.length,
        itemBuilder: (context,index,animation){
          return SizeTransition(
                  sizeFactor: animation,
                 child: InkWell(
                 child: ListTile(
                title: Text(_myList[index]),
              ),
              onDoubleTap: (){
                _myList.removeAt(index);
                _myListKey.currentState.removeItem(index,(ctx,animation){
                  return null;
                });
                if (_myList.length==0) {
                  emptyController.reset();
                  setState(() {
                    
                  });
                  emptyController.forward();
                }
              },
            ),
          );
        }
        ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        _myList.insert(0, 'ListItem4');
        if(_myListKey.currentState!=null)
        _myListKey.currentState.insertItem(0);
        if (_myList.length!=0) {
          setState(() {
            
          });
        }
      },
      child: Icon(Icons.add),
      ),
    );
  }
}