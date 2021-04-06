import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:distance_meter/pages/active_walking.dart';
import 'package:distance_meter/main.dart';
import 'package:distance_meter/pages/home.dart';

Future<bool> _onBackPressed() {
  Future<bool> a;
  return a;
}

class End_Walking extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.limeAccent[200],
          automaticallyImplyLeading: false,
          title: Text("Konec aktivity", style: TextStyle(color: Colors.grey[800]),),
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[


            SizedBox(height: 100,),
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
            SizedBox(height: 20,),

            Align(
              alignment: Alignment(-0.51, 0.0),
              child: Text(
                "Délka trasy:",
                style: TextStyle(
                  color: Colors.grey[850],
                  fontSize: 20,
                ),
              ),
            ),
            Text(
              "${total_distance.roundToDouble()}",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.normal,
                fontSize: 47.3,

              ),
            ),

            SizedBox(height: 50,),

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

                        total_distance = 0.0;

                        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                            Home()), (Route<dynamic> route) => false);

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


            SizedBox(height: 53,), //TODO: SizedBox upravit podle potřeby a po přidání widgetů.
            Align(
              alignment: Alignment(-0.0, 0.0),
              child: Image.asset(
                "images/watermarks/watermark.png",
                height: 100, width: 250,
              ),
            )
          ],
        ),
      ),
    );
  }
}