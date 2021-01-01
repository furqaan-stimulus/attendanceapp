import 'package:attendanceapp/app/lcoater.dart';
import 'package:attendanceapp/models/log_model.dart';
import 'package:attendanceapp/services/firestore_service.dart';
import 'package:stacked/stacked.dart';

class AllLogsViewModel extends BaseViewModel {
  final FireStoreService _fireStoreService = locator<FireStoreService>();
  List<List<LogModel>> _logs = [];

  List<List<LogModel>> get logs => _logs;

  getLogs() {
    setBusy(true);
    _fireStoreService.getLogs().listen((event) {
      _logs = event;
      notifyListeners();
      setBusy(false);
    });
  }
}
