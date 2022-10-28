import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../theme.dart';


class MyButtonTerms extends StatelessWidget {
  final String label;
  final Function()? onTap;
  const MyButtonTerms({Key? key, required this.label, required this.onTap}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(left: 75),
        width: 185,
        height: 55,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),

        ),
        child:
        Container(
          margin: const EdgeInsets.only(top: 20, left: 30),
          child: Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
}


