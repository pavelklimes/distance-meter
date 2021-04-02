import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:distance_meter/pages/active_walking.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:distance_meter/main.dart';
import 'package:distance_meter/pages/home.dart';

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
              fontWeight: FontWeight.normal,
              fontSize: 47.3,

            ),
          ),
          SizedBox(height: 100,),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonTheme(
                  minWidth: 125.0,
                  height: 60.0,
                  child: RaisedButton(

                    onPressed: () {},

                    color: Colors.lightGreenAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(60),
                    ),
                    child: Text(
                      "Screenshot",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[850],
                        fontSize: 21,
                      ),
                    ),
                  )
              ),
              SizedBox(width: 25,),
              ButtonTheme(
                  minWidth: 140.0,
                  height: 60.0,
                  child: RaisedButton(

                    onPressed: () {

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Home()),
                        );
                    },

                    color: Colors.greenAccent[400],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(60),
                    ),
                    child: Text(
                      "Home",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[850],
                        fontSize: 21,
                      ),
                    ),
                  )
              ),
            ],
          ),


          SizedBox(height: 41.8,), //TODO: SizedBox upravit podle potřeby a po přidání widgetů.
          Align(
            alignment: Alignment(-0.0, 0.0),
            child: Image.asset(
              "images/watermarks/watermark.png",
              height: 100, width: 250,
            ),
          )
        ],
      ),
    );
  }
}
