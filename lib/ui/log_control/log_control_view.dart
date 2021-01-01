import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:attendanceapp/models/log_types.dart';
import 'package:attendanceapp/ui/log_control/log_control_view_model.dart';
import 'package:attendanceapp/widgets/header_row.dart';
import 'package:attendanceapp/widgets/log_control_button.dart';
import 'package:stacked/stacked.dart';

class LogControlView extends StatefulWidget {
  @override
  _LogControlViewState createState() => _LogControlViewState();
}

class _LogControlViewState extends State<LogControlView> {
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) => ViewModelBuilder<LogControlViewModel>.reactive(
          fireOnModelReadyOnce: true,
          onModelReady: (model) {
            model.initialise();
          },
          builder: (context, model, child) => !model.isBusy
              ? Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    NameHeader(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        LogEntryButton(
                          pressed: model.getLastLog(LogTypes.logIn),
                          firstLog: model.logs.length == 0,
                          onPressed: () async {
                            await model.markLogIn();
                          },
                          type: LogTypes.logIn,
                        ),
                        LogEntryButton(
                          pressed: model.getLastLog(LogTypes.logOut),
                          firstLog: false,
                          onPressed: () async {
                            await model.markLogOut();
                          },
                          type: LogTypes.logOut,
                        )
                      ],
                    ),
                  ],
                )
              : Center(),
          viewModelBuilder: () => LogControlViewModel()),
    );
  }
}
