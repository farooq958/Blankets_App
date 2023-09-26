import 'dart:io';

import 'package:hbk/Data/DataSource/Resources/imports.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfScreen extends StatelessWidget {
  final String filePath;

  const PdfScreen({super.key, required this.filePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarWithBackButton(
        title: 'Pdf',
        exceptional: true,
      ),
      body: SfPdfViewer.file(
        File(filePath),
      ),
    );
  }
}
