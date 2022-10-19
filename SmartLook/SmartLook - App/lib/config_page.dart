import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pfc/ui/theme.dart';
import 'package:http/http.dart' as http;


class Config extends StatefulWidget {
  const Config({Key? key}) : super(key: key);

  @override
  State<Config> createState() => _UserPageState();
}

class _UserPageState extends State<Config> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  TextEditingController _textFieldController = TextEditingController();
  ImagePicker imagePicker = ImagePicker();
  XFile? imagemCamera;
  Uri url = Uri.https("lacus-8cf38-default-rtdb.europe-west1.firebasedatabase.app", "/db/.json");

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
    bool valOptionIris1 = true;
    bool valOptionIris2 = false;
    bool valOptionIris3 = false;


    onChangeFunction1(bool newValue1){
      setState(() {
        valOptionIris1 = newValue1;
      });
    }

    onChangeFunction2(bool newValue2){
      setState(() {
        valOptionIris2 = newValue2;
      });
    }

    onChangeFunction3(bool newValue3){
      setState(() {
        valOptionIris3 = newValue3;
      });
    }

    return Scaffold(
      appBar: _appBar(context),
      backgroundColor: context.theme.backgroundColor,
      body: Container(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 1),
          child: ListView(
            children: [
              SizedBox(height: 1),
              Row(
                children: [
                  SizedBox(width: 10, height: 30,),
                  Text(
                    "Configurações",
                    style: headingStyle,
                  ),
                ],
              ),
              SizedBox(width: 10, height: 20,),
              Divider(height: 20,thickness: 1),
              SizedBox(height: 10),
              buildAlterarIrisOption(context, "Alterar íris"),
              buildAlterarIdiomaOption(context, "Alterar idioma"),
              buildPoliticaOption(context, "Política e Privacidade"),
              SizedBox(height: 40),
              Row(
                children: [
                  //Text("")
                ],
              ),
              Divider(height: 20,thickness: 1),
              SizedBox(height: 10),
              buildIrisOption("Manter íris salva", valOptionIris1, onChangeFunction1),
              buildIrisOption("Reconhecimento após \nreinicialização do aparelho móvel", valOptionIris2, onChangeFunction2 ),
              buildIrisOption("Tornar disponível offline?", valOptionIris2, onChangeFunction2 )

            ],
          )
      ),
    );
  }

  Padding buildIrisOption(String title, bool value, Function onChangeMethod){
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.grey[600]
          )),
          Transform.scale(
              scale: 0.7,
              child: CupertinoSwitch(
                activeColor: Colors.deepPurple,
                trackColor: Colors.grey,
                value: value,
                onChanged: (bool newValue){
                  onChangeMethod(newValue);
                },
              )
          )
        ],
      ),
    );
  }

  GestureDetector buildAlterarIrisOption(BuildContext context, String title){
    return GestureDetector(
      onTap: (){
        showDialog(context: context, builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Deseja cadastrar uma nova íris?")
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    getImageIris();
                    _Post();
                    Navigator.of(context).pop();
                    //Navigator.push(
                      //context,
                     // MaterialPageRoute(builder: (context) => AddIrisPage()),
                   // );
                  },
                  child: Text("Sim")),


              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Não"))
            ],
          );
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.grey[600],
            )),
            Icon(Icons.arrow_forward_ios, color: Colors.grey,),
          ],
        ),
      ),
    );
  }
  GestureDetector buildAlterarIdiomaOption(BuildContext context, String title){
    return GestureDetector(
      onTap: (){
        showDialog(context: context, builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Deseja alterar o idioma do aplicativo para a língua inglesa?"),
                Text(" "),
                TextButton(
                    onPressed: () {
                      Get.snackbar("Idioma alterado", "Language changed!",
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Color(0xFFA2BBE5).withOpacity(0.2),
                        icon: Icon(Icons.check,
                          color: Colors.green,
                        ),
                      );
                      Navigator.of(context).pop();
                    },
                    child: Text("Sim")),

                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("Não"))
              ],
            ),
          );
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.grey[600],
            )),
            Icon(Icons.arrow_forward_ios, color: Colors.grey,),
          ],
        ),
      ),
    );
  }
  GestureDetector buildPoliticaOption(BuildContext context, String title){
    return GestureDetector(
      onTap: (){
        showDialog(context: context, builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Quando você usa nossos serviços, está confiando a nós suas informações. Entendemos que isso é uma grande responsabilidade e trabalhamos duro para proteger essas informações e colocar você no controle."),
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Fechar"))
            ],
          );
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.grey[600],
            )),
            Icon(Icons.arrow_forward_ios, color: Colors.grey,),
          ],
        ),
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

    Get.snackbar("De olho", "Sucesso ao adicionar íris!",
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 2, milliseconds: 500),
      backgroundColor: Color(0xFFA2BBE5).withOpacity(0.2),
      icon: Icon(Icons.visibility_sharp,
        color: Color(0xFF621F7F),
      ),
    );
  }

  void _Post(){
    http.post(url, body: json.encode({"db": "imagemCamera"},));
    //http.post(url, )
  }
}
