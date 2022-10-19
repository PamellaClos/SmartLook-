import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListApps extends StatefulWidget {
  const ListApps({Key? key}) : super(key: key);

  @override
  State<ListApps> createState() => _ListAppsState();
}

class _ListAppsState extends State<ListApps> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Apps",
        //textStyle:
        ),
      ),
      body: Container(

      ),
    );
  }
}
