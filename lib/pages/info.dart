import 'package:flutter/material.dart';
import 'home.dart';

class Info extends StatefulWidget {
  @override
  _InfoState createState() => _InfoState();
}

class _InfoState extends State<Info> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [


            //////////
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 30, 0, 0),
              child: Text("Zde se objevuje nadpis.", style: TextStyle(fontSize: 26, decoration: TextDecoration.underline),),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 2, 30, 0),
              child: Text("Zde se objevuje text. Zde se objevuje text. Zde se objevuje text. Zde se objevuje text. Zde se objevuje text. ", style: TextStyle(fontSize: 16,)),
            ),



            //////////
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 30, 0, 0),
              child: Text("Zde se objevuje nadpis.", style: TextStyle(fontSize: 26, decoration: TextDecoration.underline),),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 2, 30, 0),
              child: Text("Zde se objevuje text. Zde se objevuje text. Zde se objevuje text. Zde se objevuje text. Zde se objevuje text. ", style: TextStyle(fontSize: 16,)),
            ),


            //////////
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 30, 0, 0),
              child: Text("Zde se objevuje nadpis.", style: TextStyle(fontSize: 26, decoration: TextDecoration.underline),),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 2, 30, 0),
              child: Text("Zde se objevuje text. Zde se objevuje text. Zde se objevuje text. Zde se objevuje text. Zde se objevuje text. ", style: TextStyle(fontSize: 16,)),
            ),


            //////////
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 30, 0, 0),
              child: Text("Zde se objevuje nadpis.", style: TextStyle(fontSize: 26, decoration: TextDecoration.underline),),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 2, 30, 0),
              child: Text("Zde se objevuje text. Zde se objevuje text. Zde se objevuje text. Zde se objevuje text. Zde se objevuje text. ", style: TextStyle(fontSize: 16,)),
            ),


            //////////
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 30, 0, 0),
              child: Text("Zde se objevuje nadpis.", style: TextStyle(fontSize: 26, decoration: TextDecoration.underline),),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 2, 30, 0),
              child: Text("Zde se objevuje text. Zde se objevuje text. Zde se objevuje text. Zde se objevuje text. Zde se objevuje text. ", style: TextStyle(fontSize: 16,)),
            ),


            //////////
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 30, 0, 0),
              child: Text("Zde se objevuje nadpis.", style: TextStyle(fontSize: 26, decoration: TextDecoration.underline),),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 2, 30, 0),
              child: Text("Zde se objevuje text. Zde se objevuje text. Zde se objevuje text. Zde se objevuje text. Zde se objevuje text. ", style: TextStyle(fontSize: 16,)),
            ),


            //////////
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 30, 0, 0),
              child: Text("Zde se objevuje nadpis.", style: TextStyle(fontSize: 26, decoration: TextDecoration.underline),),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 2, 30, 0),
              child: Text("Zde se objevuje text. Zde se objevuje text. Zde se objevuje text. Zde se objevuje text. Zde se objevuje text. ", style: TextStyle(fontSize: 16,)),
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
    );
  }
}
