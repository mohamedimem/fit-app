import 'package:flutter/material.dart';

import '../../core/views/shared/appstyle.dart';

class NextDay extends StatelessWidget {
  const NextDay({
    super.key,
    required this.number,
    required this.pourcentage,
  });
  final int number;
  final double pourcentage;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.all(Radius.circular(50)),
      child: Stack(
        alignment: Alignment.center,
        children: [
          CircularProgressIndicator(
            backgroundColor: Colors.grey[300],
            valueColor: AlwaysStoppedAnimation(Colors.redAccent),
            value: pourcentage,
            strokeWidth: 62,
          ),
          CircleAvatar(
            radius: 44,
            backgroundImage: AssetImage('assets/images/calendar.png'),
          ),
          Positioned(
            bottom: 27,
            child: Text(
              '${number}',
              style: appstyle(22, Colors.deepOrange, FontWeight.bold),
            ),
          ),
          Positioned(
            bottom: 10,
            right: 10,
            child: Icon(
              Icons.lock,
              color: Colors.redAccent,
              size: MediaQuery.of(context).size.height / 40,
            ),
          ),
        ],
      ),
    );
  }
}
