import 'package:flutter/material.dart';
import 'pages/loading_screen.dart';
import 'package:flutter/services.dart';
import 'pages/home.dart';
import 'pages/active_walking.dart';
import 'pages/end_walking.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';


void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(MaterialApp(
    home: Loading(),
  ));
}