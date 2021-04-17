import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'active_walking.dart';

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
          backgroundColor: Colors.limeAccent.shade200,
          title: Padding(
            padding: const EdgeInsets.fromLTRB(35, 0, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children:
              [
                Icon(Icons.settings, color: Colors.grey.shade800, size: 30,),
                Container(padding: const EdgeInsets.all(8.0), child: Text("Nastavení", style: TextStyle(color: Colors.grey.shade800, fontSize: 30, fontWeight: FontWeight.w700),))
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
                padding: const EdgeInsets.fromLTRB(30, 20, 30, 10),
                child: Text(
                  "Zde si vyberte optimální nastavení.\nPokud vám aplikace funguje hůř vyberte si slabší nastavení.",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(height: 45,),
              ButtonTheme(
                minWidth: 140.0,
                height: 60.0,
                child: RaisedButton(
                    onPressed: () {delayTime = 16;showDialog(context: context, builder: (context) => new AlertDialog(title: Text("Aplikace nastavena na 100%"),content:Text("Nyní aplikace zatěžuje 100%."), actions:[FlatButton(child: Text("OK"),onPressed:(){Navigator.pop(context);},)],));},
                    color: Colors.lightGreenAccent,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60),),
                    child: Text("100%", style: TextStyle(fontSize:35,fontWeight:FontWeight.w400,color:Colors.grey.shade800,),),),
              ),
              SizedBox(height: 25,),
              ButtonTheme(
                minWidth: 140.0,
                height: 60.0,
                child: RaisedButton(
                  onPressed: () {delayTime = 20;showDialog(context: context, builder: (context) => new AlertDialog(title: Text("Aplikace nastavena na 75%"),content:Text("Nyní aplikace zatěžuje 75%."), actions:[FlatButton(child: Text("OK"),onPressed:(){Navigator.pop(context);},)],));},
                  color: Colors.lightGreenAccent,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60),),
                  child: Text("75%", style: TextStyle(fontSize:35,fontWeight:FontWeight.w400,color:Colors.grey.shade800,),),),
              ),
              SizedBox(height: 25,),
              ButtonTheme(
                minWidth: 140.0,
                height: 60.0,
                child: RaisedButton(
                  onPressed: () {delayTime = 30;showDialog(context: context, builder: (context) => new AlertDialog(title: Text("Aplikace nastavena na 50%"),content:Text("Nyní aplikace zatěžuje 50%."), actions:[FlatButton(child: Text("OK"),onPressed:(){Navigator.pop(context);},)],));},
                  color: Colors.lightGreenAccent,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60),),
                  child: Text("50%", style: TextStyle(fontSize:35,fontWeight:FontWeight.w400,color:Colors.grey.shade800,),),),
              ),
              SizedBox(height: 65,),
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