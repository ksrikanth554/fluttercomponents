import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class ParentingAnimationExample extends StatefulWidget {
  @override
  _ParentingAnimationExampleState createState() => _ParentingAnimationExampleState();
}

class _ParentingAnimationExampleState extends State<ParentingAnimationExample> with SingleTickerProviderStateMixin{
  Animation animation,childAnimation;
  AnimationController animationController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController=AnimationController(vsync: this,duration: Duration(seconds: 4));
    animation=Tween(begin: -0.25,end: 0.0).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInSine));
    childAnimation=Tween(begin: 20.0,end: 100.0).animate(
      CurvedAnimation(
        parent: animationController, 
        curve: Curves.easeInSine
      )
    );
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
          body: Transform(
            transform: Matrix4.translationValues(animation.value*width, 0.0, 0.0),
            
              child: AnimatedBuilder(
                animation: childAnimation,
                  builder:(ctx,child)=> Center(
                    child: Container(
                    alignment: Alignment.center,
                    height: childAnimation.value*2,
                    width: childAnimation.value*3,
                  padding: EdgeInsets.only(left: width*0.05,right:width*0.05),
                    //width: width*0.5,
                    child: ListView(
                     // mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Login',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
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
                        RaisedButton(onPressed: (){

                         },
                         color: Colors.blue,
                         child: Text('Login'),
                       )
                      ],
                    ),
                ),
                  ),
              ),
          ),
        );
      },
      
    );
  }
}