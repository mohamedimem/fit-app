import 'package:app/Challenge/shared/day_widget.dart';
import 'package:app/Challenge/ui/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:shape_of_view_null_safe/shape_of_view_null_safe.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

import '../../core/shared/animated_route.dart';
import '../../core/views/shared/appstyle.dart';
import '../ui/detail_session.dart';
import '../ui/traking.dart';

// ignore: must_be_immutable
class DayStartWidget extends StatefulWidget {
  DayStartWidget({
    super.key,
    required this.number,
    required this.isStart,
  });
  final int number;
  final bool isStart;

  @override
  State<DayStartWidget> createState() => _DayStartWidgetState();
}

class _DayStartWidgetState extends State<DayStartWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.height);
    return InkWell(
      onTap: () {
        Navigator.push(context, AnimatedRoute(PackageDeliveryTrackingPage()));
      },
      child: Container(
        height: MediaQuery.of(context).size.height / 7.2,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Positioned(top: 20, child: DayWidget(number: 1, isStart: true)),
            WidgetAnimator(
                incomingEffect:
                    WidgetTransitionEffects.incomingSlideInFromBottom(),
                atRestEffect: WidgetRestingEffects.wave(),
                child: ShapeOfView(
                  shape: BubbleShape(
                      position: BubblePosition.Bottom,
                      arrowPositionPercent: 0.5,
                      borderRadius: 10,
                      arrowHeight: 10,
                      arrowWidth: 10),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Let\'s start ',
                      style: appstyle(22, Colors.red, FontWeight.w700),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
