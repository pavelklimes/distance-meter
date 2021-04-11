import 'package:flutter/material.dart';
import 'home.dart';

class Info extends StatefulWidget {
  @override
  _InfoState createState() => _InfoState();
}

Future<bool> _onBackPressed() {
  Future<bool> a;
  return a;
}

class _InfoState extends State<Info> {
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
            padding: const EdgeInsets.fromLTRB(60, 0, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children:
              [
                Icon(Icons.info, color: Colors.grey.shade800, size: 30,),
                Container(padding: const EdgeInsets.all(8.0), child: Text("info", style: TextStyle(color: Colors.grey.shade800, fontSize: 30, fontWeight: FontWeight.w700),))
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [


              //////////
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 30, 0, 0),
                child: Text("K čemu je aplikace určena?", style: TextStyle(fontSize: 26, decoration: TextDecoration.underline),),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 2, 30, 0),
                child: Text("Aplikace Dis/Co - Distance Counter slouží, pro měření uražené vzdálenosti. Při využití aplikace se předpokládají aktivity, které vyžadují fyzickou aktivitu (chůze, běh, cyklistika, apod.)", style: TextStyle(fontSize: 16,)),
              ),



              //////////
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 30, 0, 0),
                child: Text("Jak aplikaci využívat?", style: TextStyle(fontSize: 26, decoration: TextDecoration.underline),),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 2, 30, 0),
                child: Text("Na domovské stránce je tlačítko [Start], po kterém se začne měřit uražená vzdálenost. Informace o měření se vypisují i během měření. Pro ukončení, stačí kliknout tlačítko [Ukončit]. Poté se vypíšou informace o měření. Na stránce s informacemi jsou tlačítka [Screeshot] a [Ukončit]. [Screenshot] pořídí snímek obrazovky a uloží ho do mobilního telefonu. [Ukončit] vám ukončí aplikaci.", style: TextStyle(fontSize: 16,)),
              ),


              //////////
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 30, 0, 0),
                child: Text("Autoři", style: TextStyle(fontSize: 26, decoration: TextDecoration.underline),),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 2, 30, 0),
                child: Text("Jindřich Klimeš,\nPavel Klimeš\n________________\nKlimes Systems", style: TextStyle(fontSize: 16,)),
              ),


              //////////
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 30, 0, 0),
                child: Text("Kontakt", style: TextStyle(fontSize: 26, decoration: TextDecoration.underline),),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 2, 30, 0),
                child: Text("Jindřich Klimeš:\nE-MAIL: henryklimes@protonmail.com\nTwitter: @henryklimes\n\nPavel Klimeš:\nE-MAIL: klimespavel@protonmail.com\nTwitter: @pavelklimes_", style: TextStyle(fontSize: 16,)),
              ),

              SizedBox(height: 30,),

              Center(
                child: Image.asset(
                  "images/logo_full.png",
                  height: 200, width: 200,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
