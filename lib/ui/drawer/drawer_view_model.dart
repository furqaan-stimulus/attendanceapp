import 'package:firebase_auth/firebase_auth.dart';
import 'package:attendanceapp/app/lcoater.dart';
import 'package:attendanceapp/services/auth_service.dart';
import 'package:stacked/stacked.dart';

class DrawerWidgetViewModel extends BaseViewModel {
  final Authentication _authentication = locator<Authentication>();
  FirebaseUser get  user => _authentication.user;
}
