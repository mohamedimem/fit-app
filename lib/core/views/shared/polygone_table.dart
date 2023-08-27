import 'package:app/core/views/shared/next_polygone.dart';
import 'package:app/Challenge/ui/detail_page.dart';
import 'package:flutter/material.dart';

import '../../shared/animated_route.dart';

class Polygone_table extends StatelessWidget {
  const Polygone_table({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = List.generate(30, (index) {
      index += 1;
      return InkWell(
        onTap: () {
          Navigator.push(context, AnimatedRoute(DetailPage()));
        },
        child: NextPolygon(
          label: '$index',
          isNext: true,
        ),
      );
    });
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: widgets,
    );
  }
}

class MyPolygon extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.addPolygon([
      Offset(0, size.height * 1 / 3),
      Offset(size.width / 2, 0),
      Offset(size.width, size.height * 1 / 3),
      Offset(size.width * 4 / 5, size.height),
      Offset(size.width * 1 / 5, size.height),
    ], true);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
