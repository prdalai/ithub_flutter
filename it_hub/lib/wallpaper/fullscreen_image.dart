import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class FullScreenImagePage extends StatelessWidget {
  String imgPath;
  FullScreenImagePage(this.imgPath);

  final LinearGradient backgroundGradient = new LinearGradient(
      colors: [ Colors.black, Colors.transparent],
      begin: Alignment.topCenter,
      end: Alignment.bottomRight);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new SizedBox.expand(
        child: new Container(
          decoration: new BoxDecoration(gradient: backgroundGradient),
          child: new Stack(
            children: <Widget>[
              new Align(
                alignment: Alignment.center,
                child: new Hero(
                  tag: imgPath,
                  child: new Image.network(imgPath),
                ),
              ),
              new Align(
                alignment: Alignment.topCenter,
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new AppBar(
                      elevation: 0.0,
                      backgroundColor: Colors.transparent,
                      leading: new IconButton(
                        icon: new Icon(
                          Icons.close,
                          color: Colors.cyanAccent,
                        ),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0,500,0,0),
                child: Center(
                  child: new RaisedButton(hoverElevation: 5,color: Colors.tealAccent,
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(75.0),
                        topRight: Radius.circular(75.0),
                        bottomLeft: Radius.circular(75.0),
                        bottomRight: Radius.circular(75.0)),
                  ),
                    child: Text('DOWNLOAD',
                      style: TextStyle(fontSize: 30,color: Colors.black,letterSpacing: 1,
                        shadows: <Shadow>[
                          Shadow(
                            offset: Offset(1.0, 1.0),
                            blurRadius: 3.0,
                            color: Colors.black,
                          ),
                          Shadow(
                            offset: Offset(1.0, 1.0),
                            blurRadius: 2.0,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                    onPressed: () => launch(imgPath),


                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
