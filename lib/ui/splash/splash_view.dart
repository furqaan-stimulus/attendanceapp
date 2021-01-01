import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:attendanceapp/ui/splash/splash_view_model.dart';
import 'package:stacked/stacked.dart';

class SplashView extends StatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashViewModel>.reactive(
      onModelReady: (model) async {
        await model.checkLogin();
      },
      builder: (context, model, child) => Scaffold(
        body: Center(
//          child: NeumorphicIcon(
//            AppConstants.logo,
//            style: NeumorphicStyle(
//              color: Colors.deepOrange,
//              shape: NeumorphicShape.concave,
//              depth: 8,
//                intensity: 5
//            ),
//            size: 250,
//          ),
        ),
      ),
      viewModelBuilder: () => SplashViewModel(
      ),
    );
  }
}
