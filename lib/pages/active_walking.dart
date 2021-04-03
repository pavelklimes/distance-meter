import 'package:flutter/material.dart';
import 'package:distance_meter/pages/end_walking.dart';
import 'package:flutter/rendering.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:distance_meter/pages/home.dart';
import 'package:geolocator/geolocator.dart';


final StopWatchTimer _stopWatchTimer = StopWatchTimer();

var ourTime;
dynamic get_time() {
  var time = StopWatchTimer.getDisplayTime(_stopWatchTimer.rawTime.value);
  print(time);
  return time;


}

var distance;



class Active_Walking extends StatefulWidget {
  @override
  _Active_WalkingState createState() => _Active_WalkingState();
}

class _Active_WalkingState extends State<Active_Walking> {

  @override
  void initState() {
    super.initState();
    _stopWatchTimer.onExecute.add(StopWatchExecute.start);

    //TODO: měřič pozic (sem, kvůli tomu, že to poběží na pozadí)
    // while(true) by mohlo dělat potíže do budoucna by se to mohlo nahradit tímto:
    //                                                      while(okno_stále_běží) ...
    while(true) {

    }

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
              SizedBox(height: 170.0,), //TODO: SizedBox upravit podle potřeby a po přidání widgetů.


              StreamBuilder<int>(
                stream: _stopWatchTimer.rawTime,
                initialData: _stopWatchTimer.rawTime.value,
                builder: (context, snapshot) {
                  final value = snapshot.data;
                  final displayTime = StopWatchTimer.getDisplayTime(value, hours: _isHours);
                  return Text(
                    displayTime,
                    style: const TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                    )
                  );
                }
              ),

              //TODO: měření délky cesty

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
                          MaterialPageRoute(builder: (context) => End_Walking()),
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
              SizedBox(height: 22.8,), //TODO: SizedBox upravit podle potřeby a po přidání widgetů.
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

