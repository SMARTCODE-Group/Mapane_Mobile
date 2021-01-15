import 'package:flutter/material.dart';
import 'package:mapane/routes.dart';
import 'package:mapane/screens/nav_page.dart';
import 'package:mapane/screens/splash_screen.dart';
import 'package:mapane/screens/tabs_page.dart';
import 'package:mapane/service_locator.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mapane',
      theme: ThemeData(
          fontFamily: "Raleway",
          visualDensity: VisualDensity.adaptivePlatformDensity,
          primaryColor: Color.fromRGBO(245, 54, 21, 1),
          primarySwatch: Colors.deepOrange,
          canvasColor: Colors.transparent
      ),
      home: TabsPage(),
      routes: Routes.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
