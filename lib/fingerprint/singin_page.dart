import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttercomponents/fingerprint/singincredential.dart';
import 'package:fluttercomponents/fingerprint/welcome_page.dart';
import 'package:local_auth/local_auth.dart';

class FingerPrintSignIn extends StatefulWidget {
  @override
  _FingerPrintSignInState createState() => _FingerPrintSignInState();
}

class _FingerPrintSignInState extends State<FingerPrintSignIn> {

  
  final LocalAuthentication auth=LocalAuthentication();
  final FlutterSecureStorage storage=FlutterSecureStorage();
  bool userHasTouchId=false;
  String userName,password;
  bool isLoading=false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //getSecureStorage();
  }
  void getSecureStorage()async{
    final isUsingBio=await storage.read(key: 'usingBiometric');
    setState(() {
      userHasTouchId=isUsingBio=='true';
    });
  }
  void authenticate()async{
    final canCheck=await auth.canCheckBiometrics;
    if (canCheck) {
      List<BiometricType> availableBiometrics=await auth.getAvailableBiometrics();
      if (Platform.isAndroid) {
        if (availableBiometrics.contains(BiometricType.fingerprint)) {
          final authenticated=await auth.authenticateWithBiometrics(
            localizedReason: 'Enable fingerprint is easily sign in',
            useErrorDialogs: true,
            stickyAuth: true
          );
          if (authenticated) {
            final storeUsername=await storage.read(key: 'username');
            final storedPassword=await storage.read(key: 'password');
            _logIn(storeUsername, storedPassword,false);
          }
        }
      }      
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Container(
        color: Colors.deepOrange[200],
        child: Stack(
          children: [
           
            Center(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 50),
                
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  
                  children: <Widget>[
                    TextField(
                     
                      decoration: InputDecoration(
                        hintText: 'User Name'
                      ),
                      onChanged: (val){
                        if (val!=null) {
                          setState(() {
                            userName=val;
                          });
                        }
                      },
                    ),
                    TextField(
                      
                      decoration: InputDecoration(
                        hintText: 'Password'
                      ),
                      onChanged: (val){
                        if (val!=null) { 
                          setState(() {
                            password=val;
                          });
                        }
                      },
                    ),
                    IconButton(
                    icon:Icon(Icons.fingerprint,color: Colors.blue,) , 
                      onPressed:authenticate
                    ),
                    RaisedButton(
                      color: Colors.cyan,
                      child: Text('LogIn',style: TextStyle(color: Colors.black),),
                      onPressed:()=>_logIn(userName,password,true),
                    )
                  ],
                ),
              ),
            ),
             Center(
               child: Visibility(
                visible: isLoading,
                
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.red,
                   // valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                    
                  
                ) ,
              ),
             ),
          ],
        ),
      ),
      
    );
  }
  _logIn(String username,String password,bool touchId){
    if (username!=null && password!=null
        && username==fingerPrintUsername && password==fingerPrintPassword
       )
    {
      setState(() {
        isLoading=true;
      });
      Future.delayed(Duration(milliseconds: 2000)).then((res){
       Navigator.pushReplacement(context,
        CupertinoPageRoute(
          builder: (ctx)=>FingerPrintWeclome(
            username: username, 
            password: password, 
            wantTouchID: touchId
          )));
      });
     
    }
    else{
      showDialog(
        context: context,
        builder: (ctx){
         return AlertDialog(
            title: Text('Message'),
            content: Text('Invalid Credentials'),
            actions: <Widget>[
              FlatButton(onPressed: ()=>Navigator.pop(context), child: Text('ok'))
            ],
          );
        }
      );
    }
  }
}