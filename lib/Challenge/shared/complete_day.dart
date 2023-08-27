import 'package:flutter/material.dart';

class CompleteDay extends StatelessWidget {
  const CompleteDay({
    super.key,
    required this.number,
  });
  final int number;

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
            value: 1,
            strokeWidth: 62,
          ),
          CircleAvatar(
            radius: 44,
            backgroundImage: AssetImage('assets/images/Checkmark.png'),
          ),
        ],
      ),
    );
  }
}
