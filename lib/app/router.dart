import 'package:auto_route/auto_route_annotations.dart';
import 'package:attendanceapp/ui/all_logs/all_logs_view.dart';
import 'package:attendanceapp/ui/home/home_view.dart';
import 'package:attendanceapp/ui/login/login_view.dart';
import 'package:attendanceapp/ui/splash/splash_view.dart';

@MaterialAutoRouter(routes: <AutoRoute>[
  MaterialRoute(page: SplashView, initial: true),
  MaterialRoute(page: LoginView),
  MaterialRoute(page: HomeView),
  MaterialRoute(page: AllLogsView),
])
class $Router {
  // @initial
  // SplashView startRoute;
  // HomeView homeRoute;
  // LoginView loginView;
  // AllLogsView allLogsView;
}
