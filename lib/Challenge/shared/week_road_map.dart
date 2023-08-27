import 'package:app/Challenge/shared/complete_day.dart';
import 'package:flutter/widgets.dart';

import 'day_start_widget.dart';
import 'day_widget.dart';
import 'next_day.dart';

class WeekRoadMap extends StatefulWidget {
  const WeekRoadMap({
    super.key,
  });

  @override
  State<WeekRoadMap> createState() => _WeekRoadMapState();
}

class _WeekRoadMapState extends State<WeekRoadMap> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height - 30,
      child: Stack(
        children: [
          Positioned(
              right: MediaQuery.of(context).size.width / 4,
              child: const CompleteDay(
                number: 1,
              )),
          Positioned(
              right: MediaQuery.of(context).size.width / 2 - 30,
              top: 110 - 30,
              child: DayStartWidget(
                isStart: false,
                number: 1,
              )),
          Positioned(
              right: 0,
              top: 220,
              child: Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(100))),
                child: Image.asset(
                  'assets/images/go.png',
                  height: 90,
                ),
              )),
          Positioned(
              right: MediaQuery.of(context).size.width / 2 + 30,
              top: 220,
              child: const NextDay(
                pourcentage: 0.0,
                number: 3,
              )),
          Positioned(
              right: MediaQuery.of(context).size.width / 2 + 10,
              top: 330,
              child: const NextDay(
                pourcentage: 0,
                number: 4,
              )),
          Positioned(
              right: MediaQuery.of(context).size.width / 2 - 50,
              top: 440,
              child: const NextDay(
                pourcentage: 0,
                number: 5,
              )),
          Positioned(
              right: MediaQuery.of(context).size.width / 2 - 100,
              top: 550,
              child: const NextDay(
                pourcentage: 0,
                number: 6,
              )),
          Positioned(
              right: MediaQuery.of(context).size.width / 2 - 80,
              top: 660,
              child: const NextDay(
                pourcentage: 0,
                number: 7,
              )),
        ],
      ),
    );
  }
}
