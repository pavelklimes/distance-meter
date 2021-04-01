import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'home.dart';

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
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Home()),
        );
      });

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 300, 0, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SpinKitThreeBounce(
              color: Colors.white,
              size: 50.0,
            ),
            Image.asset(
              "images/logo.png",
              height: 300, width: 300,
            ),
          ],
        ),
      ),
    );
  }
}
