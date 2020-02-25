import 'package:flutter/material.dart';
import 'package:it_hub/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:webfeed/webfeed.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class Mo extends StatefulWidget with NavigationStates {
  //
  Mo() : super();

  final String title = 'RSS Feed Demo';

  @override
  MoState createState() => MoState();
}

class MoState extends State<Mo> {
  //
  static const String FEED_URL =
      'https://raw.githubusercontent.com/prdalai/project/master/mo.xml';
  RssFeed _feed;
  final Shader linearGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: <Color>[Color(0xff00f5ff), Colors.lightBlueAccent],
  ).createShader(Rect.fromLTRB(400.0, .0, 0.0, 0.0));
  static const String loadingFeedMsg = 'Loading Feed...';
  static const String feedLoadErrorMsg = 'Error Loading Feed.';
  static const String feedOpenErrorMsg = 'Error Opening Feed.';
  GlobalKey<RefreshIndicatorState> _refreshKey;

  updateTitle(title) {}

  updateFeed(feed) {
    setState(() {
      _feed = feed;
    });
  }

  Future<void> openFeed(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: true,
        forceWebView: false,
      );
      return;
    }
    updateTitle(feedOpenErrorMsg);
  }

  load() async {
    updateTitle(loadingFeedMsg);
    loadFeed().then((result) {
      if (null == result || result.toString().isEmpty) {
        updateTitle(feedLoadErrorMsg);
        return;
      }
      updateFeed(result);
      updateTitle(_feed.title);
    });
  }

  Future<RssFeed> loadFeed() async {
    try {
      final client = http.Client();
      final response = await client.get(FEED_URL);
      return RssFeed.parse(response.body);
    } catch (e) {
      //
    }
    return null;
  }

  @override
  void initState() {
    super.initState();
    _refreshKey = GlobalKey<RefreshIndicatorState>();
    updateTitle(widget.title);
    load();
  }

  title(title) {
    return Text(
      title,
      style: TextStyle(
          fontSize: 18.0,
          fontFamily: "Alike",
          fontWeight: FontWeight.w500,
          foreground: Paint()..shader = linearGradient,
          letterSpacing: 1),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  rightIcon() {
    return Icon(
      Icons.file_download,
      color: Colors.blue,
      size: 30.0,
    );
  }

  list() {
    return ListView.builder(
      itemCount: _feed.items.length,
      itemBuilder: (BuildContext context, int index) {
        final item = _feed.items[index];
        return ListTile(
          title: title(item.title),
          trailing: rightIcon(),
          contentPadding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          onTap: () => openFeed(item.link),
        );
      },
    );
  }

  isFeedEmpty() {
    return null == _feed || null == _feed.items;
  }

  body() {
    return isFeedEmpty()
        ? Center(
            child: CircularProgressIndicator(),
          )
        : RefreshIndicator(
            key: _refreshKey,
            child: list(),
            onRefresh: () => load(),
          );
  }

  @override
  Widget build(BuildContext context) {
    final Shader linearGradient = LinearGradient(
      colors: <Color>[Color(0xff00BCFF), Colors.blueAccent],
    ).createShader(Rect.fromLTWH(100.0, 0.0, 200.0, 70.0));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(
            child: Text(
          "REFERENCE BOOKS",
              style: TextStyle(
                fontSize: 30,letterSpacing: 2,
                foreground: Paint()..shader = linearGradient,
                shadows: <Shadow>[
                  Shadow(
                    offset: Offset(1.0, 1.0),
                    blurRadius: 3.0,
                    color: Colors.white,
                  ),
                  Shadow(
                    offset: Offset(1.0, 1.0),
                    blurRadius: 2.0,
                    color: Colors.black,
                  ),
                ],
              ),
        )),
      ),
      body: body(),
    );
  }
}
