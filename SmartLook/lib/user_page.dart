import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pfc/ui/theme.dart';

import 'list_apps.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  // DatabaseReference ref = FirebaseDatabase.instance.ref();
  Uri url = Uri.https(
      "lacus-8cf38-default-rtdb.europe-west1.firebasedatabase.app",
      "/db/.json");

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
        backgroundColor: context.theme.backgroundColor,
        body: Column(children: [
          _addRegisterBar(),
          SizedBox(
            height: 10,
          ),
          Card(
            color: Color(0xff040f15).withOpacity(0.4),
            child: ListTile(
              title: Text(nomes.toString()),
              //subtitle: Text(app.getVersionInfo()),
            ),
          )
        ]));
  }

  _appBar(BuildContext contex) {
    return AppBar(
      elevation: 0,
      backgroundColor: contex.theme.backgroundColor,
      //backgroundColor: Colors.white,
      leading: GestureDetector(
        //quando a lua for tocada faz:
        onTap: () {
          Get.back();
        },
        child: Icon(Icons.arrow_back_ios,
            size: 20, color: Get.isDarkMode ? Colors.white : Colors.black),
      ),
    );
  }

  void _Get() {
    http.post(url,
        body: json.encode(
          {"db": "imagemCamera"},
        ));
    //http.post(url, )
  }

  _addRegisterBar() {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Aplicativos",
                  style: headingStyle,
                ),
                Text(
                  " ",
                  style: subHeadingStyle,
                ),
              ],
            ),
          ),
          //navegação
        ],
      ),
    );
  }
}
