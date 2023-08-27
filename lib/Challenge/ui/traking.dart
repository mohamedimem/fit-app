import 'dart:math';

import 'package:app/core/shared/exercice_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';

import '../../core/views/ui/exercice_tile.dart';

const kTileHeight = 50.0;

const completeColor = Colors.green;
const inProgressColor = Color(0xffC70039);
const todoColor = Color(0xffd1d2d7);

class PackageDeliveryTrackingPage extends StatefulWidget {
  @override
  _PackageDeliveryTrackingPageState createState() =>
      _PackageDeliveryTrackingPageState();
}

class _PackageDeliveryTrackingPageState
    extends State<PackageDeliveryTrackingPage> {
  int _processIndex = 0;

  Color getColor(int index) {
    if (index == _processIndex) {
      return inProgressColor;
    } else if (index < _processIndex) {
      return completeColor;
    } else {
      return todoColor;
    }
  }

  String selectedSession = "morning"; // Default to morning session

  List<String> morningWorkouts = ["assets/images/run.webp"];
  List<String> nightWorkouts = ["Sit-Ups", "Stretching", "Meditation"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ExerciceAppBar(title: "Day 1"),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
            child: Timeline.tileBuilder(
              theme: TimelineThemeData(
                direction: Axis.horizontal,
                connectorTheme: ConnectorThemeData(
                  space: 30.0,
                  thickness: 5.0,
                ),
              ),
              builder: TimelineTileBuilder.connected(
                connectionDirection: ConnectionDirection.before,
                itemExtentBuilder: (_, __) =>
                    MediaQuery.of(context).size.width / _processes.length,
                oppositeContentsBuilder: (context, index) {
                  return Padding(
                      padding: const EdgeInsets.only(bottom: 15.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        child: Image.asset(
                          width: 50,
                          height: 50,
                          fit: BoxFit.fill,
                          _images[index],
                        ),
                      ));
                },
                contentsBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Text(
                      _processes[index],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: getColor(index),
                      ),
                    ),
                  );
                },
                indicatorBuilder: (_, index) {
                  var color;
                  var child;
                  if (index == _processIndex) {
                    color = inProgressColor;
                    child = Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircularProgressIndicator(
                        strokeWidth: 3.0,
                        valueColor: AlwaysStoppedAnimation(Colors.white),
                      ),
                    );
                  } else if (index < _processIndex) {
                    color = completeColor;
                    child = Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 15.0,
                    );
                  } else {
                    color = todoColor;
                  }

                  if (index <= _processIndex) {
                    return Stack(
                      children: [
                        CustomPaint(
                          size: Size(30.0, 30.0),
                          painter: _BezierPainter(
                            color: color,
                            drawStart: index > 0,
                            drawEnd: index < _processIndex,
                          ),
                        ),
                        DotIndicator(
                          size: 30.0,
                          color: color,
                          child: child,
                        ),
                      ],
                    );
                  } else {
                    return Stack(
                      children: [
                        CustomPaint(
                          size: Size(15.0, 15.0),
                          painter: _BezierPainter(
                            color: color,
                            drawEnd: index < _processes.length - 1,
                          ),
                        ),
                        OutlinedDotIndicator(
                          borderWidth: 4.0,
                          color: color,
                        ),
                      ],
                    );
                  }
                },
                connectorBuilder: (_, index, type) {
                  if (index > 0) {
                    if (index == _processIndex) {
                      final prevColor = getColor(index - 1);
                      final color = getColor(index);
                      List<Color> gradientColors;
                      if (type == ConnectorType.start) {
                        gradientColors = [
                          Color.lerp(prevColor, color, 0.5)!,
                          color
                        ];
                      } else {
                        gradientColors = [
                          prevColor,
                          Color.lerp(prevColor, color, 0.5)!
                        ];
                      }
                      return DecoratedLineConnector(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: gradientColors,
                          ),
                        ),
                      );
                    } else {
                      return SolidLineConnector(
                        color: getColor(index),
                      );
                    }
                  } else {
                    return null;
                  }
                },
                itemCount: _processes.length,
              ),
            ),
          ),
          Expanded(
            child: ListView(
                children: _processIndex == 0
                    ? _buildWorkoutList('assets/images/burpee_tile.png')
                    : _buildWorkoutList('assets/images/run.webp')),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_forward_ios),
        onPressed: () {
          setState(() {
            _processIndex = (_processIndex + 1) % _processes.length;
            print(_processIndex);
          });
        },
        backgroundColor: inProgressColor,
      ),
    );
  }
}

List<Widget> _buildWorkoutList(String image) {
  return [
    SizedBox(
      height: 32,
    ),
    ExerciceTile(
      imageString: image,
      nameExercice: 'Burpees',
    ),
    SizedBox(
      width: 8,
    ),
    ExerciceTile(
      imageString: image,
      nameExercice: 'Burpees',
    ),
  ];
}

/// hardcoded bezier painter
/// TODO: Bezier curve into package component
class _BezierPainter extends CustomPainter {
  const _BezierPainter({
    required this.color,
    this.drawStart = true,
    this.drawEnd = true,
  });

  final Color color;
  final bool drawStart;
  final bool drawEnd;

  Offset _offset(double radius, double angle) {
    return Offset(
      radius * cos(angle) + radius,
      radius * sin(angle) + radius,
    );
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..color = color;

    final radius = size.width / 2;

    var angle;
    var offset1;
    var offset2;

    var path;

    if (drawStart) {
      angle = 3 * pi / 4;
      offset1 = _offset(radius, angle);
      offset2 = _offset(radius, -angle);
      path = Path()
        ..moveTo(offset1.dx, offset1.dy)
        ..quadraticBezierTo(0.0, size.height / 2, -radius,
            radius) // TODO connector start & gradient
        ..quadraticBezierTo(0.0, size.height / 2, offset2.dx, offset2.dy)
        ..close();

      canvas.drawPath(path, paint);
    }
    if (drawEnd) {
      angle = -pi / 4;
      offset1 = _offset(radius, angle);
      offset2 = _offset(radius, -angle);

      path = Path()
        ..moveTo(offset1.dx, offset1.dy)
        ..quadraticBezierTo(size.width, size.height / 2, size.width + radius,
            radius) // TODO connector end & gradient
        ..quadraticBezierTo(size.width, size.height / 2, offset2.dx, offset2.dy)
        ..close();

      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(_BezierPainter oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.drawStart != drawStart ||
        oldDelegate.drawEnd != drawEnd;
  }
}

final _processes = [
  'Morning Work',
  'Night Work',
  'Challenge',
];

final _images = [
  'assets/images/sun.png',
  'assets/images/moon.png',
  'assets/images/gucci.png',
];
