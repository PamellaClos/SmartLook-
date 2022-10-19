import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pfc/ui/theme.dart';




class AddIrisPage extends StatefulWidget {
  const AddIrisPage({Key? key}) : super(key: key);

  @override
  State<AddIrisPage> createState() => _AddIrisPageState();
}

class _AddIrisPageState extends State<AddIrisPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  ImagePicker imagePicker = ImagePicker();
  XFile? imagemCamera;
  Uri url = Uri.https("lacus-8cf38-default-rtdb.europe-west1.firebasedatabase", "/db");
  //TextEditingController _controller = TextEditingController();

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
      body: Container(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 1),
          child: ListView(
            children: [
              SizedBox(height: 1),
              getImageIris()
              //Divider(height: 20,thickness: 1)
            ],
          )
      ),
    );
  }

  _appBar(BuildContext contex){
    return AppBar(
      elevation: 0,
      backgroundColor: contex.theme.backgroundColor,
      //backgroundColor: Colors.white,
      leading: GestureDetector(
        //quando a lua for tocada faz:
        onTap: (){
          Get.back();

        },
        child: Icon(Icons.arrow_back_ios,
            size: 20,
            color: Get.isDarkMode ? Colors.white:Colors.black
        ),
      ),

    );


  }

  getImageIris() async {
        final ImagePicker _picker = ImagePicker();
        final img =
        await _picker.pickImage(source: ImageSource.camera);
        setState(() {
          imagemCamera = img;
        });

      }




}

