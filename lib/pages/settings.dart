import 'package:distance_meter/activity_icons_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'active_walking.dart';

const mainColor = const Color(0xFFbeff19);

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

Future<bool> _onBackPressed() {
  Future<bool> a;
  return a;
}

class _SettingsState extends State<Settings> {

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          iconTheme: IconThemeData(color: Colors.grey.shade800),
          backgroundColor: mainColor,
          title: Padding(
            padding: const EdgeInsets.all(25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children:
              [
                Icon(Icons.settings, color: Colors.grey.shade800, size: 30,),
                Container(padding: const EdgeInsets.all(8.0), child: Text("Nastavení", style: TextStyle(color: Colors.grey.shade800, fontSize: 30, fontWeight: FontWeight.w600),))
              ],
            ),
          ),
          centerTitle: true,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: Icon(Icons.home_outlined, color: Colors.grey.shade700,),
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                      Home()), (Route<dynamic> route) => false);
                },
                //tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  "Zde si vyberte optimální nastavení.\nPokud vám aplikace funguje hůř vyberte si slabší nastavení.",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300
                  ),
                ),
              ),
              SizedBox(height: 45,),
              ButtonTheme(
                minWidth: 140.0,
                height: 60.0,
                child: RaisedButton(
                    onPressed: () {delayTime = 24;showDialog(context: context, builder: (context) => new AlertDialog(title: Text("Aplikace nastavena na 100%"),content:Text("Nyní aplikace zatěžuje 100%."), actions:[FlatButton(child: Text("OK"),onPressed:(){Navigator.pop(context);},)],));},
                    color: Colors.lightGreenAccent,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60),),
                    child: Icon(ActivityIcons.directions_bike, size: 35,)),
              ),
              SizedBox(height: 25,),
              ButtonTheme(
                minWidth: 140.0,
                height: 60.0,
                child: RaisedButton(
                  onPressed: () {delayTime = 30;showDialog(context: context, builder: (context) => new AlertDialog(title: Text("Aplikace nastavena na 75%"),content:Text("Nyní aplikace zatěžuje 75%."), actions:[FlatButton(child: Text("OK"),onPressed:(){Navigator.pop(context);},)],));},
                  color: Colors.lightGreenAccent,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60),),
                  child: Icon(ActivityIcons.directions_run, size: 35,)),
              ),
              SizedBox(height: 25,),
              ButtonTheme(
                minWidth: 140.0,
                height: 60.0,
                child: RaisedButton(
                  onPressed: () {delayTime = 40;showDialog(context: context, builder: (context) => new AlertDialog(title: Text("Aplikace nastavena na 50%"),content:Text("Nyní aplikace zatěžuje 50%."), actions:[FlatButton(child: Text("OK"),onPressed:(){Navigator.pop(context);},)],));},
                  color: Colors.lightGreenAccent,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60),),
                  child: Icon(ActivityIcons.directions_walk, size: 35,)),
              ),
              SizedBox(height: 75,),
              Image.asset(
                "images/watermarks/watermark.png",
                height: 100, width: 250,
              ),
        ]),
      ),
    ),
    );
  }
}