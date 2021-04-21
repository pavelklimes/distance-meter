import 'package:distance_meter/pages/active_walking.dart';
import 'package:flutter/material.dart';
import 'info.dart';
import 'settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

const mainColor = const Color(0xFFbeff19);
int delayTime = 24;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

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
            backgroundColor: mainColor,
            title: new Text(
              "Dis/Co",
              style: TextStyle(color: Colors.grey.shade800, fontWeight: FontWeight.w600),
            ),
            centerTitle: true,
            actions: [
              IconButton(
                icon: Icon(Icons.settings, color: Colors.grey.shade700),
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) =>
                          Settings()), (Route<dynamic> route) => false);
                },
              ),
            ],
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: Icon(Icons.info_outline, color: Colors.grey.shade700,),
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) =>
                            Info()), (Route<dynamic> route) => false);
                  },
                  //tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
                );
              },
            ),
          ),

          body: SingleChildScrollView(
            child: Container(
              child: Align(
                alignment: Alignment(-0.0, 0.20),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 210.0,),
                    ButtonTheme(
                        minWidth: 150.0,
                        height: 70.0,
                        child: RaisedButton(

                          onPressed: () {
                            setState(() {
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(builder: (context) =>
                                      Active_Walking()), (
                                  Route<dynamic> route) => false);
                            });
                          },

                          color: mainColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(60),
                          ),
                          child: Text(
                            "Start",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[850],
                              fontSize: 30.0,
                            ),
                          ),
                        )
                    ),
                    SizedBox(height: 80,),
                    //TODO: SizedBox upravit podle potřeby a po přidání widgetů.
                    Image.asset(
                      "images/app_icon.png", height: 100, width: 100,),
                    Image.asset(
                      "images/watermarks/watermark.png",
                      height: 100, width: 250,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }
  }