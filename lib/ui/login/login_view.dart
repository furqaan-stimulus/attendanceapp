import 'package:flutter/material.dart';

import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:attendanceapp/constants/constants.dart';
import 'package:attendanceapp/ui/login/login_view_model.dart';
import 'package:stacked/stacked.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: () => LoginViewModel(),
      builder: (context, model, child) => Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: NeumorphicIcon(
                AppConstants.logo,
                style: NeumorphicStyle(
                    color: Colors.deepOrange,
                    shape: NeumorphicShape.concave,
                    depth: 8,
                    intensity: 5),
                size: 150,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 10),
              child: NeumorphicButton(
                minDistance: -4,
                style: NeumorphicStyle(
                    depth: 20,
                    boxShape: NeumorphicBoxShape.roundRect(
                        BorderRadius.circular(40))),
                onPressed: () async {
                  await model.login();
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SizedBox(
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Login With Google',
                          style: AppConstants.normalText,
                        ),
                        !model.isBusy
                            ? NeumorphicIcon(
                                AppConstants.google,
                                style: NeumorphicStyle(
                                  depth: 5,
                                  shadowLightColor: Colors.deepOrange,
                                  shadowDarkColor: Colors.blue,
                                  shape: NeumorphicShape.concave,
                                ),
                                size: 30,
                              )
                            : SizedBox(
                                height: 40,
                                width: 40,
                                child: Neumorphic(
                                  style: NeumorphicStyle(
                                    boxShape: NeumorphicBoxShape.circle(),
                                    depth: -5,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: CircularProgressIndicator(
                                      strokeWidth: 0.5,
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          Colors.deepOrange),
                                    ),
                                  ),
                                ),
                              )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
