import 'package:app/core/views/shared/polygone_table.dart';
import 'package:flutter/material.dart';

import 'appstyle.dart';

class NextPolygon extends StatelessWidget {
  const NextPolygon({super.key, required this.label, required this.isNext});
  final String label;
  final bool isNext;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        ClipPath(
          clipper: MyPolygon(),
          child: Container(
            color: Colors.black,
            height: MediaQuery.of(context).size.width * 0.11,
            width: MediaQuery.of(context).size.width * 0.11,
          ),
        ),
        isNext
            ? ClipPath(
                clipper: MyPolygon(),
                child: Container(
                  color: Colors.white,
                  height: MediaQuery.of(context).size.width * 0.09,
                  width: MediaQuery.of(context).size.width * 0.09,
                ))
            : ClipPath(
                clipper: MyPolygon(),
                child: Container(
                  color: Colors.white,
                  height: MediaQuery.of(context).size.width * 0.11,
                  width: MediaQuery.of(context).size.width * 0.11,
                )),
        Positioned(
          bottom: MediaQuery.of(context).size.height * 0.006,
          child: Text(
            label.toString(),
            style: appstyle(19, Colors.black, FontWeight.w500),
          ),
        ),
      ],
    );
  }
}
