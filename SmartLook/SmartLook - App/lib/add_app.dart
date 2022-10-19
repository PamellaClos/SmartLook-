import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:installed_apps/app_info.dart';
import 'package:installed_apps/installed_apps.dart';
import 'package:pfc/home_page.dart';

import 'appProtegido.dart';

class App extends MaterialApp {
}


class Add extends StatelessWidget {
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
                color: Color(0xFF3F3F42).withOpacity(0.4),
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
                                  AppInform.apps.add(app);
                                  print(AppInform.apps);
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
}
