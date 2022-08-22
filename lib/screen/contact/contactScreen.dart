import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../main.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  List l1 = [
    "Kartik",
    "Yash",
    "Ronak",
    "Ronik",
    "Jay",
    "Anni",
    "Prit",
    "Prasant",
    "Darshti",
    "Yash"
  ];
  List l2 = ["k", "y", "r", "r", "j", "a", "p", "p", "d", "y"];
  bool theme = false;

  TextEditingController txtData = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            Switch(value: theme, onChanged: (value){
              setState(() {
                theme=value;
              });

              streamController.add(theme);
            })
          ],
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text("Add New Number"),
                    content: SizedBox(
                      height: 300,
                      child: Column(
                        children: [
                          TextField(
                            decoration: InputDecoration(hintText: "Name"),
                            controller: txtData,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                l1.add(txtData.text);
                              });
                              Navigator.pop(context);
                            },
                            child: Text("Add"),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            child: Icon(Icons.add)),
        body: Center(
          child: ListView.builder(
            itemCount: l1.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  setState(() {
                    l1.removeAt(index);
                  });
                },
                child: ListTile(
                  title: Text("${l1[index]}",style: Theme.of(context).textTheme.headline1,),
                  subtitle: Text("${l1[index]}"),
                  trailing: SizedBox(
                    width: 200,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () async {
                              await launchUrl(Uri.parse("tel: +917046632531"));
                            },
                            icon: Icon(Icons.call, color: Colors.green)),
                        Icon(
                          Icons.sms,
                          color: Colors.blue,
                        ),
                        IconButton(
                            onPressed: () async {
                              await launchUrl(Uri.parse(
                                  "https://pub.dev/packages/url_launcher"));
                            },
                            icon: Icon(Icons.link, color: Colors.purple)),
                        IconButton(
                            onPressed: () async {
                              await Share.share("${l1[index]}  992553668559");
                            },
                            icon: Icon(Icons.share, color: Colors.pink)),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
