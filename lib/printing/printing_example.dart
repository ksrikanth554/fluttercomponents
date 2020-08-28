
// import 'package:flutter/material.dart';
// import 'package:printing/printing.dart';
// import 'package:pdf/widgets.dart' as pw;

// class PrintingExmaple extends StatefulWidget {
//   @override
//   _PrintingExmapleState createState() => _PrintingExmapleState();
// }

// class _PrintingExmapleState extends State<PrintingExmaple> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Printing Example'),

//       ),
//       body: Center(
//         child: RaisedButton(
//           child: Icon(Icons.print),
              
//                onPressed: () {
//                 Printing.layoutPdf(

//                       onLayout: (pageFormat){
//                           final doc=pw.Document();
//                           doc.addPage(
//                             pw.Page(
//                               build: (pw.Context context){

//                                 return pw.Center(
//                                   child:pw.Text('Example Doument')
//                                 ) ;

//                               }
//                             )
//                           );
//                           return doc.save();
//                       }
//                 );
//               },
//         ),
//       ),
//     );
//   }
// }
