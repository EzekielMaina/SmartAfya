// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_pdf/pdf.dart';
// import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
// import 'dart:typed_data';

// class MyPdfPage extends StatefulWidget {
//   @override
//   _MyPdfPageState createState() => _MyPdfPageState();
// }

// class _MyPdfPageState extends State<MyPdfPage> {
//  late  PdfDocument _pdfDocument;
//   bool _showPdf = false;

//   Future<void> _createPdf() async {
//     // create a new PDF document
//     final PdfDocument document = PdfDocument();

//     // add a new page to the document
//     final PdfPage page = document.pages.add();

//     // create a new PDF font
//     final PdfFont font = PdfStandardFont(PdfFontFamily.helvetica, 20);

//     // draw some text on the page
//     page.graphics.drawString('Hello, world!', font,
//         bounds: Rect.fromLTWH(0, 0, page.size.width, page.size.height));

//     // save the document to a Uint8List
//     final Uint8List bytes = document.save();

//     // dispose of the PDF document
//     document.dispose();

//     // update the state to show the PDF
//     setState(() {
//       _pdfDocument = PdfDocument(inputBytes: bytes);
//       _showPdf = true;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('PDF Example'),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             SizedBox(height: 20),
//             Text(
//               'Click the button to generate a PDF:',
//               style: TextStyle(fontSize: 20),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _createPdf,
//               child: Text('Generate PDF'),
//             ),
//             SizedBox(height: 20),
//             if (_showPdf)
//               SfPdfViewer(document: _pdfDocument),
//           ],
//         ),
//       ),
//     );
//   }
// }
