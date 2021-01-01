import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:intl/intl.dart';
import 'package:attendanceapp/app/router.gr.dart';
import 'package:attendanceapp/ui/drawer/drawer_view_model.dart';
import 'package:stacked/stacked.dart';

class DrawerWidgetView extends StatefulWidget {
  const DrawerWidgetView({Key key}) : super(key: key);

  @override
  _DrawerWidgetViewState createState() => _DrawerWidgetViewState();
}

class _DrawerWidgetViewState extends State<DrawerWidgetView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DrawerWidgetViewModel>.reactive(
      viewModelBuilder: () => DrawerWidgetViewModel(),
      builder: (context, model, child) => Drawer(
        child: Neumorphic(
            padding: EdgeInsets.only(top: 60),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Neumorphic(
                            child: SizedBox(
                              height: 72,
                              width: 70,
                              child: CircleAvatar(
                                backgroundColor: Colors.transparent,
                                child: Neumorphic(
                                  style: NeumorphicStyle(depth: 0, disableDepth: true),
                                  child: model.user?.photoUrl != null
                                      ? Image.network('${model.user?.photoUrl}')
                                      : Container(),
                                ),
                              ),
                            ),
                            style:
                                NeumorphicStyle(depth: 10, boxShape: NeumorphicBoxShape.circle()),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                          ),
                          SizedBox(
                            width: 170,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  '${model.user != null ? model.user.displayName.split(' ')[0] : ''}',
                                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30),
                                ),
                                Text(
                                  '${model.user != null ? (model.user.displayName.split(' ').length > 0 ? model.user.displayName.split(' ')[1] : '') : ''}',
                                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                ListView(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        toBeginningOfSentenceCase(
                            '${"it's"}  ${DateFormat('EEEE, d MMMM').format(DateTime.now())}'),
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.popAndPushNamed(context, Routes.homeView);
                      },
                      title: Text('Home'),
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.popAndPushNamed(context, Routes.allLogsView);
                      },
                      title: Text('All Logs'),
                    ),
                    ListTile(
                      onTap: () async {},
                      title: Text('Logout'),
                    )
                  ],
                )
              ],
            )),
      ),
    );
  }
}
