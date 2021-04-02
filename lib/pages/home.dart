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
        backgroundColor: Colors.limeAccent.shade200,
        title: Text(
          "Distance meter",
          style: TextStyle(color: Colors.grey.shade800,),
        ),
        centerTitle: true,
      ),
      body: Column(

      ),
    );
  }
}
