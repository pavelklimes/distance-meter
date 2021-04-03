import 'package:flutter/material.dart';
import 'home.dart';

class Info extends StatefulWidget {
  @override
  _InfoState createState() => _InfoState();
}

class _InfoState extends State<Info> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Image.asset('images/logo.png', fit: BoxFit.cover, height: 120.0, width: 255.0,),
        centerTitle: true,
      ),
      body: Container(
        height: 70,
        width: 70,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home()),
            );

          },
          backgroundColor: Colors.white,
          child: Icon(Icons.arrow_forward, color: Colors.grey.shade200, size: 35,),
        ),
      ),
    );
  }
}
