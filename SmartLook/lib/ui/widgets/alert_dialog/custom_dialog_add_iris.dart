import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';

import '../../../constanst.dart';

class CustomDialogAddIirs extends StatefulWidget {
  final String title, descriptions, text;
  final String img;


  const CustomDialogAddIirs({required this.title, required this.descriptions, required this.text, required this.img});

  @override
  _CustomDialogIdIrisState createState() => _CustomDialogIdIrisState();
}

class _CustomDialogIdIrisState extends State<CustomDialogAddIirs> {
  ImagePicker imagePicker = ImagePicker();
  XFile? imagemCamera;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Constants.padding),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }
  contentBox(context){
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: Constants.padding,top: Constants.avatarRadius
              + Constants.padding, right: Constants.padding,bottom: Constants.padding
          ),
          margin: EdgeInsets.only(top: Constants.avatarRadius),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Color(0xff3f334d).withOpacity(0.4),
              borderRadius: BorderRadius.circular(Constants.padding),
              boxShadow: [
                BoxShadow(color: Colors.black,offset: Offset(0,10),
                    blurRadius: 10
                ),
              ]
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(widget.title,style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600),),
              SizedBox(height: 15,),
              Text(widget.descriptions,style: TextStyle(fontSize: 14),textAlign: TextAlign.center,),
              SizedBox(height: 22,),
              Align(
                alignment: Alignment.bottomRight,
                child: FlatButton(
                    onPressed: (){
                      getImageIris();
                      Navigator.of(context).pop();
                    },
                    child: Text(widget.text,style: TextStyle(fontSize: 18),)),
              ),
            ],
          ),
        ),
        Positioned(
          left: Constants.padding,
          right: Constants.padding,
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: Constants.avatarRadius,
            child: ClipRRect(
                child: Image.asset("assets/images/eye-scan.png")
            ),
          ),
        ),
      ],
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


  snackbar(){
    Get.snackbar("De olho", "Sucesso ao adicionar íris!",
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 2, milliseconds: 500),
      backgroundColor: Color(0xFFA2BBE5).withOpacity(0.2),
      icon: Icon(Icons.visibility_sharp,
        color: Color(0xFF621F7F),
      ),
    );
  }
}