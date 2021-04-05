import 'package:distance_meter/pages/active_walking.dart';
import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'info.dart';



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

  Future<bool> _onBackPressed() {
    Future<bool> a;
    return a;
  }

  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        appBar: new AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.limeAccent.shade200,
          title: new Text(
            "Distance Meter",
            style: TextStyle(color: Colors.grey.shade800,),
          ),
          centerTitle: true,
          //iconTheme: IconThemeData(color: Colors.grey.shade800,),
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: Icon(Icons.info_outline, color: Colors.grey.shade700,),
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                      Info()), (Route<dynamic> route) => false);
                },
                //tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
        ),


        /*
        //side menu
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                padding: EdgeInsets.zero,
                child: Container(
                  color: Colors.limeAccent.shade200,
                  child: Center(
                    child: Text(
                      "Menu",
                      style: TextStyle(
                        fontSize: 70,
                        fontWeight: FontWeight.w500,
                        //decoration:  TextDecoration.underline,
                        fontStyle: FontStyle.italic,
                        color: Colors.deepOrange.shade900,
                      ),
                    ),
                  ),
                ),
              ),
              ListTile(
                title: Padding(
                  padding: const EdgeInsets.fromLTRB(5, 5, 0, 0),
                  child: Text(
                    "Info",
                    style: TextStyle(
                      color: Colors.grey.shade800,
                      fontSize: 50,
                      fontWeight: FontWeight.w300
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(context, MaterialPageRoute(
                      builder: (BuildContext context) => Info()
                  ));
                },
              ),
              SizedBox(height: 290,),
              Image.asset(
                    "images/logo_inline.png",
                  width: 245, height: 65,
                ),
            ],
          ),
        ),
        */

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
                          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                              Active_Walking()), (Route<dynamic> route) => false);
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
      ),
    );
  }
}