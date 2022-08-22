import 'dart:async';

import 'package:flutter/material.dart';

class SpleshScreen extends StatefulWidget {
  const SpleshScreen({Key? key}) : super(key: key);

  @override
  State<SpleshScreen> createState() => _SpleshScreenState();
}

class _SpleshScreenState extends State<SpleshScreen> {
  double i=0;
  @override
  Widget build(BuildContext context) {

    // Future.delayed(Duration(seconds: 3),()=> Navigator.pushReplacementNamed(context, '/') );

    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        i = i+0.1;
      });
    });

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlutterLogo(size: 150),
              SizedBox(height: 20,),
              CircularProgressIndicator(
                backgroundColor: Colors.red.shade50,
                value: i,
              ),
              SizedBox(height: 20,),
              LinearProgressIndicator(value: i,backgroundColor:Colors.red.shade50,color: Colors.red,),
            ],
          ),
        ),
      ),
    );
  }
}
