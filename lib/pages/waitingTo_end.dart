import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class End_Loading extends StatefulWidget {

  @override
  _End_Loading createState() => _End_Loading();
}

Future<bool> _onBackPressed() {
  Future<bool> a;
  return a;
}

class _End_Loading extends State<End_Loading> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        exit(0);
      });

    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        backgroundColor: Colors.limeAccent.shade200,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(0, 300, 0, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SpinKitThreeBounce(
                color: Colors.red,
                size: 50.0,
              ),
              Image.asset(
                "images/logo_full.png",
                height: 200, width: 200,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
