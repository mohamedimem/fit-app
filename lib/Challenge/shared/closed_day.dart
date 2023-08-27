import 'package:flutter/material.dart';

import '../../core/views/shared/appstyle.dart';

class ClosedDayWidget extends StatelessWidget {
  const ClosedDayWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      borderRadius: BorderRadius.all(Radius.circular(50)),
      child: Container(
        child: CircleAvatar(
          backgroundImage: AssetImage('assets/images/locke.webp'),
          radius: 46,
        ),
        decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
      ),
    );
  }
}
