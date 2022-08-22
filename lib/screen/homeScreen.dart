import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter04/model/modelData.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String path = "";

  TextEditingController txtName = TextEditingController();
  TextEditingController txtQa = TextEditingController();
  TextEditingController txtSkill = TextEditingController();
  TextEditingController txtExp = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Resume Maker",style: GoogleFonts.dancingScript(fontSize: 20,color: Colors.amber),),
          centerTitle: true,
          backgroundColor: Colors.purple,
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              children: [
                InkWell(
                  onTap: () async {
                    ImagePicker imagePicker = ImagePicker();
                    XFile? file =
                        await imagePicker.pickImage(source: ImageSource.camera);

                    setState(() {
                      path = file!.path;
                    });
                  },
                  child: CircleAvatar(
                    radius: 100,
                    backgroundImage: FileImage(File("$path")),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: txtName,
                  decoration: InputDecoration(hintText: "Name"),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: txtQa,
                  decoration: InputDecoration(hintText: "Qualification"),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: txtExp,
                  decoration: InputDecoration(hintText: "Exp"),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: txtSkill,
                  decoration: InputDecoration(hintText: "Skill"),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(onPressed: () {
                  String name = txtName.text;
                  String qa = txtQa.text;
                  String exp = txtExp.text;
                  String skill = txtSkill.text;




                  ModelClass m1 = ModelClass(name: name,exp: exp,path: path,qa: qa,skill: skill);


                  Navigator.pushNamed(context, 'selectResume',arguments: m1);

                }, child: Text("Next")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
