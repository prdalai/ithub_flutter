import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:it_hub/login_demo/auth.dart';
import 'package:it_hub/login_demo/auth_provider.dart';
import 'package:rxdart/rxdart.dart';

import '../bloc.navigation_bloc/navigation_bloc.dart';
import '../sidebar/menu_item.dart';
import 'package:url_launcher/url_launcher.dart';
/*class Bet extends StatelessWidget with NavigationStates{
  const Bet({this.onSignedOut});
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
        actions: <Widget>[
          FlatButton(
            child: Text('Logout', style: TextStyle(fontSize: 17.0, color: Colors.white)),
            onPressed: () => _signOut(context),
          )
        ],
      ),
      body: Container(
        child: Center(child: Text('Welcome', style: TextStyle(fontSize: 32.0))),
      ),
    );
  }
}*/
class SideBar extends StatefulWidget {
  const SideBar({this.onSignedOut});
  final VoidCallback onSignedOut;

  Future<void> signOut(BuildContext context) async {
    try {
      final BaseAuth auth = AuthProvider.of(context).auth;
      await auth.signOut();
      onSignedOut();
    } catch (e) {
      print(e);
    }
  }

  @override
  _SideBarState createState() => _SideBarState();

}

class _SideBarState extends State<SideBar> with SingleTickerProviderStateMixin<SideBar> {
  AnimationController _animationController;
  StreamController<bool> isSidebarOpenedStreamController;
  Stream<bool> isSidebarOpenedStream;
  StreamSink<bool> isSidebarOpenedSink;
  final _animationDuration = const Duration(milliseconds: 500);

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

    return Container(
      child: StreamBuilder<bool>(
        initialData: false,
        stream: isSidebarOpenedStream,
        builder: (context, isSideBarOpenedAsync) {
          return Expanded(
            child: AnimatedPositioned(
              duration: _animationDuration,
              top: 0,
              bottom: 0,
              left: isSideBarOpenedAsync.data ? 0 : -screenWidth,
              right: isSideBarOpenedAsync.data ? 0 : screenWidth - 35,
              child: Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(

                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Colors.black, Colors.transparent])
                        ),
                        child: Column(
                          children: <Widget>[
                            SizedBox(

                              height: 100,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0,0.1,0,10),
                              child: ListTile(
                                title: Text(
                                  "Prashant dalai",
                                  style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w800),
                                     ),
                                    subtitle: new InkWell(
                                      child: new Text('www.prashantdalai.tk'),
                                     onTap: () => launch('https://prashantrdalai.000webhostapp.com/prd/index.html')),
                                        leading: CircleAvatar(
                                         child: Icon(
                                          Icons.copyright,
                                          color: Colors.white,
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
                              title: "Book",
                              onTap: () {
                                onIconPressed();
                                BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.MyBookClickedEvent);
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
                              icon: Icons.cloud,
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
                              icon: Icons.cloud,
                              title: "Machine Learning",
                              onTap: () {
                                onIconPressed();
                                BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.MyMlClickedEvent);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(5, -1.02),
                      child: GestureDetector(
                        onTap: () {
                          onIconPressed();
                        },
                        child: ClipPath(
                          clipper: CustomMenuClipper(),
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
                  ],
                ),
              ),
            ),
          );
        },
      ),
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
