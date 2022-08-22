import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter04/model/modelData.dart';
import 'package:flutter04/utils/pdfgen.dart';

class ResumeSelectScreen extends StatefulWidget {
  const ResumeSelectScreen({Key? key}) : super(key: key);

  @override
  State<ResumeSelectScreen> createState() => _ResumeSelectScreenState();
}

class _ResumeSelectScreenState extends State<ResumeSelectScreen> {
  @override
  Widget build(BuildContext context) {
    ModelClass m1 = ModalRoute.of(context)!.settings.arguments as ModelClass;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Resume select"),
          actions: [
            IconButton(
              onPressed: () {


                pdfGen(m1);
              },
              icon: Icon(Icons.download),
            ),
          ],
        ),
        body: Column(
          children: [
            Image.file(File("${m1.path}")),
            Text(m1.name!),
            Text(m1.qa!),
            Text(m1.exp!),
            Text(m1.skill!),
          ],
        ),
      ),
    );
  }
}
