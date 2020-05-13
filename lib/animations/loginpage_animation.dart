import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class LoginPageAnimation extends StatefulWidget {
  @override
  _LoginPageAnimationState createState() => _LoginPageAnimationState();
}

class _LoginPageAnimationState extends State<LoginPageAnimation> with SingleTickerProviderStateMixin{
  Animation animation;
  AnimationController animationController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController=AnimationController(vsync: this,duration: Duration(seconds: 2));
    animation=Tween(begin: -1.0,end: 0.0).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.fastLinearToSlowEaseIn));
    animationController.forward();
  }
  @override
  Widget build(BuildContext context) {
    final double width=MediaQuery.of(context).size.width;
    final double height=MediaQuery.of(context).size.height;
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Scaffold(
          body: Transform(
            transform: Matrix4.translationValues(animation.value*width, 0.0, 0.0),
            
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(left: width*0.05,right:width*0.05),
                //width: width*0.5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
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
        );
      },
      
    );
  }
}