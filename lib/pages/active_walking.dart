import 'package:flutter/material.dart';
import 'package:distance_meter/pages/end_walking.dart';
import 'package:flutter/rendering.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:distance_meter/pages/home.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';

final StopWatchTimer _stopWatchTimer = StopWatchTimer();

var ourTime;
dynamic get_time() {
  var time = StopWatchTimer.getDisplayTime(_stopWatchTimer.rawTime.value);
  print(time);
  return time;
}

// Globals variables for distance counting
double total_distance = 0.0;
bool pageIs_open = true;


class Active_Walking extends StatefulWidget {
  @override
  _Active_WalkingState createState() => _Active_WalkingState();
}

class _Active_WalkingState extends State<Active_Walking> {

  @override
  void initState() {
    super.initState();
    _stopWatchTimer.onExecute.add(StopWatchExecute.start);
    if(pageIs_open) {
      print("******* if was start*******");
      count_distance();
    }
  }

  void count_distance() async {
    print("******* count_distance() was start*******");
    Position positionPoint1;
    positionPoint1 = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    Future.delayed(Duration(seconds: 10), () async {
      print("******* delay 1.*******");
      Position positionPoint2;
      positionPoint2 = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      double distanceBetween_points = Geolocator.distanceBetween(
        positionPoint1.latitude,
        positionPoint1.longitude,
        positionPoint2.latitude,
        positionPoint2.longitude,
      );
      total_distance += distanceBetween_points;
      Future.delayed(Duration(seconds: 10), () {
        print("******* delay 2.*******");
      });
    });
  }


  final _isHours = true;

  @override
  void dispose() {
    super.dispose();
    _stopWatchTimer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.limeAccent[200],
        automaticallyImplyLeading: false,
        title: Text("Měřič", style: TextStyle(color: Colors.grey[800]),),
        centerTitle: true,
      ),

      body: Container(
        child: Align(
          alignment: Alignment(-0.0, 0.20),
          child: Column(
            children: <Widget>[
              SizedBox(height: 170.0,),
              //TODO: SizedBox upravit podle potřeby a po přidání widgetů.


              StreamBuilder<int>(
                  stream: _stopWatchTimer.rawTime,
                  initialData: _stopWatchTimer.rawTime.value,
                  builder: (context, snapshot) {
                    final value = snapshot.data;
                    final displayTime = StopWatchTimer.getDisplayTime(
                        value, hours: _isHours);
                    return Text(
                        displayTime,
                        style: const TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                        )
                    );
                  }
              ),



              SizedBox(height: 130.0,),
              ButtonTheme(
                  minWidth: 150.0,
                  height: 70.0,
                  child: RaisedButton(

                    onPressed: () {
                      ourTime = get_time();

                      print(total_distance);

                      pageIs_open = false;

                      _stopWatchTimer.onExecute.add(StopWatchExecute.reset);

                      setState(() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>
                              End_Walking()),
                        );
                      });
                    },

                    color: Colors.red[400],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(60),
                    ),
                    child: Text(
                      "Ukončit",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[100],
                        fontSize: 21,
                      ),
                    ),
                  )
              ),
              SizedBox(height: 22.8,),
              //TODO: SizedBox upravit podle potřeby a po přidání widgetů.
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