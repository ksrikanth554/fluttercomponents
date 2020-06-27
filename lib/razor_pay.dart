import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class RazorPayExample extends StatefulWidget {
  @override
  _RazorPayExampleState createState() => _RazorPayExampleState();
}

class _RazorPayExampleState extends State<RazorPayExample> {
  int totalamount=0;
  Razorpay _razorpay;
  bool isPayemnt=false;
  String result='';
  var _controller=TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _razorpay=Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlerPaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlerPaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handlerExternalWallet);

  }
  @override
   void dispose(){
     super.dispose();
     _razorpay.clear();
   }
  Future openCheckOut()async{
    var options={
      'key':'rzp_test_4lUmeGUrwbjggv',
      'amount':totalamount*100,
      'name':'Srikanth',
      'description':'Test Payment',
      'prefill':{'contact':'','email':''},
      'external':{
        'wallets':['paytm']
      }
    };
    try {
      _razorpay.open(options);
    }
    catch (e) {
      debugPrint(e);
    }
  }
  void _handlerPaymentSuccess(PaymentSuccessResponse response){
    Fluttertoast.showToast(msg: 'SUCCESS: ${response.paymentId}');
    setState(() {
      result=response.paymentId;
    });
  }
  void _handlerPaymentError(PaymentFailureResponse response){
    Fluttertoast.showToast(msg: 'FAILURE: ${response.code} - ${response.message}');
  }
  void _handlerExternalWallet(ExternalWalletResponse response ){
    Fluttertoast.showToast(msg: 'EXTERNAL WALLET: ${response.walletName}');
  } 

  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
        appBar: AppBar(
          title: Text('Razor Pay'),
          
        ),
        body:Center(
          child:isPayemnt?Center(
            child: CircularProgressIndicator(),
          ):Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:<Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _controller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    
                    hintText: 'Enter Amount'
                  ),
                  onChanged: (val){
                    setState(() {
                      totalamount=int.parse(val);
                    });
                  },
                ),
              ),
              RaisedButton(
                child:Text('Make Payment'),
                onPressed:()async{
                  setState(() {
                    isPayemnt=true;
                  });
                 await openCheckOut().then((ret){
                   setState(() {
                     isPayemnt=false;
                      _controller.clear();
                      //result=ret.toString();
                   });
                 });
                }
              ),
              Text(result)
            ]
          )
        )
      ),
    );
  }
}