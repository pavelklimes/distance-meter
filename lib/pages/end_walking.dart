import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:distance_meter/pages/active_walking.dart';
import 'package:distance_meter/pages/waitingTo_end.dart';
import 'package:screenshot/screenshot.dart';
import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:permission_handler/permission_handler.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'dart:math';

const mainColor = const Color(0xFFbeff19);

Future<bool> _onBackPressed() {
  Future<bool> a;
  return a;
}

class End_Walking extends StatefulWidget {
  @override
  _End_WalkingState createState() => _End_WalkingState();
}

class _End_WalkingState extends State<End_Walking> {

  final _screenshotController = ScreenshotController();

  static GlobalKey globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: RepaintBoundary(
        key: globalKey,
        child: Screenshot(
          controller: _screenshotController,
              child: Scaffold(
                appBar: AppBar(
                  backgroundColor: mainColor,
                  automaticallyImplyLeading: false,
                  title: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Text("Konec aktivity", style: TextStyle(color: Colors.grey[800], fontWeight: FontWeight.w300),),
                  ),
                  centerTitle: true,
                ),
                body: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[

                      SizedBox(height: 15,),
                      Image.asset("images/app_icon.png", height: 100, width: 100,),
                      SizedBox(height: 25,),
                      Align(
                        alignment: Alignment(-0.5, 0.0),
                        child: Text(
                          "Doba trvání:",
                          style: TextStyle(
                            color: Colors.grey[850],
                            fontSize: 20,
                            fontWeight: FontWeight.w300
                          ),
                        ),
                      ),
                      Text(
                        ourTime,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w300,
                          fontSize: 45,
                        ),
                      ),
                      SizedBox(height: 20,),

                      Align(
                        alignment: Alignment(-0.5, 0.0),
                        child: Text(
                          "Délka trasy:",
                          style: TextStyle(
                            color: Colors.grey[850],
                            fontSize: 20,
                            fontWeight: FontWeight.w300
                          ),
                        ),
                      ),
                      Text(
                        '${total_distance != null ? total_distance > 1000 ? (total_distance / 1000).toStringAsFixed(1) : total_distance.toStringAsFixed(1) : 0} ${total_distance != null ? total_distance > 1000 ? 'km' : 'metrů' : 0}',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w300,
                          fontSize: 45,
                        ),
                      ),

                      SizedBox(height: 50,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ButtonTheme(
                              minWidth: 140.0,
                              height: 60.0,
                              child: RaisedButton(

                                onPressed: () async {
                                  await _takeScreenshot();
                                  Future.delayed(const Duration(seconds: 1), () {
                                    showDialog(context: context, builder: (context) => new AlertDialog(
                                      title: Text("Screenshot uložen"),
                                      content: Text("Teď můžete v klidu aplikaci vypnout."),
                                      actions: [
                                        FlatButton(child: Text("OK"), onPressed: () {
                                          Navigator.of(context).pop(false);
                                        },)
                                      ],
                                    ));
                                  });
                                },

                                color: mainColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(60),
                                ),
                                child: Icon(Icons.photo_camera_outlined, size: 35,)),
                          ),
                          SizedBox(width: 25,),
                          ButtonTheme(
                              minWidth: 140.0,
                              height: 60.0,
                              child: RaisedButton(

                                onPressed: () {

                                  total_distance = 0.0;

                                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                                      End_Loading()), (Route<dynamic> route) => false);

                                },

                                color: Colors.red[300],
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(60),
                                ),
                                child: Text(
                                  "UKONČIT",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey.shade800,
                                    fontSize: 20,
                                  ),
                                ),
                              )
                          ),
                        ],
                      ),


                      SizedBox(height: 38,), //TODO: SizedBox upravit podle potřeby a po přidání widgetů.
                      Align(
                        alignment: Alignment(-0.0, 0.0),
                        child: Image.asset(
                          "images/watermarks/watermark.png",
                          height: 100, width: 250,
                        ),
                      )
                    ],
                  ),
                ),
              ),
          ),
      ),
    );
  }
  void _takeScreenshot() async {
    final imageFile = await _screenshotController.capture();
    _save();
    // dodělat Sharing (save-ování)

  }

  Future<void> _save() async {
    RenderRepaintBoundary boundary =
    globalKey.currentContext.findRenderObject();
    ui.Image image = await boundary.toImage();
    ByteData byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List pngBytes = byteData.buffer.asUint8List();

    //Request permissions if not already granted
     if (!(await Permission.storage.status.isGranted))
      await Permission.storage.request();


    final result = await ImageGallerySaver.saveImage(
        Uint8List.fromList(pngBytes),
        quality: 60,
        name: getRandomString(12));
    print(result);
  }

  static const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random _rnd = Random();

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

}