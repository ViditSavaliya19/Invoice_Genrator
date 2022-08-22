import 'package:flutter/material.dart';
import 'package:stickereditor/stickereditor.dart';

class EditImage extends StatefulWidget {
  const EditImage({Key? key}) : super(key: key);

  @override
  State<EditImage> createState() => _EditImageState();
}

class _EditImageState extends State<EditImage> {


  List<Color> colorList = [
    Colors.red,
    Colors.amber,
    Colors.blue,
    Colors.black,
    Colors.green
  ];

  List<String> imageList=['assets/emoji.png','assets/emoji.png','assets/emoji.png'];
  List<String> fontList= ['sans','sans','sans','sans'];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: StickerEditingView(
          assetList: imageList,
          fonts: fontList,
          imgUrl:"https://cdn.unenvironment.org/2022-03/field-ge4d2466da_1920.jpg",
          isnetwork: true,
          palletColor: colorList,
        ),
      ),
    );
  }
}
