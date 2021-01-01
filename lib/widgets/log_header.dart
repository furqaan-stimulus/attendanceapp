import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LogHeader extends StatelessWidget {
  final bool showDate;
  final DateTime day;
  final double logHours;

  const LogHeader({Key key, this.showDate, this.day, this.logHours})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
//    height 30 + 10 padding top + 20 padding bot = 60
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, left: 30, right: 30, top: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            !showDate ? "Today's Logs" : DateFormat('d MMM').format(day),
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.access_time),
              Padding(padding: EdgeInsets.all(5)),
              Text(
                "$logHours Hrs",
                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w300),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
