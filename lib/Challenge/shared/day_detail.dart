import 'package:flutter/material.dart';

class DayDetails extends StatelessWidget {
  const DayDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 2,
            color: Colors.green,
          ),
          Container(
            height: MediaQuery.of(context).size.height / 2,
            color: Colors.black,
          )
        ],
      ),
    );
  }
}
