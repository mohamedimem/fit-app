import 'package:flutter/material.dart';

import '../../core/views/shared/appstyle.dart';

class DayWidget extends StatelessWidget {
  const DayWidget({
    super.key,
    required this.number,
    required this.isStart,
  });
  final int number;
  final bool isStart;

  @override
  Widget build(BuildContext context) {
    return const Material(
      borderRadius: BorderRadius.all(Radius.circular(40)),
      clipBehavior: Clip.none,
      elevation: 20,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CircularProgressIndicator(
            backgroundColor: Colors.white,
            valueColor: AlwaysStoppedAnimation(Colors.redAccent),
            value: 0.5,
            strokeWidth: 60,
          ),
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 43,
          ),
          CircleAvatar(
            backgroundImage: AssetImage('assets/images/gem.png'),
            radius: 42,
          )
        ],
      ),
    );
  }
}
