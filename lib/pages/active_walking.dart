import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Active_Walking extends StatefulWidget {
  @override
  _Active_WalkingState createState() => _Active_WalkingState();
}

class _Active_WalkingState extends State<Active_Walking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Image.asset('images/logo.png', fit: BoxFit.cover, height: 120.0, width: 255.0,),
        centerTitle: true,
      ),
      body: Container(
        child: Align(
          alignment: Alignment(-0.0, 0.20),
          child: Column(
            children: <Widget>[
              SizedBox(height: 300.0,),

              //TODO: Sem dopsat údaje: 1. Jak dlouhou aktivita probíha.
              //TODO:                   2. Kolik km je uraženo.

              ButtonTheme(
                  minWidth: 150.0,
                  height: 70.0,
                  child: RaisedButton(
                    onPressed: () {},
                    color: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(60),
                    ),
                    child: Text(
                      "Ukončit",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
