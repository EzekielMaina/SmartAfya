// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_pdf/pdf.dart';
// import 'dart:typed_data';
// import 'dart:io';

// import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

// class ReportsPage extends StatefulWidget {
//   @override
//   _ReportsPageState createState() => _ReportsPageState();
// }

// class _ReportsPageState extends State<ReportsPage> {
//   late PdfDocument _pdfDocument;
//   late String _pdfFileName;
//   bool _showPdf = false;
//   late Uint8List _pdfDocumentBytes;

// // ...

//   @override
//   void initState() {
//     super.initState();
//   }

//   Future<void> _createPdfMedicalReminder() async {
//     // Create the PDF document
//     _pdfDocument = PdfDocument();
//     // Add content to the PDF document for medical reminder
//     PdfPage page = _pdfDocument.pages.add();
//     // Add a logo at the center of the page
//     final Uint8List imageBytes = await File('path/to/image.png').readAsBytes();
//     PdfBitmap logo = PdfBitmap(imageBytes);
//     page.graphics.drawImage(
//         logo,
//         Rect.fromLTWH(page.getClientSize().width / 2 - 50,
//             page.getClientSize().height / 2 - 50, 100, 100));
//     // Add a time stamp at the bottom-right corner of the page
//     page.graphics.drawString(
//         DateTime.now().toString(), PdfStandardFont(PdfFontFamily.helvetica, 10),
//         bounds: Rect.fromLTWH(page.getClientSize().width - 100,
//             page.getClientSize().height - 20, 100, 20),
//         format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));
//     // Save the PDF document to memory
//     List<int> bytes = await _pdfDocument.save();
//     // Set the PDF file name
//     _pdfFileName = 'Medical Reminder.pdf';
//     // Show the PDF document in the app
//     setState(() {
//       _showPdf = true;
//     });
//   }

//   Future<void> _createPdfArticleSurfing() async {
//     // Create the PDF document
//     _pdfDocument = PdfDocument();
//     // Add content to the PDF document for article surfing
//     PdfPage page = _pdfDocument.pages.add();
//     // Add a logo at the center of the page
//     final Uint8List imageBytes = await File('path/to/image.png').readAsBytes();
//     PdfBitmap logo = PdfBitmap(imageBytes);
//     page.graphics.drawImage(
//         logo,
//         Rect.fromLTWH(page.getClientSize().width / 2 - 50,
//             page.getClientSize().height / 2 - 50, 100, 100));
//     // Add a time stamp at the bottom-right corner of the page
//     page.graphics.drawString(
//         DateTime.now().toString(), PdfStandardFont(PdfFontFamily.helvetica, 10),
//         bounds: Rect.fromLTWH(page.getClientSize().width - 100,
//             page.getClientSize().height - 20, 100, 20),
//         format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));
//     // Save the PDF document to memory
//     List<int> bytes = await _pdfDocument.save();
//     // Set the PDF file name
//     _pdfFileName = 'Article Surfing.pdf';
//     // Show the PDF document in the app
//     setState(() {
//       _showPdf = true;
//     });
//   }

//   Future<void> _createPdfFitness() async {
//     // Create the PDF document
//     _pdfDocument = PdfDocument();
//     // Add content to the PDF document for fitness
//     PdfPage page = _pdfDocument.pages.add();
//     // Add a logo at the center of the page
//     final Uint8List imageBytes = await File('path/to/image.png').readAsBytes();
//     PdfBitmap logo = PdfBitmap(imageBytes);
//     page.graphics.drawImage(
//         logo,
//         Rect.fromLTWH(page.getClientSize().width / 2 - 50,
//             page.getClientSize().height / 2 - 50, 100, 100));
// // Add a time stamp at the bottom-right corner of the page
//     page.graphics.drawString(
//         DateTime.now().toString(), PdfStandardFont(PdfFontFamily.helvetica, 10),
//         bounds: Rect.fromLTWH(page.getClientSize().width - 100,
//             page.getClientSize().height - 20, 100, 20),
//         format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));
// // Save the PDF document to memory
//     List<int> bytes = await _pdfDocument.save();
// // Set the PDF file name
//     _pdfFileName = 'Fitness.pdf';
// // Show the PDF document in the app
//     setState(() {
//       _showPdf = true;
//     });
//   }

//   Future<void> _createPdfDiet() async {
// // Create the PDF document
//     _pdfDocument = PdfDocument();
// // Add content to the PDF document for diet
//     PdfPage page = _pdfDocument.pages.add();
// // Add a logo at the center of the page
//     final Uint8List imageBytes = await File('path/to/image.png').readAsBytes();
//     PdfBitmap logo = PdfBitmap(imageBytes);
//     page.graphics.drawImage(
//         logo,
//         Rect.fromLTWH(page.getClientSize().width / 2 - 50,
//             page.getClientSize().height / 2 - 50, 100, 100));
// // Add a time stamp at the bottom-right corner of the page
//     page.graphics.drawString(
//         DateTime.now().toString(), PdfStandardFont(PdfFontFamily.helvetica, 10),
//         bounds: Rect.fromLTWH(page.getClientSize().width - 100,
//             page.getClientSize().height - 20, 100, 20),
//         format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));
// // Save the PDF document to memory
//     List<int> bytes = await _pdfDocument.save();
// // Set the PDF file name
//     _pdfFileName = 'Diet.pdf';
// // Show the PDF document in the app
//     setState(() {
//       _showPdf = true;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Reports'),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             SizedBox(height: 20),
//             Text(
//               'Choose an option to generate report:',
//               style: TextStyle(fontSize: 20),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () async {
//                 var pdfBytes = await _createPdfMedicalReminder();
//                 List<int> pdfBytes2 = pdfBytes;
//                 setState(() {
//                   _pdfDocumentBytes = Uint8List.fromList(pdfBytes2);
//                   _showPdf = true;
//                 });
//               },
//               child: Text('Medical Reminder'),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () async {
//                 var pdfBytes = await _createPdfArticleSurfing();
//                 setState(() {
//                   _pdfDocumentBytes = Uint8List.fromList(pdfBytes);
//                   _showPdf = true;
//                 });
//               },
//               child: Text('Article Surfing'),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () async {
//                 var pdfBytes = await _createPdfFitness();
//                 setState(() {
//                   _pdfDocumentBytes = Uint8List.fromList(pdfBytes);
//                   _showPdf = true;
//                 });
//               },
//               child: Text('Fitness'),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () async {
//                 var pdfBytes = await _createPdfDiet();
//                 setState(() {
//                   _pdfDocumentBytes = Uint8List.fromList(pdfBytes);
//                   _showPdf = true;
//                 });
//               },
//               child: Text('Diet'),
//             ),
//             SizedBox(height: 20),
//             if (_showPdf)
//               SfPdfViewer.memory(
//                 _pdfDocumentBytes,
//                 onDocumentLoaded: (PdfDocumentLoadedDetails details) {
//                   setState(() {
//                     _pdfDocument = details.document;
//                   });
//                 },
//               )
//           ],
//         ),
//       ),
//     );
//   }
// }
