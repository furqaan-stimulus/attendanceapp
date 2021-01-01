import 'package:attendanceapp/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:stacked_services/stacked_services.dart';
import 'app/lcoater.dart';
import 'package:attendanceapp/app/router.gr.dart' as route;

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return NeumorphicApp(
      theme: AppConstants.lightTheme,
      darkTheme: AppConstants.darkTheme,
      title: 'Flutter Demo',
      onGenerateRoute: route.Router().onGenerateRoute,
      navigatorKey: locator<NavigationService>().navigatorKey,
    );
  }
}
