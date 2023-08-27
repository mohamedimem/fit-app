import 'package:flutter/material.dart';

import '../views/shared/appstyle.dart';

class NextPauseBtn extends StatelessWidget {
  const NextPauseBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.2),
                borderRadius: BorderRadius.all(Radius.circular(16))),
            height: MediaQuery.of(context).size.width * 0.15,
            width: MediaQuery.of(context).size.width * 0.15,
            child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    Icons.pause,
                    size: 35,
                    color: Colors.white,
                  ),
                ]),
          ),
          const VerticalDivider(
            thickness: 10,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.redAccent.withOpacity(0.7),
                borderRadius: BorderRadius.all(
                  Radius.circular(16),
                )),
            height: MediaQuery.of(context).size.width * 0.15,
            width: MediaQuery.of(context).size.width * 0.3,
            child: Center(
              child: Text(
                'Next',
                style: appstyle(22, Colors.white, FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
