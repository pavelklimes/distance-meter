import 'package:flutter/material.dart';

class End_Walking extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.limeAccent[200],
        automaticallyImplyLeading: false,
        title: Text("Konec aktivity", style: TextStyle(color: Colors.grey[800]),),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          SizedBox(height: 570.0,), //TODO: SizedBox upravit podle potřeby a po přidání widgetů.
          Align(
            alignment: Alignment(-0.0, 0.0),
            child: Image.asset(
              "images/watermarks/watermark.png",
              height: 100, width: 250,
            ),
          )
        ],
      ),
    );;
  }
}
