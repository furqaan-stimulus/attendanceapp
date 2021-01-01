import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:attendanceapp/constants/constants.dart';
import 'package:attendanceapp/ui/drawer/drawer_view.dart';
import 'package:attendanceapp/ui/home/home_view_model.dart';
import 'package:attendanceapp/ui/home_log_list_view/home_log_list_view.dart';
import 'package:attendanceapp/ui/log_control/log_control_view.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatefulWidget {
  HomeView({Key key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.nonReactive(
      builder: (context, model, child) => OrientationBuilder(
        builder: (context, orientation) => Scaffold(
          drawer: Drawer(
            child: DrawerWidgetView(),
          ),
          appBar: NeumorphicAppBar(
            title: Text('Home'),
            actions: [
//              NeumorphicButton(
//                child: Icon(Icons.exit_to_app),
//                onPressed: () async {
//                  model.logOut();
//                },
//              )
            ],
          ),
          body: orientation == Orientation.portrait
              ? Flex(
                  direction: Axis.vertical,
                  children: [
                    SizedBox(
                      height: AppConstants.controlViewHeight,
                      child: Center(
                        child: LogControlView(),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                    ),
                    Flexible(fit: FlexFit.tight, child: HomeLogListView())
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                      child: Center(
                        child: LogControlView(),
                      ),
                    ),
                    HomeLogListView(
                      orientation: orientation,
                    )
                  ],
                ),
        ),
      ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}
