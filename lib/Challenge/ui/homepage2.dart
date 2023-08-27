import 'package:app/Challenge/shared/week_road_map.dart';
import 'package:app/core/shared/main_app_bar.dart';
import 'package:flutter/material.dart';

import '../components/body_bar.dart';

class HomePage2 extends StatefulWidget {
  const HomePage2({super.key});

  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      body: ListView(
        children: [
          BodyBar(),
          SizedBox(
            height: 32,
          ),
          //TODO : change name and create functions and pages to this where page day and night

          WeekRoadMap(),
          BodyBar(),
          SizedBox(
            height: 24,
          ),
          WeekRoadMap(),
        ],
      ),
    );
  }
}
