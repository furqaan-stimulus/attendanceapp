import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:intl/intl.dart';
import 'package:attendanceapp/models/log_model.dart';
import 'package:attendanceapp/models/log_types.dart';

class LogTile extends StatefulWidget {
  final LogModel log;

  LogTile({Key key, this.log}) : super(key: key);

  @override
  _LogTileState createState() => _LogTileState();
}

class _LogTileState extends State<LogTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Neumorphic(
        style: NeumorphicStyle(
            depth: 5,
            boxShape:
                NeumorphicBoxShape.roundRect(BorderRadius.circular(50.0))),
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: SizedBox(
          height: 45,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Transform.rotate(
                      child: Icon(
                        Icons.arrow_back,
                        color: widget.log.type == LogTypes.logOut
                            ? Color(0xffF5B700)
                            : Color(0xff008BF8),
                      ),
                      angle: (pi / 180) *
                          (widget.log.type == LogTypes.logOut ? (45 * 3) : -45),
                    ),
                  ),
                  Text(
                      '${DateFormat('hh:mm a').format(DateTime.fromMillisecondsSinceEpoch(widget.log.dateWithMinutes))}')
                ],
              ),
              Text('${widget.log.type == LogTypes.logIn ? 'In' : 'Out'}')
            ],
          ),
        ),
      ),
    );
  }
}
