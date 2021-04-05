import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home.dart';
import 'package:after_layout/after_layout.dart';



class Splash extends StatefulWidget {
  @override
  SplashState createState() => new SplashState();
}

class SplashState extends State<Splash> with AfterLayoutMixin<Splash> {
  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);

    if (_seen) {
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
          Home()), (Route<dynamic> route) => false);
    } else {
      await prefs.setBool('seen', true);
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
          IntroScreen()), (Route<dynamic> route) => false);
    }
  }

  @override
  void afterFirstLayout(BuildContext context) => checkFirstSeen();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
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
            padding: const EdgeInsets.fromLTRB(140, 40, 120, 0),
            child: Image.asset("images/logo.png", width: 100, height: 100,),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 30, 0, 8),
            child: Text("Vítejte,", style: TextStyle(fontSize: 30),),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
            child: Text("Děkujeme za stažení naší aplikace pro", style: TextStyle(fontSize: 18,),),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Text("měření uražené vzdálenosti.", style: TextStyle(fontSize: 18,),),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 10, 0, 0),
            child: Text("V případě potřeby je návod v levém horním", style: TextStyle(fontSize: 18,),),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
            child: Text("rohu na domovské stránce, ke které se", style: TextStyle(fontSize: 18,),),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
            child: Text("dostanete kliknutím na tlačítko.", style: TextStyle(fontSize: 18,),),
          ),

        ],
      ),
      floatingActionButton: Container(
        height: 70,
        width: 70,
        child: FloatingActionButton(
          onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                Home()), (Route<dynamic> route) => false);

          },
          backgroundColor: Colors.limeAccent.shade200,
          child: Icon(Icons.arrow_forward, color: Colors.grey.shade800, size: 35,),
        ),
      ),
    );
  }
}