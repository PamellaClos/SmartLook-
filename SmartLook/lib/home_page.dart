import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:installed_apps/app_info.dart';
import 'package:installed_apps/installed_apps.dart';
import 'package:pfc/appProtegido.dart';
import 'package:pfc/services/theme_services.dart';
import 'package:pfc/ui/theme.dart';
import 'package:pfc/user_page.dart';
import 'add_app.dart';
import 'config_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var notifiHelper;
  AppInfo? app;
  List<String> aplicativos = <String>[];

  //late final dref = FirebaseDatabase.instance.reference();
  //late DatabaseReference databaseReference;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      backgroundColor: context.theme.backgroundColor,
      body: Column(
        children: [
          _addRegisterBar(),
          SizedBox(
            height: 10,
          ),
          aplicativos.isEmpty == null
              ? FutureBuilder<List<AppInfo>>(
                  future: InstalledApps.getInstalledApps(true, true),
                  builder: (BuildContext buildContext,
                      AsyncSnapshot<List<AppInfo>> snapshot) {
                    return snapshot.connectionState == ConnectionState.done
                        ? snapshot.hasData
                            ? ListView.builder(
                                itemCount: snapshot.data!.length,
                                itemBuilder: (context, index) {
                                  AppInfo app = snapshot.data![index];
                                  return Card(
                                    shadowColor: Color(0xff040f15).withOpacity(0.4),
                                    color: Color(0xff040f15).withOpacity(0.4),
                                    child: ListTile(
                                      leading: CircleAvatar(
                                        backgroundColor: Colors.transparent,
                                        child: Image.memory(app.icon!),
                                      ),
                                      title: Text(app.name!),
                                      //subtitle: Text(app.getVersionInfo()),
                                      onLongPress: () =>
                                          InstalledApps.openSettings(
                                              app.packageName!),
                                    ),
                                  );
                                },
                              )
                            : Center(
                                child: Text(
                                    "Houve um erro ao encontrar os aplicativos instalados!"))
                        : Center(child: Text("Trabalhando nisso..."));
                  },
                )
              : Card(
                  color: context.theme.backgroundColor,
                  child: ListTile(
                    title: Text(" "),
                    textColor: Colors.grey,
                  ),
                )
        ],
      ),
    );
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
  } //add registro(barra)

  _appBar() {
    return AppBar(
      elevation: 0,
      //backgroundColor: context.theme.backgroundColor,
      backgroundColor: Get.isDarkMode ? Color(0xff040f15) : Colors.white,
      leading: GestureDetector(
        //quando a lua for tocada faz:
        onTap: () {
          ThemeService().switchTheme();
          Get.snackbar(
            "De cara nova",
            Get.isDarkMode ? "Light Theme ativado" : "Dark Theme ativado",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Color(0xFFD9CEE0).withOpacity(0.6),
            icon: Icon(
              Icons.anchor_sharp,
              color: Color(0xff071d2a),
            ),
          );
          //notifiHelper.displayNotification(
          //  title: "De cara nova",
          //title: "De cara nova",
          //body: Get.isDarkMode?"Light Theme ativado": "Dark Theme ativado"
          //);
        },
        child: Icon(
            Get.isDarkMode ? Icons.nightlight_round : Icons.wb_sunny_rounded,
            size: 20,
            color: Get.isDarkMode ? Colors.white : Colors.black),
      ),
      actions: [
        Row(
          children: [
            GestureDetector(
              //quando a lua for tocada faz:
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UserPage()),
                );
              },
              child: Icon(Icons.person,
                  size: 25,
                  color: Get.isDarkMode ? Colors.white : Colors.black),
            ),
          ],
        ),
        SizedBox(width: 17),
        Row(
          children: [
            GestureDetector(
              //quando a lua for tocada faz:
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Config()),
                );
              },
              child: Icon(Icons.settings,
                  size: 25,
                  color: Get.isDarkMode ? Colors.white : Colors.black),
            ),
          ],
        ),
        SizedBox(width: 17),
        Row(
          children: [
            GestureDetector(
              //quando a lua for tocada faz:
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Add()),
                );
              },
              child: Icon(Icons.add,
                  size: 25,
                  color: Get.isDarkMode ? Colors.white : Colors.black),
            ),
          ],
        ),
        SizedBox(width: 20),
      ],
    );
  }
}
