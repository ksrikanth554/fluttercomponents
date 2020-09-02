import 'package:flutter/material.dart';

class Custom_CirccularProgressBar extends StatefulWidget {
  @override
  _Custom_CirccularProgressBarState createState() => _Custom_CirccularProgressBarState();
}

class _Custom_CirccularProgressBarState extends State<Custom_CirccularProgressBar> {
  @override
  Widget build(BuildContext context) {
    const TWO_PI=3.14*2;
    var size=200.0;
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Circular Bar'),
      ),
      body: Center(
        child:TweenAnimationBuilder(
          tween: Tween(begin: 0.0,end: 1.0), 
          duration: Duration(seconds: 4), 
          builder: (context,value,child){
            int percentage=(value*100).ceil();
              return Container(
              
              height: size,
              width: size,
              child: Stack(
                children: [
                  ShaderMask(
                    shaderCallback: (rect){
                    return SweepGradient(
                        startAngle: 0.0,
                        endAngle:TWO_PI ,
                        center: Alignment.center,
                        stops: [value,value],
                        colors: [Colors.blue,Colors.grey[400]]
                      ).createShader(rect);
                    },
                    child: Container(
                      //height: size,
                      //width: size,
                      
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      height: size-30,
                      width: size-30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white
                      ),
                      child: Center(child: Text('$percentage')),
                    ),
                  )
                ],
              ),
            );
          }
        ) 
      ),
    );
  }
}