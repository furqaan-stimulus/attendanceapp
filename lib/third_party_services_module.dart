import 'package:injectable/injectable.dart';
import 'package:attendanceapp/services/auth_service.dart';
import 'package:attendanceapp/services/firestore_service.dart';
import 'package:stacked_services/stacked_services.dart';

@module
abstract class ThirdPartyServicesModule {
  @lazySingleton
  NavigationService get navigationService;

  @lazySingleton
  Authentication get authentication;

  @lazySingleton
  FireStoreService get fireStore;

  @lazySingleton
  SnackbarService get snackbarService;
}
