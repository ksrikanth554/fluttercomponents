import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:local_auth/local_auth.dart';
import 'dart:io';

class FingerPrintWeclome extends StatefulWidget {
  final String username;
  final String password;
  final bool wantTouchID;
  FingerPrintWeclome({
    @required this.username,
    @required this.password,
    @required this.wantTouchID
    });
  @override
  _FingerPrintWeclomeState createState() => _FingerPrintWeclomeState();
}

class _FingerPrintWeclomeState extends State<FingerPrintWeclome> {
  final LocalAuthentication auth=LocalAuthentication();
  final FlutterSecureStorage storage=FlutterSecureStorage();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.wantTouchID) {
      authenticate();      
    }
  }
  void authenticate()async{
    final canCheck=await auth.canCheckBiometrics;
    if (canCheck) {
      List<BiometricType> availableBiometric=await auth.getAvailableBiometrics();
      if (Platform.isAndroid) {
          if (availableBiometric.contains(BiometricType.fingerprint)) {
            final authenticated=await auth.authenticateWithBiometrics(
              localizedReason: 'Enable FingerPrint sing in more easily',
              useErrorDialogs: true,
              stickyAuth: true

            );
            if (authenticated) {
              storage.write(key: 'username', value: widget.username);
              storage.write(key: 'password', value: widget.password);
              storage.write(key: 'usingBiometric', value: 'true');
            }
          }
          else if (availableBiometric.contains(BiometricType.face)) {
            
          }        
      }      
    }
    else{
      print('cant check');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: 
            Text(widget.username),
      ),
    );
  }
}