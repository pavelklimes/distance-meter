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


Position _currentPosition;
Position _previousPosition;
StreamSubscription<Position> _positionStream;
double _totalDistance = 0;

List<Position> locations = List<Position>();




class Active_Walking extends StatefulWidget {
  @override
  _Active_WalkingState createState() => _Active_WalkingState();
}

class _Active_WalkingState extends State<Active_Walking> {

  @override
  void initState() {
    super.initState();
    _stopWatchTimer.onExecute.add(StopWatchExecute.start);
    _calculateDistance();
  }


  Future _calculateDistance() async {
    _positionStream = Geolocator.getPositionStream(
        distanceFilter: 10, desiredAccuracy: LocationAccuracy.best)
        .listen((Position position) async {
      if ((await Geolocator.isLocationServiceEnabled())) {
        Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
            .then((Position position) {
          setState(() {
            _currentPosition = position;
            locations.add(_currentPosition);

            if (locations.length > 1) {
              _previousPosition = locations.elementAt(locations.length - 2);

              var _distanceBetweenLastTwoLocations = Geolocator.distanceBetween(
                _previousPosition.latitude,
                _previousPosition.longitude,
                _currentPosition.latitude,
                _currentPosition.longitude,
              );
              _totalDistance += _distanceBetweenLastTwoLocations;
              print('Total Distance: $_totalDistance');
            }
          });
        }).catchError((err) {
          print(err);
        });
      } else {
        print("GPS is off.");
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                content: const Text('Make sure your GPS is on in Settings !'),
                actions: <Widget>[
                  FlatButton(
                      child: Text('OK'),
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true).pop();
                      })
                ],
              );
            });
      }
    });
  }




  final _isHours = true;

  @override
  void dispose() {
    super.dispose();
    _stopWatchTimer.dispose();
    _positionStream.cancel();
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

              Text(
                  'Distance: ${_totalDistance != null ? _totalDistance > 1000 ? (_totalDistance / 1000).toStringAsFixed(2) : _totalDistance.toStringAsFixed(2) : 0} ${_totalDistance != null ? _totalDistance > 1000 ? 'KM' : 'meters' : 0}'
              ),

              SizedBox(height: 130.0,),
              ButtonTheme(
                  minWidth: 150.0,
                  height: 70.0,
                  child: RaisedButton(

                    onPressed: () {
                      ourTime = get_time();

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