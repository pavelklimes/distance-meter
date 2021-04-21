import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home.dart';
import 'package:after_layout/after_layout.dart';

const mainColor = const Color(0xFFbeff19);

class Splash extends StatefulWidget {
  @override
  SplashState createState() => new SplashState();
}

Future<bool> _onBackPressed() {
  Future<bool> a;
  return a;
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
    return WillPopScope(
      onWillPop: _onBackPressed,
        child: Scaffold(
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
        ),
    );
  }
}

class IntroScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: mainColor,
          title: Padding(
            padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
            child: Text(
                "Vítejte",
                style: TextStyle(color: Colors.grey.shade800,),
              ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(140, 40, 120, 0),
                child: Image.asset("images/logo.png", width: 100, height: 100,),
              ),
              Center(child: Image.asset("images/wlcm.jpg"))
            ],
          ),
        ),
        floatingActionButton: Container(
          height: 70,
          width: 70,
          child: FloatingActionButton(
            onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                  Home()), (Route<dynamic> route) => false);

            },
            backgroundColor: mainColor,
            child: Icon(Icons.arrow_forward, color: Colors.grey.shade800, size: 35,),
          ),
        ),
      ),
    );
  }
}