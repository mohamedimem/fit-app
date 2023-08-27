import 'package:flutter/material.dart';

import '../../core/shared/exercice_app_bar.dart';
import '../../core/views/ui/exercice_tile.dart';

class DetailPage extends StatefulWidget {
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
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
                    padding: EdgeInsets.all(10),
                    color: selectedSession == "morning"
                        ? Colors.blue
                        : Colors.grey,
                    child: Text(
                      "Morning",
                      style: TextStyle(
                        color: Colors.white,
                      ),
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
                    padding: EdgeInsets.all(10),
                    color:
                        selectedSession == "night" ? Colors.blue : Colors.grey,
                    child: Text(
                      "Night",
                      style: TextStyle(
                        color: Colors.white,
                      ),
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
