import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PDFSection extends StatelessWidget {
  const PDFSection({super.key, required this.title, required this.pdfPath});

  final String title;
  final String pdfPath;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 700,
      child: SfPdfViewer.network(pdfPath),
    );
  }
}
