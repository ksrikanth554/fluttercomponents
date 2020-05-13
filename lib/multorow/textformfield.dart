import 'package:flutter/material.dart';

TextFormField getTextForm(var controller,String str){
 return TextFormField(controller:controller,
        decoration:InputDecoration(labelText: str),
        validator: (val){
          if (val.isEmpty) {
           return 'Please Enter Value';
          }
          return null;

        },
        );
}