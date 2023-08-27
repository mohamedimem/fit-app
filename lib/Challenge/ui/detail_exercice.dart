import 'package:app/core/shared/exercice_app_bar.dart';
import 'package:app/core/views/shared/appstyle.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';

import '../../core/shared/next_pause_btn.dart';

class DetailedExercice extends StatefulWidget {
  DetailedExercice({super.key});

  @override
  State<DetailedExercice> createState() => _DetailedExerciceState();
}

class _DetailedExerciceState extends State<DetailedExercice> {
  final CountDownController _controller = CountDownController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 70,
          width: 70,
          child: FittedBox(
            child: FloatingActionButton(
              elevation: 20,
              backgroundColor: Colors.black,
              onPressed: () {
                // Add your onPressed code here!
              },
              child: RotatedBox(
                  quarterTurns: 1,
                  child: const Icon(
                    Icons.change_history,
                    color: Colors.white,
                  )),
            ),
          ),
        ),
      ),
      appBar: ExerciceAppBar(
        title: 'Morning Session',
      ),
      body: Container(
        child: Column(
          children: [
            Image.asset(
              'assets/goggins/burpee.gif',
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            Container(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Column(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'Abs',
                                style: appstyle(
                                    30, Colors.grey.shade900, FontWeight.bold),
                              ),
                              Text(
                                'x 40',
                                style:
                                    appstyle(30, Colors.black, FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        const Divider(),
                        Text('Scored time'),
                      ]),
                    ),
                    InkWell(
                      onTap: () {
                        _controller.start();
                      },
                      onSecondaryTap: () {
                        _controller.pause();
                      },
                      child: CircularCountDownTimer(
                        duration: 900,
                        initialDuration: 0,
                        controller: _controller,
                        width: MediaQuery.of(context).size.width * 0.2,
                        height: MediaQuery.of(context).size.height * 0.2,
                        ringColor: Colors.grey[300]!,
                        ringGradient: null,
                        fillColor: Colors.purpleAccent[100]!,
                        fillGradient: null,
                        backgroundColor: Colors.purple[500],
                        backgroundGradient: null,
                        strokeWidth: 20.0,
                        strokeCap: StrokeCap.round,
                        textStyle: TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                        isReverse: false,
                        isReverseAnimation: false,
                        isTimerTextShown: true,
                        autoStart: false,
                        textFormat: CountdownTextFormat.HH_MM_SS,
                        onStart: () {
                          print('hello');
                        },
                        onComplete: () {
                          debugPrint('Countdown Ended');
                        },
                        onChange: (String timeStamp) {
                          debugPrint('Countdown Changed $timeStamp');
                        },
                        timeFormatterFunction:
                            (defaultFormatterFunction, duration) {
                          if (duration.inSeconds == 0) {
                            return "Start";
                          } else {
                            return Function.apply(
                                defaultFormatterFunction, [duration]);
                          }
                        },
                      ),
                    ),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
