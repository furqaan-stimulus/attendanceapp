import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:attendanceapp/app/lcoater.dart';
import 'package:attendanceapp/models/log_model.dart';
import 'package:attendanceapp/models/log_types.dart';
import 'package:attendanceapp/services/auth_service.dart';
import 'package:attendanceapp/utils/utils.dart';

class FireStoreService {
  final Firestore _firestore = Firestore.instance;
  final Authentication _authentication = locator<Authentication>();
  StreamController<List<LogModel>> _logsForToday = StreamController<List<LogModel>>.broadcast();
  StreamController<List<List<LogModel>>> _logs = StreamController<List<List<LogModel>>>.broadcast();

  Stream<List<LogModel>> get logsForToday => _logsForToday.stream;

  Stream<List<List<LogModel>>> get logs => _logs.stream;

  dispose() {
    _logsForToday.close();
    _logs.close();
  }

  markLog(LogTypes logType) {
    WriteBatch batch = _firestore.batch();
    LogModel logModel = LogModel(
        dateWithMinutes: Utils.getNowInMillisecond,
        time: Utils.getTodayInMillisecond,
        type: logType,
        uid: _authentication.user.uid);
    DocumentReference userDocRef =
        _firestore.document('users/${_authentication.user.uid}/logs/${Utils.getNewDocId}');
    DocumentReference logDocRef = _firestore.document('logs/${Utils.getNewDocId}');
    var payloadForLog = logModel.toJson(addUid: true);
    var payloadForUser = logModel.toJsonWithRef(addUid: true);
    batch.setData(logDocRef, payloadForLog);
    batch.setData(userDocRef, payloadForUser);
    batch.commit();
  }

  Stream<List<LogModel>> getLogsForToday() {
    DateTime toady = DateTime.now();
    CollectionReference _collectionReference = Firestore.instance.collection('logs');
    _collectionReference
        .where('uid', isEqualTo: _authentication.user.uid)
        .where('time', isEqualTo: Utils.getTodayInMillisecond)
        .orderBy('dateWithMinutes', descending: true)
        .snapshots()
        .listen((event) {
      List<DocumentSnapshot> docs = event.documents;
      print(docs);
      if (docs.isNotEmpty) {
        List<LogModel> logs = docs.map((doc) => LogModel.fromJson(doc.data)).toList();
        _logsForToday.sink.add(logs);
      } else {
        _logsForToday.sink.add([]);
      }
    });
    return _logsForToday.stream;
  }

  Stream<List<List<LogModel>>> getLogs() {
    DateTime toady = DateTime.now();
    List<int> dates = [];
    _firestore
        .collection('users/${_authentication.user.uid}/logs')
        .where('uid', isEqualTo: _authentication.user.uid)
        .orderBy('dateWithMinutes', descending: true)
        .snapshots()
        .listen((event) {
      if (event.documents.isNotEmpty) {
        print(event.documents);
        List<List<LogModel>> dateWiseLogs = [];
        List<LogModel> logs = event.documents
            .map(
          (element) => LogModel.fromJson(element.data),
        )
            .map((element) {
          if (dates.indexOf(element.time) == -1) {
            dates.add(element.time);
          }
          return element;
        }).toList();
        dates.forEach((date) {
          dateWiseLogs.add(logs.where((element) => element.time == date).toList());
        });
        _logs.sink.add(dateWiseLogs);
      } else {
        _logs.sink.add([]);
      }
    });
    return _logs.stream;
  }
}
