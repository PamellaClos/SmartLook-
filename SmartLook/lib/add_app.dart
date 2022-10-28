import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:installed_apps/app_info.dart';
import 'package:installed_apps/installed_apps.dart';
import 'package:pfc/home_page.dart';
import 'package:http/http.dart' as http;



class App extends MaterialApp {
  static List<AppInfo> apps = [];
}

class Add extends StatelessWidget {
  Uri url = Uri.https("lacus-8cf38-default-rtdb.europe-west1.firebasedatabase.app", "/app_selecionado/.json");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      backgroundColor: context.theme.backgroundColor,
      body: FutureBuilder<List<AppInfo>>(
        future: InstalledApps.getInstalledApps(true, true),
        builder:
            (BuildContext buildContext, AsyncSnapshot<List<AppInfo>> snapshot) {
          return snapshot.connectionState == ConnectionState.done
              ? snapshot.hasData
              ? ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  AppInfo app = snapshot.data![index];

               return Card(
                color: Color(0xff0b0826).withOpacity(0.4),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: Image.memory(app.icon!),
                  ),
                  title: Text(app.name!),
                  //subtitle: Text(app.getVersionInfo()),
                  onTap: () =>
                      showDialog(context: context, builder: (BuildContext context) {
                        return AlertDialog(
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text("Proteger esse App?")
                            ],
                          ),
                          actions: [
                            TextButton(
                                onPressed: () {
                                    //_Post();
                                    App.apps.add(app);
                                    http.post(url, body: json.encode({"app_selecionado": app.name}));
                                    http.post(url);
                                    print(App.apps);
                                  Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                      builder: (context) => HomePage(),
                                    ),
                                      (route) => false,
                                  );
                                },
                                child: Text("Sim")),
                            TextButton(
                                onPressed: () {

                                  Navigator.of(context).pop();
                                },
                                child: Text("Não"))
                          ],
                        );
                      }),
                  onLongPress: () =>
                      InstalledApps.openSettings(app.packageName!),
                ),
              );
            },
          )
              : Center(
              child: Text(
                  "Houve um erro ao encontrar os aplicativos instalados!"))
              : Center(child: Text("Trabalhando nisso..."));
        },
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

  void _Post(){
    //http.post(url, body: json.encode({"app_selecionado": ${app.name!}}));
    //http.post(url);
  }
}
