import 'package:flutter/material.dart';

import 'appstyle.dart';

class StartButton extends StatelessWidget {
  const StartButton({
    super.key,
    this.onTap,
  });

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.width * 0.17,
      child: ElevatedButton(
        onPressed: onTap,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(appColorsRed()),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          )),
        ),
        child: Text(
          'Start',
          style: appstyle(22, appColorsYellow(), FontWeight.w600),
        ),
      ),
    );
  }
}
