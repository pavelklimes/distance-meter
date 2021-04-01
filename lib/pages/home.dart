import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue,
        title: Image.asset('images/logo.png', fit: BoxFit.cover, height: 120.0, width: 255.0,),
        centerTitle: true,
        //TODO: Sem přidej co dalšího chceš v appbaru
      ),
      body: Container()
    );
  }
}
