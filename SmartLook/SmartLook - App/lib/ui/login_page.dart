import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pfc/ui/terms.dart';
import 'package:pfc/ui/theme.dart';
import 'package:pfc/ui/widgets/input_field.dart';
import 'package:pfc/ui/widgets/input_password.dart';
import 'package:pfc/ui/widgets/myButtonLogin.dart';

import '../home_page.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff040f15),
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 70),

        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Text(
                  "Lacus",
                  style: loginTitleStyle,
                ),
                padding:EdgeInsets.only(top:10, bottom: 30),
              ),
              Container(
                child: Text(
                  "A segurança com a íris",
                  style: headingStyleLogin,
                ),
                padding: EdgeInsets.only(left: 10, top: 400, bottom: 10),
              ),
              Container(
                child: Text(
                  "A segurança dos seus dados através do seu olhar. Um novo meio de proteger.",
                  style: subHeadingStyle,
                ),
                padding: EdgeInsets.only(left: 10, bottom: 10),
              ),
              Container(
                padding: EdgeInsets.only(top: 50),
                child: Row(
                  children: [
                    MyButtonLogin(label: "         Começar", onTap:
                        ()=>Get.to(Termos()))
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
