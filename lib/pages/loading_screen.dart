import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:distance_meter/pages/home.dart';
import 'welcome.dart';

class Loading extends StatefulWidget {

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
            Splash()), (Route<dynamic> route) => false);
      });

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.limeAccent.shade200,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 300, 0, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SpinKitThreeBounce(
              color: Colors.red,
              size: 50.0,
            ),
            Image.asset(
              "images/logo_full.png",
              height: 200, width: 200,
            ),
          ],
        ),
      ),
    );
  }
}
