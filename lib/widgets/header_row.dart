import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:attendanceapp/app/lcoater.dart';
import 'package:attendanceapp/services/auth_service.dart';

class NameHeader extends StatefulWidget {
  @override
  _NameHeaderState createState() => _NameHeaderState();
}

class _NameHeaderState extends State<NameHeader> {
  final Authentication _authentication = locator<Authentication>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            'Hello, ${_authentication.user.displayName}',
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            softWrap: false,
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30),
          ),
          Padding(padding: const EdgeInsets.all(5)),
          Text(
            toBeginningOfSentenceCase(
                '${"it's"}  ${DateFormat('EEEE, d MMMM').format(DateTime.now())}'),
            style: TextStyle(fontWeight: FontWeight.w300, fontSize: 18),
          ),
        ],
      ),
    );
  }
}
