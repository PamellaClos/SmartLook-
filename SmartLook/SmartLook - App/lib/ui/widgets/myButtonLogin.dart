import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../theme.dart';


class MyButtonLogin extends StatelessWidget {
  final String label;
  final Function()? onTap;
  const MyButtonLogin({Key? key, required this.label, required this.onTap}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 125,
        height: 55,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: button
        ),
        child:
        Container(
          margin: const EdgeInsets.only(top: 20),
          child: Text(
            label,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}


