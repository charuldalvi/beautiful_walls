import 'package:firestore_example/screen_chooser.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_downloader/image_downloader.dart';
import 'package:wallpaper/wallpaper.dart';

class ShowImage extends StatefulWidget {
  final String imagename;

  ShowImage(this.imagename);

  @override
  ShowImageState createState() => ShowImageState(this.imagename);
}

class ShowImageState extends State<ShowImage> {
  String name;
  int progress;
  var result = "Waiting to set wallpaper";
  var optionchoosed = "";

  Modal modal = Modal();

  ShowImageState(this.name);

  

  @override
  void initState() {
    super.initState();
    ImageDownloader.callback(onProgressUpdate: (String imageId, int progress) {
      setState(() {
        this.progress = progress;
      });
    });
  }

  

  _displayDialog(BuildContext context) async {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return Dialog(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text('Homescreen'),
                  onTap: () {
                    optionchoosed = 'Homescreen';
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.lock),
                  title: Text('Lockscreen'),
                  onTap: () {
                    optionchoosed = 'Lockscreen';
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.phone_android),
                  title: Text('Both'),
                  onTap: () {
                    optionchoosed = 'Both';
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          );
        });
  }

  void imagedownload() async {
    // Saved with this method.
    var imageId = await ImageDownloader.downloadImage(name);
    print(imageId);
    if (imageId == null) {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            child: Hero(
              tag: name,
              child: Container(
                child: Image.network(
                  name,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: Container(
              width: MediaQuery.of(context).size.height,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black38,
                      offset: Offset.zero,
                      blurRadius: 10.0,
                      spreadRadius: 2.0)
                ],
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10.0),
                    topLeft: Radius.circular(10.0)),
              ),
              child: Row(
                children: <Widget>[
                  IconButton(
                    onPressed: () async {
                      _displayDialog(context);
                      switch (optionchoosed) {
                        case "Homescreen":
                          String res;
                          res = await Wallpaper.homeScreen(name);
                          if (!mounted) return;
                          setState(() {
                            result = res.toString();
                          });
                          print(result);
                          break;
                        case "Lockscreen":
                          String res;
                          res = await Wallpaper.lockScreen(name);
                          if (!mounted) return;
                          setState(() {
                            result = res.toString();
                          });
                          print(result);
                          break;
                        case "Both":
                          String res;
                          res = await Wallpaper.bothScreen(name);
                          if (!mounted) return;
                          setState(() {
                            result = res.toString();
                          });
                          print(result);
                          break;
                      }
                    },
                    icon: Icon(
                      Icons.wallpaper,
                      color: Colors.black,
                    ),
                    tooltip: 'Set as wallpaper',
                  ),
                  GestureDetector(
                    onTap: () async {
                      _displayDialog(context);
                      switch (optionchoosed) {
                        case "Homescreen":
                          String res;
                          res = await Wallpaper.homeScreen(name);
                          if (!mounted) return;
                          setState(() {
                            result = res.toString();
                          });
                          print(result);
                          break;
                        case "Lockscreen":
                          String res;
                          res = await Wallpaper.lockScreen(name);
                          if (!mounted) return;
                          setState(() {
                            result = res.toString();
                          });
                          print(result);
                          break;
                        case "Both":
                          String res;
                          res = await Wallpaper.bothScreen(name);
                          if (!mounted) return;
                          setState(() {
                            result = res.toString();
                          });
                          print(result);
                          break;
                      }
                    },
                    child: Text(
                      'Set as Wallpaper',
                      style: TextStyle(color: Colors.black, fontSize: 15.0),
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 25.0,
            right: 20.0,
            child: FloatingActionButton(
              onPressed: () {
                imagedownload();
              },
              backgroundColor: Colors.indigoAccent,
              child: Icon(
                Icons.arrow_downward,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
