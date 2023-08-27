import 'package:app/Challenge/components/sun_day.dart';
import 'package:app/core/shared/animated_route.dart';
import 'package:app/core/views/shared/start_btn.dart';
import 'package:app/Challenge/ui/detail_exercice.dart';
import 'package:flutter/material.dart';

import '../../core/shared/exercice_app_bar.dart';
import '../components/duation_level.dart';
import '../../core/views/shared/appstyle.dart';
import '../../core/views/shared/linear_progress_indicator.dart';
import 'detail_session.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final List<Widget> sessions = [
    CircleAvatar(
      radius: 15,
      backgroundImage: AssetImage('assets/images/sun.jpg'),
    ),
    CircleAvatar(
      radius: 15,
      backgroundImage: AssetImage('assets/images/night.jpg'),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ExerciceAppBar(
          title: 'Day 1',
        ),
        body: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SunNightSession(
                    isSun: true,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Divider(
                      height: 1,
                    ),
                  ),
                  const SunNightSession(
                    isSun: false,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  sessions[0],
                                  Text(
                                    'Prepare for a Run',
                                    style: appstyle(
                                        22, appColorsRed(), FontWeight.bold),
                                  ),
                                ],
                              ),
                              Text(
                                '6%',
                                style: appstyle(
                                    22, appColorsRed(), FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          LinearPercentIndicator(
                            fillColor: Colors.white,
                            percent: 0.06,
                            padding: EdgeInsets.zero,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: StartButton(
                        onTap: () {
                          Navigator.push(
                              context, AnimatedRoute(DetailSession()));
                        },
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
