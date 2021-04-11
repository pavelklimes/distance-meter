import 'package:distance_meter/pages/active_walking.dart';
import 'package:flutter/material.dart';
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
              "Dis/Co",
              style: TextStyle(color: Colors.grey.shade800,),
            ),
            centerTitle: true,
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
                    SizedBox(height: 80,), //TODO: SizedBox upravit podle potřeby a po přidání widgetů.
                    Image.asset("images/app_icon.png", height: 100, width: 100,),
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