import 'dart:convert';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pfc/ui/theme.dart';
import 'package:pfc/ui/widgets/button_terms.dart';
import 'package:http/http.dart' as http;

import '../home_page.dart';

class Termos extends StatefulWidget {
  const Termos({Key? key}) : super(key: key);

  @override
  State<Termos> createState() => _TermosState();
}

class _TermosState extends State<Termos> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
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
      backgroundColor: Color(0xff040f15), //
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 70, bottom: 12),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  padding: EdgeInsets.only(bottom: 60),
                alignment: Alignment.center,
                  child: Column(
                    children: [
                      Text(
                        "Termos",
                        style: logTherms,
                      ),
                      Image(image: AssetImage('assets/images/termos3.png'), width: 250),
                    ],
                  )),
              Container(
                child: Text(
                  "Termos de segurança",
                  style: headingStyle,
                ),
                padding: EdgeInsets.only(left: 10, top: 30, bottom: 10),
              ),
              Container(
                child: Text(
                  "Ao clicar em concordar, você aceita os nossos termos de segurança. Lembre-se, nenhum dado será compartilhado.",
                  style: subtitleTermsStyle,
                ),
                padding: EdgeInsets.only(left: 10, bottom: 10),
              ),
              Container(
                padding: EdgeInsets.only(top: 50),
                child: Row(
                  children: [
                    MyButtonTerms(
                        label: "         Começar",
                        onTap: () => Get.to(HomePage()))
                    //MyButtonTerms(label: "Começar", onTap: _Post)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
