import 'dart:math';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:attendanceapp/models/log_types.dart';

class LogEntryButton extends StatefulWidget {
  final LogTypes type;
  final bool pressed;
  final bool firstLog;
  final Function() onPressed;

  const LogEntryButton({Key key, this.type, this.pressed, this.onPressed, this.firstLog})
      : super(key: key);

  @override
  _LogEntryButtonState createState() => _LogEntryButtonState();
}

class _LogEntryButtonState extends State<LogEntryButton>
    with SingleTickerProviderStateMixin {
  ConfettiController _controllerCenter;

  @override
  void initState() {
    _controllerCenter =
        ConfettiController(duration: const Duration(milliseconds: 100));
    super.initState();
  }

  @override
  void dispose() {
    _controllerCenter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.loose,
      children: [
        Positioned(
          width: 120,
          height: 120,
          child: Center(
            child: ConfettiWidget(
              maximumSize: Size(5, 5),
              gravity: 0.8,
              minimumSize: Size(2, 2),
              blastDirectionality: BlastDirectionality.explosive,
              confettiController: _controllerCenter,
              numberOfParticles: 25,
              child: Icon(
                Icons.arrow_back,
                color: widget.type == LogTypes.logOut
                    ? Color(0xff008BF8)
                    : Color(0xffF5B700),
              ),
            ),
          ),
        ),
        NeumorphicButton(
          tooltip: widget.type == LogTypes.logOut ? 'Mark in' : 'Mark Out',
          onPressed: widget.pressed
              ? () {}
              : () {
                  if (widget.firstLog) {
                    _controllerCenter.play();
                  }
                  widget.onPressed();
                },
          curve: Curves.ease,
          minDistance: -8,
          pressed: widget.pressed,
          style: NeumorphicStyle(
              depth: widget.pressed ? -8 : 8,
              shape: NeumorphicShape.convex,
              disableDepth: false,
              boxShape: NeumorphicBoxShape.circle()),
          padding: EdgeInsets.all(50),
          child: Transform.rotate(
            child: Icon(
              Icons.arrow_back,
              color: widget.type == LogTypes.logOut
                  ? Color(0xff008BF8)
                  : Color(0xffF5B700),
            ),
            angle:
                (pi / 180) * (widget.type == LogTypes.logOut ? -45 : (45 * 3)),
          ),
        ),
      ],
    );
  }
}
