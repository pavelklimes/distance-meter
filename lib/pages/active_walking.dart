import 'package:distance_meter/loading_icons.dart';
import 'package:flutter/material.dart';
import 'package:distance_meter/pages/end_walking.dart';
import 'package:flutter/rendering.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:geolocator/geolocator.dart';
import 'package:distance_meter/pages/home.dart';
import 'dart:async';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const mainColor = const Color(0xFFbeff19);

final StopWatchTimer _stopWatchTimer = StopWatchTimer();

int aimingTime = delayTime ~/ 2;

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

    count_distance();

  }

  void showAlert(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          Future.delayed(Duration(seconds: aimingTime), () {
            Navigator.of(context).pop(true);
          });
          return AlertDialog(
            title: Text("Zaměřování", style: TextStyle(fontWeight: FontWeight.w400),),
            content: Text("Probíhá zaměřování vaší lokace. Počkejte ${aimingTime} sekund.", style: TextStyle(fontWeight: FontWeight.w300)),
            actions: [
              Row (
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(100, 5, 100, 15),
                      child: SpinKitRing(
                        color: mainColor,
                        size: 50.0,
                      ),
                    ),
                  ]
              )
            ],
          );
        });
  }

  void count_distance() async {
    print("******* count_distance() was start*******");
    // variables, what count_distance need
    double distanceBetween_points = 0.0; // This must be 0.0 on start of while(pageIs_open)
    Position positionPoint1 = null; // First Location
    Position positionPoint2 = null; // Second Location
    Position positionAiming = null; // Aiming Location: This is for setup GPS

    Future.delayed(Duration.zero, () => showAlert(context));

    for(int howMany_runs = 0; howMany_runs < 3; howMany_runs++) {
      positionAiming = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.bestForNavigation);
      Future.delayed(Duration(seconds: aimingTime), () {
        // Nothing to do here
      });
    }

    while(pageIs_open) {
      print("****** while(pageIs_open) was start ******");
      _stopWatchTimer.onExecute.add(StopWatchExecute.start);
      distanceBetween_points = 0.0;
      // This will be when while(pageIs_open) is running on first time
      if(positionPoint2 == null) {
        positionPoint1 = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.bestForNavigation);
        print("****** Position Point 1: $positionPoint1 ******");
      }
      // This will be when while(pageIs_open) is running on second time and above
      else {
        positionPoint1 = positionPoint2;
        print("****** Position Point 1: $positionPoint1 ******");
      }
      positionPoint2 = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.bestForNavigation);
      print("****** Position Point 2: $positionPoint2 ******");
      if(distanceBetween_points == 0.0) {
        distanceBetween_points = Geolocator.distanceBetween(
          positionPoint1.latitude,
          positionPoint1.longitude,
          positionPoint2.latitude,
          positionPoint2.longitude,
        );
        print("****** Distance Between is: $distanceBetween_points******");

        setState(() {
          total_distance += distanceBetween_points;
        });

        print("****** Total Distance is: $total_distance******");
        // Delay 1.
        print("****** Waiting for delay 1. ******");
        await Future.delayed(Duration(seconds: delayTime), () {
          print("****** delay 1. started ******");
        }); // End of: Delay 1.
      } // End of: if(distanceBetween_points == 0.0)
    } // End of: while(pageIs_open)


  } // End of: void count_distance()


  final _isHours = true;

  @override
  void dispose() {
    super.dispose();
    _stopWatchTimer.dispose();
  }

  Future<bool> _onBackPressed() {
    Future<bool> a;
    return a;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: mainColor,
          automaticallyImplyLeading: false,
          title: Text("Měřič", style: TextStyle(color: Colors.grey[800], fontWeight: FontWeight.w300),),
          centerTitle: true,
        ),

        body: SingleChildScrollView(
          child: Container(
            child: Align(
              alignment: Alignment(-0.0, 0.20),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 35.0,), //TODO: SizedBox upravit podle potřeby a po přidání widgetů.

                  Image.asset(
                    "images/runboy.gif",
                    height: 75.0,
                    width: 75.0,
                  ),

                  SizedBox(height: 35.0,), //TODO: SizedBox upravit podle potřeby a po přidání widgetů.

                  StreamBuilder<int>(
                      stream: _stopWatchTimer.rawTime,
                      initialData: _stopWatchTimer.rawTime.value,
                      builder: (context, snapshot) {
                        final value = snapshot.data;
                        final displayTime = StopWatchTimer.getDisplayTime(
                            value, minute: _isHours);
                        return Text(
                            displayTime,
                            style: const TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.w200,
                            )
                        );
                      }
                  ),

                  SizedBox(height: 20,), //TODO: SizedBox upravit podle potřeby a po přidání widgetů.

                  Text(
                    '${total_distance != null ? total_distance > 1000 ? (total_distance / 1000).toStringAsFixed(1) : total_distance.toStringAsFixed(1) : 0} ${total_distance != null ? total_distance > 1000 ? 'km' : 'metrů' : 0}',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w300,
                      fontSize: 50,


                    ),
                  ),

                  SizedBox(height: 60.0,), //TODO: SizedBox upravit podle potřeby a po přidání widgetů.
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
                            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                                End_Walking()), (Route<dynamic> route) => false);
                          });
                        },

                        color: Colors.red[400],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(60),
                        ),
                        child: Text(
                          "UKONČIT",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.grey[100],
                            fontSize: 20,
                          ),
                        ),
                      )
                  ),
                  SizedBox(height: 70,), //TODO: SizedBox upravit podle potřeby a po přidání widgetů.
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