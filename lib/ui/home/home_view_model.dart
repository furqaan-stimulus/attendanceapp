import 'package:attendanceapp/app/lcoater.dart';
import 'package:attendanceapp/app/router.gr.dart';
import 'package:attendanceapp/models/either.dart';
import 'package:attendanceapp/services/auth_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final Authentication _authentication = locator<Authentication>();
  final NavigationService _navigationService = locator<NavigationService>();

  logOut() async {
    Either either = await _authentication.logOut();
    if (either.eventIsSuccess) {
      _navigationService.replaceWith(Routes.loginView);
    }
  }
}
