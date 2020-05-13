import 'package:flutter/material.dart';



class TransaformingAnimation extends StatefulWidget {
  @override
  _TransaformingAnimationState createState() => _TransaformingAnimationState();
}

class _TransaformingAnimationState extends State<TransaformingAnimation> with SingleTickerProviderStateMixin{
  Animation animation,transformingAnimation;
  AnimationController animationController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController=AnimationController(vsync: this,duration: Duration(seconds: 4));
    animation=Tween(begin: 10.0,end: 100.0).animate(CurvedAnimation(
      parent: animationController, 
      curve: Curves.ease
    ));
    transformingAnimation=BorderRadiusTween(
      begin:BorderRadius.circular(125.0),
      end: BorderRadius.circular(0.0)
    ).animate(
      CurvedAnimation(
      parent: animationController, 
      curve: Curves.ease
      )
    );
    animationController.forward();
  }
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animationController, 
        builder: (ctx,child){
          return Scaffold(
          body: Center(
              child: Container(
                height: animation.value*2,
                width: animation.value*2,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2.0
                  ),
                  color: Colors.white,
                  borderRadius: transformingAnimation.value
                ),
              ),
            ),
          );
        }
      
      
    );
  }
}