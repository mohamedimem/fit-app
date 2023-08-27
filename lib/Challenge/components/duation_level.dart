import 'package:flutter/material.dart';

import '../../core/views/shared/appstyle.dart';

class DurationLevel extends StatelessWidget {
  const DurationLevel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 8),
          child: Column(
            children: [
              Text(
                'Duration',
                style: appstyle(18, Colors.grey.shade800, FontWeight.bold),
              ),
              Text(
                '9-15',
                style: appstyle(18, Colors.grey.shade600, FontWeight.bold),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                'Level',
                style: appstyle(18, Colors.grey.shade800, FontWeight.bold),
              ),
              Text(
                'Hard',
                style: appstyle(18, Colors.grey.shade600, FontWeight.bold),
              ),
            ],
          ),
        )
      ],
    );
  }
}
