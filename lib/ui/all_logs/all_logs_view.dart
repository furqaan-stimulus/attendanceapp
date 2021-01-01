import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:attendanceapp/constants/constants.dart';
import 'package:attendanceapp/models/log_model.dart';
import 'package:attendanceapp/ui/all_logs/all_logs_view_model.dart';
import 'package:attendanceapp/ui/drawer/drawer_view.dart';
import 'package:attendanceapp/utils/utils.dart';
import 'package:attendanceapp/widgets/list_tile.dart';
import 'package:attendanceapp/widgets/log_header.dart';
import 'package:stacked/stacked.dart';

class AllLogsView extends StatefulWidget {
  @override
  _AllLogsViewState createState() => _AllLogsViewState();
}

class _AllLogsViewState extends State<AllLogsView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AllLogsViewModel>.reactive(
        onModelReady: (model) => model.getLogs(),
        builder: (context, model, child) => Scaffold(
              drawer: DrawerWidgetView(),
              appBar: NeumorphicAppBar(
                leading: NeumorphicButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back),
                ),
                automaticallyImplyLeading: false,
//        color: Color(0xff2ECC5A),
                title: Text(
                  'All Logs',
                  style: AppConstants.appBarText,
                ),
              ),
              body: Stack(
                children: [
                  !model.isBusy
                      ? Center()
                      : ListView.builder(
                          physics: BouncingScrollPhysics(),
                          itemCount: model.logs.length,
                          itemBuilder: (context, index) => AllLogsList(
                            logs: model.logs[index],
                          ),
                        ),
                  Container(
                    width: double.maxFinite,
                    height: 30,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        gradient: LinearGradient(colors: [
                          NeumorphicColors.background,
                          NeumorphicColors.background.withOpacity(0),
                        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
                  ),
                ],
              ),
            ),
        viewModelBuilder: () => AllLogsViewModel());
  }
}

class AllLogsList extends StatefulWidget {
  final List<LogModel> logs;

  const AllLogsList({Key key, this.logs}) : super(key: key);

  @override
  _AllLogsListState createState() => _AllLogsListState();
}

class _AllLogsListState extends State<AllLogsList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LogHeader(
          day: widget.logs[0].getDate(),
          logHours: Utils.calculateHoursForSingleDay(widget.logs),
          showDate: true,
        ),
        Column(
          children: List.generate(
              widget.logs.length,
              (index) => LogTile(
                    log: widget.logs[index],
                  )),
        )
      ],
    );
  }
}
