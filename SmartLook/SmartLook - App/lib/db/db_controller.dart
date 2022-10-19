import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

Uri url = Uri.https("lacus-8cf38-default-rtdb.europe-west1.firebasedatabase", "/db");
TextEditingController _controller = TextEditingController();
//controllr coloca dps de capturar a imagem
//String url =('https://lacus-8cf38-default-rtdb.europe-west1.firebasedatabase.app/');

void _Post(){
  http.post(url, body: json.encode({"db": _controller.text},));
}

