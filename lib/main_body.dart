import 'package:flutter/material.dart';

Widget _get_appbar() => AppBar(
  backgroundColor: Colors.yellow[700],
  title: Text("Programming Quiz"),
  centerTitle: true,
);

Widget main_body({Widget body:null}){
  return Scaffold(
    appBar: _get_appbar(),
    backgroundColor: Colors.yellow[300],
    body: body,
  );
}


