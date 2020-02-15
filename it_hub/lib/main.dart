import 'package:flutter/material.dart';
import 'package:it_hub/login_demo/auth.dart';
import 'login_demo/auth_provider.dart';
import 'login_demo/root_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AuthProvider(
      auth: Auth(),
      child: MaterialApp(debugShowCheckedModeBanner: false,
        title: 'Flutter login demo',
        theme: ThemeData(
          brightness: Brightness.dark,
        ),
        home: RootPage(),
      ),
    );
  }
}
