import 'package:flutter/material.dart';

import '../../core/views/shared/appstyle.dart';

class BodyBar extends StatelessWidget {
  const BodyBar({
    super.key,
  });
  //TODO : create the button function and page for this story of week 1

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.15,
      color: const Color(0xff900C3F),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Week 1',
                      style: appstyle(
                          22, const Color(0xffF8DE22), FontWeight.bold),
                    ),
                    Wrap(
                      children: [
                        Text(
                          'Too exhausting week , this is like hell for you',
                          style: appstyle(
                              19, const Color(0xffF8DE22), FontWeight.w500),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  fixedSize: Size(50, 50),
                  backgroundColor: const Color(0xff900C3F),
                  side: const BorderSide(width: 3, color: Colors.brown),
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onPressed: () {
                  // Code to execute when this button is pressed.
                },
                child: Align(
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.menu_book,
                    size: 35,
                    color: Colors.yellow,
                  ),
                ),
              )
            ]),
      ),
    );
  }
}
