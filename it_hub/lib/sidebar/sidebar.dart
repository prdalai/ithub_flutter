import 'dart:async';


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:it_hub/login_demo/auth.dart';
import 'package:it_hub/login_demo/auth_provider.dart';

import 'package:it_hub/login_demo/root_page.dart';

import 'package:rxdart/rxdart.dart';

import '../bloc.navigation_bloc/navigation_bloc.dart';
import '../sidebar/menu_item.dart';
import 'package:url_launcher/url_launcher.dart';

class Gh extends StatefulWidget {
  const Gh ({this.onSignedOut});
  final VoidCallback onSignedOut;


  Future<void> _signOut(BuildContext context) async {
    try {
      final BaseAuth auth = AuthProvider.of(context).auth;
      await auth.signOut();
      onSignedOut();
    } catch (e) {
      print(e);
    }
  }

  @override
  _GhState createState() => _GhState();


}

class _GhState extends State<Gh> with SingleTickerProviderStateMixin<Gh> {

  AnimationController _animationController;
  StreamController<bool> isSidebarOpenedStreamController;
  Stream<bool> isSidebarOpenedStream;
  StreamSink<bool> isSidebarOpenedSink;
  final _animationDuration = const Duration(milliseconds: 300);

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(vsync: this, duration: _animationDuration);
    isSidebarOpenedStreamController = PublishSubject<bool>();
    isSidebarOpenedStream = isSidebarOpenedStreamController.stream;
    isSidebarOpenedSink = isSidebarOpenedStreamController.sink;
  }

  @override
  void dispose() {
    _animationController.dispose();
    isSidebarOpenedStreamController.close();
    isSidebarOpenedSink.close();
    super.dispose();
  }

  void onIconPressed() {
    final animationStatus = _animationController.status;
    final isAnimationCompleted = animationStatus == AnimationStatus.completed;

    if (isAnimationCompleted) {
      isSidebarOpenedSink.add(false);
      _animationController.reverse();
    } else {
      isSidebarOpenedSink.add(true);
      _animationController.forward();
    }
  }


  @override
  Widget build(BuildContext context) {

    final screenWidth = MediaQuery.of(context).size.width;
    final Shader linearGradient = LinearGradient(
      colors: <Color>[Colors.white, Colors.cyanAccent],
    ).createShader(Rect.fromLTWH(10.0, 0.0, 200.0, 70.0));
    return StreamBuilder<bool>(
      initialData: false,
      stream: isSidebarOpenedStream,
      builder: (context, isSideBarOpenedAsync) {
        return AnimatedPositioned(
          duration: _animationDuration,
          top: 0,
          bottom: 0,
          left: isSideBarOpenedAsync.data ? 0 : -screenWidth,
          right: isSideBarOpenedAsync.data ? 0 : screenWidth - 45,
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.black, Colors.transparent])
                  ),
                  child: Column(
                    children: <Widget>[
                      SizedBox(

                        height: 80,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(1,0.1,0,0),
                        child: ListTile(
                          title: Padding(
                            padding: const EdgeInsets.all(0.3),
                            child: Text(
                              "Prashant dalai",
                              style: TextStyle( fontSize: 20, fontWeight: FontWeight.w800, foreground: Paint()..shader = linearGradient
                              ),
                            ),
                          ),
                          subtitle: new InkWell(
                              child: new Text('www.prashantdalai.tk'),
                              onTap: () => launch('https://prashantrdalai.000webhostapp.com/prd/index.html')),
                          leading: CircleAvatar(backgroundColor: Colors.cyanAccent,
                            child: Icon(
                              Icons.copyright,
                              color: Colors.black,size: 40,
                            ),
                            radius: 20,
                          ),
                        ),
                      ),
                      Divider(
                        height: 64,
                        thickness: 0.5,
                        color: Colors.white.withOpacity(0.3),
                        indent: 32,
                        endIndent: 32,
                      ),
                      MenuItem(
                        icon: Icons.home,
                        title: "Home",
                        onTap: () {
                          onIconPressed();
                          BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.HomePageClickedEvent);
                        },
                      ),

                      MenuItem(
                        icon: Icons.book,
                        title: "Programming Books",
                        onTap: () {
                          onIconPressed();
                          BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.MyBookClickedEvent);
                        },
                      ),
                      MenuItem(
                        icon: Icons.school,
                        title: "Reference Books",
                        onTap: () {
                          onIconPressed();
                          BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.MyBscEvent);
                        },
                      ),
                      MenuItem(
                        icon: Icons.chrome_reader_mode,
                        title: "Motivational Books",
                        onTap: () {
                          onIconPressed();
                          BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.MyMoEvent);
                        },
                      ),
                      MenuItem(
                        icon: Icons.trending_up,
                        title: "News",
                        onTap: () {
                          onIconPressed();
                          BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.MyNewsClickedEvent);
                        },
                      ),
                      MenuItem(
                        icon: Icons.query_builder,
                        title: "Quiz",
                        onTap: () {
                          onIconPressed();
                          BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.MyQuizClickedEvent);
                        },
                      ),
                      MenuItem(
                        icon: Icons.wallpaper,
                        title: "Wallpapers",
                        onTap: () {
                          onIconPressed();
                          BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.MyWlClickedEvent);
                        },
                      ),

                      MenuItem(
                        icon: Icons.camera_enhance,
                        title: "Machine Learning",
                        onTap: () {
                          onIconPressed();
                          BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.MyMlClickedEvent);
                        },
                      ),
                      Divider(
                        height: 64,
                        thickness: 0.5,
                        color: Colors.white.withOpacity(0.3),
                        indent: 32,
                        endIndent: 32,
                      ),
                      MenuItem(
                        icon: Icons.power_settings_new,
                        title: "Logout",
                          onTap: () {(widget._signOut(context));
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => RootPage())); }

                      )

                    ],
                  ),
                ),
              ),


              Align(
                alignment: Alignment(0.5, -1.02),
                child: GestureDetector(
                  onTap: () {
                    onIconPressed();
                  },
                  child: ClipPath(
                    clipper: CustomMenuClipper(),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      child: Container(
                        width: 35,
                        height: 110,
                        color: Colors.transparent,
                        alignment: Alignment.centerLeft,
                        child: AnimatedIcon(
                          progress: _animationController.view,
                          icon: AnimatedIcons.menu_arrow,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class CustomMenuClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Paint paint = Paint();
    paint.color = Colors.white;

    final width = size.width;
    final height = size.height;

    Path path = Path();
    path.moveTo(0, 0);
    path.quadraticBezierTo(0, 8, 10, 16);
    path.quadraticBezierTo(width - 1, height / 2 - 20, width, height / 2);
    path.quadraticBezierTo(width + 1, height / 2 + 20, 10, height - 16);
    path.quadraticBezierTo(0, height - 8, 0, height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
