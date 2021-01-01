import 'package:flutter/material.dart';
import 'package:attendanceapp/constants/constants.dart';
import 'package:attendanceapp/ui/home_log_list_view/home_log_list_view_model.dart';
import 'package:attendanceapp/utils/utils.dart';
import 'package:attendanceapp/widgets/list_tile.dart';
import 'package:attendanceapp/widgets/log_header.dart';
import 'package:stacked/stacked.dart';

class HomeLogListView extends StatefulWidget {
  final Orientation orientation;

  const HomeLogListView({Key key, this.orientation}) : super(key: key);

  @override
  _HomeLogListViewState createState() => _HomeLogListViewState();
}

class _HomeLogListViewState extends State<HomeLogListView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeLogListViewModel>.reactive(
      viewModelBuilder: () => HomeLogListViewModel(),
      onModelReady: (model) => model.initialise(),
      builder: (context, model, child) => Container(
        width: MediaQuery.of(context).size.width /
            (widget.orientation == Orientation.landscape ? 2 : 1),
        child: Flex(
          mainAxisSize: MainAxisSize.min,
          direction: Axis.vertical,
          children: [
            LogHeader(
              showDate: false,
              logHours: Utils.calculateHoursForSingleDay(model.logs),
              day: DateTime.now(),
            ),
            (model.logs.length == 0) && (!model.isBusy)
                ? AppConstants.noData[0]
                : Container(
                    height: 0,
                  ),
            (model.logs.length == 0) && (!model.isBusy)
                ? AppConstants.noData[1]
                : Container(
                    height: 0,
                  ),
            (model.logs.length != 0) && (model.isBusy)
                ? Container(
                    height: 0,
                  )
                : Flexible(
                    child: Stack(
                      children: [
                        ListView.builder(
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  EdgeInsets.only(top: index == 0 ? 15 : 0),
                              child: LogTile(log: model.logs[index]),
//                        child: LogTile(),
                            );
                          },
                          physics: BouncingScrollPhysics(),
                          itemCount: model.logs.length,
                        ),
                        AppConstants.listGradientOverLay,
                      ],
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
