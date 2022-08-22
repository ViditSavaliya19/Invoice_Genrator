import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter04/model/modelData.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

void pdfGen(ModelClass m1) async {
  var image = await pw.MemoryImage(File("${m1.path}").readAsBytesSync());
  var pdf = pw.Document();

  pdf.addPage(
    pw.Page(
      orientation: pw.PageOrientation.portrait,
      margin: pw.EdgeInsets.all(10),
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        return pw.Container(
          alignment: pw.Alignment.center,
          decoration: pw.BoxDecoration(
            border: pw.Border.all(color: PdfColors.black, width: 5),
          ),
          child: pw.Column(
            children: [
              pw.Container(
                width: double.infinity,
                height: 200,
                alignment: pw.Alignment.center,
                color: PdfColors.red,
                child: pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.center,
                  children: [
                    pw.Image(image),
                    pw.Text(
                      "${m1.name}",
                      style: pw.TextStyle(fontSize: 25, color: PdfColors.white),
                    ),
                  ],
                ),
              ),
              pw.SizedBox(height: 20),
              pw.Text(
                "${m1.qa}",
                style: pw.TextStyle(fontSize: 20, color: PdfColors.red),
              ),
              pw.SizedBox(height: 20),
              pw.Text(
                "${m1.exp}",
                style: pw.TextStyle(fontSize: 20, color: PdfColors.red),
              ),
              pw.SizedBox(height: 20),
              pw.Text(
                "SKILL : ${m1.skill}",
                style: pw.TextStyle(fontSize: 20, color: PdfColors.red),
              ),
              pw.SizedBox(height: 20),

            ],
          ),
        );
      },
    ),
  );

  Directory? dir = await getExternalStorageDirectory();
  print("=================== ${dir!.path}");
  File file = File("${dir.path}/flutter.pdf");
  file.writeAsBytes(await pdf.save());
}
