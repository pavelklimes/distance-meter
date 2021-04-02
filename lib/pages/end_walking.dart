import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:distance_meter/pages/active_walking.dart';

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


          SizedBox(height: 160,),
          Align(
            alignment: Alignment(-0.51, 0.0),
            child: Text(
              "Doba trvání:",
              style: TextStyle(
                color: Colors.grey[850],
                fontSize: 20,
              ),
            ),
          ),
          Text(
            ourTime,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 47.3,

            ),
          ),


          SizedBox(height: 300.0,), //TODO: SizedBox upravit podle potřeby a po přidání widgetů.
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
