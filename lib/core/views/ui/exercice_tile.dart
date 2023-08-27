import 'package:app/core/views/shared/appstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ExerciceTile extends StatelessWidget {
  const ExerciceTile(
      {super.key, required this.imageString, required this.nameExercice});
  final String imageString;
  final String nameExercice;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Material(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          elevation: 2,
          child: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8))),
            height: MediaQuery.sizeOf(context).height * 0.13,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          bottomLeft: Radius.circular(8)),
                      child: Image.asset(
                        imageString,
                        width: MediaQuery.sizeOf(context).width * 0.35,
                        height: MediaQuery.sizeOf(context).width * 0.3,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      width: 24,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Burpees",
                          style: appstyle(22, Colors.black, FontWeight.bold),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.timelapse,
                              color: Colors.green,
                            ),
                            Text('73 min')
                          ],
                        ),
                        Row(
                          children: [
                            Icon(color: Colors.red, Icons.rocket_launch),
                            Text('Medium')
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
