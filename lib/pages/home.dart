import 'package:distance_meter/pages/active_walking.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
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
      body: Padding(
        padding: const EdgeInsets.fromLTRB(120, 280, 120, 50),
        child: Column(
          children: [
            ButtonTheme(
                minWidth: 180.0,
                height: 80.0,
                child: RaisedButton(

                  onPressed: () {
                    //TODO: Dodělat ukončení měření

                    setState(() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Active_Walking()),
                      );
                    });
                  },

                  color: Colors.limeAccent.shade700,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(60),
                  ),
                  child: Text(
                    "Start",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[100],
                      fontSize: 30,
                    ),
                  ),
                )
            ),
            SizedBox(height: 0,),
            Image.asset(
              "images/watermarks/watermark.png",
              height: 100, width: 250,
            ),
          ],
        ),
      ),
    );
  }
}
