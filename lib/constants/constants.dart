import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';

class AppConstants {
  static const _kFontFam = 'MyFlutterApp';
  static const _kFontPkg = null;
  static const double controlViewHeight = 220;
  static const double appbarHeight = (kToolbarHeight + 16 * 2);

  static const IconData logo = IconData(0xe800, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData google = IconData(0xf1a0, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static NeumorphicThemeData lightTheme = neumorphicDefaultTheme.copyWith(
    textTheme: GoogleFonts.workSansTextTheme(),
  );
  static NeumorphicThemeData darkTheme = neumorphicDefaultTheme.copyWith(
    textTheme: GoogleFonts.workSansTextTheme(),
  );
  static double Function(BuildContext context, {bool nullOk}) loginLogoHeight =
      (BuildContext context, {bool nullOk: false}) => (MediaQuery.of(context).size.height / 3) * 2;
  static TextStyle normalText =
      TextStyle(fontSize: 18, fontWeight: FontWeight.w200, color: Color(0xff757575));

  static TextStyle appBarText = TextStyle(fontWeight: FontWeight.w200, color: Color(0xff757575));
  static List<Widget> noData = [
    Flexible(
      flex: 1,
      fit: FlexFit.tight,
      child: Container(
        padding: const EdgeInsets.only(left: 12.0, bottom: 0.0, top: 0, right: 12.0),
        child: FlareActor(
          "assets/images/empty.flr",
          alignment: Alignment.center,
          fit: BoxFit.contain,
          animation: "default",
        ),
      ),
    ),
    Container(height: 60, child: Text('No Entries'))
  ];
  static Widget listGradientOverLay = Container(
    width: double.maxFinite,
    height: 30,
    decoration: BoxDecoration(
        color: Colors.red,
        gradient: LinearGradient(colors: [
          NeumorphicColors.background,
          NeumorphicColors.background.withOpacity(0),
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
  );
}
