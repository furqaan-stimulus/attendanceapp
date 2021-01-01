import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:attendanceapp/models/log_types.dart';

class LogModel {
  int time;
  LogTypes type;
  String uid;
  int dateWithMinutes;

  LogModel({
    @required this.uid,
    @required this.time,
    @required this.type,
    @required this.dateWithMinutes,
  });

  LogModel.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    type = json['type'] == 'in' ? LogTypes.logIn : LogTypes.logOut;
    uid = json['uid'];
    dateWithMinutes = json['dateWithMinutes'];
  }

  Map<String, dynamic> toJson({bool addUid = false}) {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['time'] = this.time;
    data['dateWithMinutes'] = this.dateWithMinutes;
    data['type'] = this.type == LogTypes.logIn ? 'in' : 'out';
    if (addUid) {
      data['uid'] = this.uid;
    }
    return data;
  }

  Map<String, dynamic> toJsonWithRef({bool addUid = false, String docUid}) {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['time'] = this.time;
    data['dateWithMinutes'] = this.dateWithMinutes;
    data['type'] = this.type == LogTypes.logIn ? 'in' : 'out';
    if (addUid) {
      data['uid'] = this.uid;
    }
    data['ref'] = Firestore.instance.document('logs/$docUid');
    return data;
  }

  DateTime getDate() {
    return DateTime.fromMillisecondsSinceEpoch(this.time);
  }

  DateTime getDateWithMinutes() {
    return DateTime.fromMillisecondsSinceEpoch(this.dateWithMinutes);
  }
}
