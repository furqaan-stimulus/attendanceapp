import 'package:attendanceapp/app/lcoater.dart';
import 'package:attendanceapp/app/router.gr.dart';
import 'package:attendanceapp/models/either.dart';
import 'package:attendanceapp/services/auth_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends BaseViewModel {
  final Authentication _authentication = locator<Authentication>();
  final NavigationService _navigationService = locator<NavigationService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();

  login() async {
    setBusy(true);
    Either success = await _authentication.login();
    setBusy(false);
    if (!success.eventHasError) {
      if (success.eventIsSuccess) {
        _navigationService.replaceWith(Routes.homeView);
      }
    } else {
      _snackbarService.showSnackbar(message: success.getErrMsg);
    }
  }
}
