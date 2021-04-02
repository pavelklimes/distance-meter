import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home.dart';
import 'package:after_layout/after_layout.dart';

import 'home.dart';


class Splash extends StatefulWidget {
  @override
  SplashState createState() => new SplashState();
}

class SplashState extends State<Splash> with AfterLayoutMixin<Splash> {
  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);

    if (_seen) {
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new Home()));
    } else {
      await prefs.setBool('seen', true);
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new IntroScreen()));
    }
  }

  @override
  void afterFirstLayout(BuildContext context) => checkFirstSeen();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Text(""),
    );
  }
}

class IntroScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.limeAccent.shade200,
        title: Text(
          "Vítejte",
          style: TextStyle(color: Colors.grey.shade800,),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(145, 40, 135, 0),
            child: Image.asset("images/logo.png", width: 120, height: 120,),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 50, 0, 0),
            child: Text("Vítejte,", style: TextStyle(fontSize: 50),),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(50, 0, 50, 0)),
            Text(
              "Děkujeme za stažení naší aplikace, na měření uražené vzdálenosti",
              style: TextStyle(
              fontSize: 20,
              ),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home()),
            );
        },
        backgroundColor: Colors.limeAccent.shade200,
        child: Icon(Icons.arrow_forward, color: Colors.grey.shade800,),
      ),
    );
  }
}