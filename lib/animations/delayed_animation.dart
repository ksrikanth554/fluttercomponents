import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class DelayedAnimationExample extends StatefulWidget {
  @override
  _DelayedAnimationExampleState createState() => _DelayedAnimationExampleState();
}

class _DelayedAnimationExampleState extends State<DelayedAnimationExample> with SingleTickerProviderStateMixin{
  Animation animation,delayedAnimation,muchDelayedAnimation;
  AnimationController animationController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController=AnimationController(vsync: this,duration: Duration(seconds: 3));
    animation=Tween(begin: -1.0,end: 0.0).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.fastLinearToSlowEaseIn));
    delayedAnimation=Tween(begin: -1.0,end: 0.0).animate(CurvedAnimation(
      parent: animationController,
      curve:Interval(0.4, 1.0,curve: Curves.fastLinearToSlowEaseIn)
      ));
    muchDelayedAnimation=Tween(begin: -1.0,end: 0.0).animate(CurvedAnimation(
      parent: animationController,
      curve: Interval(0.8, 1.0,curve:Curves.fastLinearToSlowEaseIn)
      ));
    animationController.forward();
  }
  @override
  Widget build(BuildContext context) {
    final double width=MediaQuery.of(context).size.width;
    final double height=MediaQuery.of(context).size.height;
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        return Scaffold(
          body: Align(
            alignment: Alignment.center,
             child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               children: <Widget>[
                      Transform(
                        transform: Matrix4.translationValues(animation.value*width, 0.0, 0.0),
                        
                          child: Container(
                            //alignment: Alignment.center,
                            padding: EdgeInsets.only(left: width*0.05,right:width*0.05),
                            //width: width*0.5,
                              child: Text('Login',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                                
                                
                              
                            
                          ),
                      ),
                      Transform(
                      transform: Matrix4.translationValues(delayedAnimation.value*width, 0.0, 0.0),
                      child: Container(
                          padding: EdgeInsets.only(left: width*0.05,right:width*0.05),
                          child:Column(
                            children: <Widget>[
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: 'User Name'
                              ),
                             ),
                           TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Password'
                            ),
                            ),
                           ],
                          )
                      ),
                   ),
                   Transform(transform: Matrix4.translationValues(muchDelayedAnimation.value*width, 0.0, 0.0),
                    child: Container(
                      padding: EdgeInsets.only(left: width*0.05,right:width*0.05),
                      child:RaisedButton(onPressed: (){

                                 },
                                 color: Colors.blue,
                                 child: Text('Login'),
                               ) ,
                    ),
                   
                   )
             ],
            ),
          ),
        );
      },
      
    );
  }
}