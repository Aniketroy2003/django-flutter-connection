import 'package:flutter/material.dart';

AppBar customAppBar(){
  return AppBar(
    title: const Text("Django Todos"),
    elevation: 0.0,
    titleTextStyle: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.white,),
    backgroundColor: const Color(0xff001133),
  );
}