import 'package:distance_meter/pages/active_walking.dart';
import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';



class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override

  @override
  void initState() {
    super.initState();
   // Phoenix.rebirth(context);
  }

  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.limeAccent.shade200,
        title: Text(
          "Distance meter",
          style: TextStyle(color: Colors.grey.shade800,),
        ),
        centerTitle: true,
      ),
      body: Container(
        child: Align(
          alignment: Alignment(-0.0, 0.20),
          child: Column(
            children: <Widget>[
              SizedBox(height: 270.0,),
              ButtonTheme(
                  minWidth: 150.0,
                  height: 70.0,
                  child: RaisedButton(

                    onPressed: () {
                      setState(() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Active_Walking()),
                        );
                      });
                    },

                    color: Colors.limeAccent[400],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(60),
                    ),
                    child: Text(
                      "Start",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[800],
                        fontSize: 20.0,
                      ),
                    ),
                  )
              ),
              SizedBox(height: 100,), //TODO: SizedBox upravit podle potřeby a po přidání widgetů.
              Image.asset(
                "images/watermarks/watermark.png",
                height: 100, width: 250,
              ),
            ],
          ),
        ),
      ),
    );
  }
}