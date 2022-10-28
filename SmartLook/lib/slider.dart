import 'package:flutter/material.dart';


class SliderPage extends StatelessWidget {
  final String title;
  final String description;
  final String image;
  final String hello;

  SliderPage({required this.title,required this.hello, required this.description, required this.image});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      color: Color(0xff040f15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          //SvgPicture.asset(
            //image,
            //width: width * 0.6,
          //),
          SizedBox(
            height: 70,
          ),
          Text(
            title,
            style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold, color: Color(0xffe4e0e8)),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            hello,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xffe4e0e8)),
          ),
          SizedBox(
            height: 10,
          ),
          //Image(image: AssetImage('assets/images/iris.png'), width: 250),
         //SizedBox(
            //height: 120,
         // ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80),
            child: Text(
              description,
              style: TextStyle(
                height: 1.5,
                fontWeight: FontWeight.normal,
                fontSize: 12,
                letterSpacing: 0.7,
                  color: Color(0xffe4e0e8)
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 60,
          ),
        ],
      ),
    );
  }
}