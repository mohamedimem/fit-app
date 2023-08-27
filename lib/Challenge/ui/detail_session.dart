import 'package:flutter/material.dart';

import '../../core/shared/exercice_app_bar.dart';
import '../../core/views/ui/exercice_tile.dart';
import '../components/sun_day.dart';
import 'package:timelines/timelines.dart';

class DetailSession extends StatefulWidget {
  @override
  _DetailSessionState createState() => _DetailSessionState();
}

class _DetailSessionState extends State<DetailSession> {
  String selectedSession = "morning"; // Default to morning session

  List<String> morningWorkouts = ["Push-Ups", "Jumping Jacks", "Yoga"];
  List<String> nightWorkouts = ["Sit-Ups", "Stretching", "Meditation"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ExerciceAppBar(
          title: 'Day 1',
        ),
        body: Column(
          children: [
            ListView.builder(
              itemBuilder: (context, index) {
                return Center(
                  child: Container(
                    width: 360.0,
                    child: Card(
                      margin: EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Text('hello')),
                          Divider(height: 1.0),
                          Text('helloaaaa'),
                          Divider(height: 1.0),
                          Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Text('helloaaa22a')),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),

            // Tabs for Morning and Night sessions
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedSession = "morning";
                    });
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2,
                    padding: EdgeInsets.all(10),
                    color: selectedSession == "morning"
                        ? Colors.blue
                        : Colors.grey,
                    child: SunNightSession(
                      isSun: true,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedSession = "night";
                    });
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2,
                    padding: EdgeInsets.all(10),
                    color:
                        selectedSession == "night" ? Colors.blue : Colors.grey,
                    child: SunNightSession(
                      isSun: false,
                    ),
                  ),
                ),
              ],
            ),
            // List of Workouts based on selected session
            Expanded(
              child: ListView(
                children: selectedSession == "morning"
                    ? _buildWorkoutList(morningWorkouts)
                    : _buildWorkoutList(nightWorkouts),
              ),
            ),
          ],
        ),
        floatingActionButton: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Container(
                height: 70,
                width: 70,
                child: FittedBox(
                    child: FloatingActionButton(
                  elevation: 20,
                  backgroundColor: Color(0xff900C3F),
                  onPressed: () {
                    // Add your onPressed code here!
                  },
                  child: RotatedBox(
                      quarterTurns: 1,
                      child: const Icon(
                        Icons.change_history,
                        color: Colors.white,
                      )),
                )))));
  }

  List<Widget> _buildWorkoutList(List<String> workouts) {
    return [
      SizedBox(
        height: 32,
      ),
      ExerciceTile(
        imageString: 'assets/images/run.webp',
        nameExercice: 'Burpees',
      ),
      SizedBox(
        width: 8,
      ),
      ExerciceTile(
        imageString: 'assets/images/run.webp',
        nameExercice: 'Burpees',
      ),
    ];
  }
}
