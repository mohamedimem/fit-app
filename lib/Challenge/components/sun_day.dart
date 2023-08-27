import 'package:flutter/material.dart';

import '../../core/views/shared/appstyle.dart';
import '../../core/views/shared/linear_progress_indicator.dart';
import '../../core/views/shared/start_btn.dart';

class SunNightSession extends StatelessWidget {
  const SunNightSession({
    super.key,
    required this.isSun,
  });
  final bool isSun;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            InkWell(
              onTap: () {},
              child: CircularProgressIndicator(
                backgroundColor: Colors.grey[300],
                valueColor: AlwaysStoppedAnimation(Colors.redAccent),
                value: 0.05,
                strokeWidth: 40,
              ),
            ),
            isSun
                ? CircleAvatar(
                    radius: 32,
                    backgroundImage: AssetImage('assets/images/sun.jpg'),
                  )
                : CircleAvatar(
                    radius: 32,
                    backgroundImage: AssetImage('assets/images/night.jpg'),
                  )
          ],
        ),
        SizedBox(
          height: 4,
        ),
        isSun
            ? Text('Morning Session',
                style: appstyle(14, Colors.redAccent, FontWeight.w600))
            : Text('Night Session',
                style: appstyle(14, Colors.redAccent, FontWeight.w600)),
      ],
    );
  }
}
