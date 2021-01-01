import 'package:attendanceapp/app/lcoater.dart';
import 'package:attendanceapp/models/log_model.dart';
import 'package:attendanceapp/models/log_types.dart';
import 'package:attendanceapp/services/firestore_service.dart';
import 'package:stacked/stacked.dart';

class LogControlViewModel extends BaseViewModel {
  final FireStoreService _fireStoreService = locator<FireStoreService>();
  List<LogModel> _logs = [];

  List<LogModel> get logs => _logs;

  initialise() {
    setBusy(true);
    _fireStoreService.getLogsForToday().listen((event) {
      print(event);
      _logs = event;
      setBusy(false);
    });
  }

  getLastLog(LogTypes type) {
    if (type == LogTypes.logIn) {
      return _logs.length == 0 ? false : _logs.first.type == type;
    } else {
      return _logs.length == 0 ? true : _logs.first.type == type;
    }
  }

  markLogIn() {
    _fireStoreService.markLog(LogTypes.logIn);
  }

  markLogOut() {
    _fireStoreService.markLog(LogTypes.logOut);
  }
}
