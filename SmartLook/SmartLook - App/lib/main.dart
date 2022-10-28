import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pfc/services/theme_services.dart';
import 'package:pfc/ui/login_page.dart';
import 'package:pfc/ui/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'SmartLook',
        debugShowCheckedModeBanner: false,

        theme: Themes.dark,
        darkTheme: Themes.light,
        themeMode: ThemeService().theme,

        home: Landing()
    );
  }
}

