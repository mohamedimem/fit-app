import 'package:app/core/shared/exercice_app_bar.dart';
import 'package:app/core/views/shared/appstyle.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import '../../core/shared/main_app_bar.dart';

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // generate mock data
    var ranks = List<int>.generate(30, (i) => i + 1);
    Random random = Random();
    var xps = List<int>.generate(30, (i) => random.nextInt(1000));
    var nameList = [
      'White',
      'Red',
      'Blue',
      'Yellow',
      'Cyan',
      'Black',
      'Pink',
      'Purple'
    ];
    var imageList = [
      'white.png',
      'profile.jpg',
      'green.png',
      'cyan.png',
      'yellow.png'
    ];

    var names = List<String>.generate(
        30, (i) => nameList[random.nextInt(nameList.length)]);
    var images = List<String>.generate(30,
        (i) => 'assets/images/' + imageList[random.nextInt(imageList.length)]);

    return Scaffold(
      appBar: const MainAppBar(),
      body: ListView(
        children: [
          const TopAvatar(),
          SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 64),
            child: Divider(),
          ),
          BodyBar(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 64),
            child: Divider(),
          ),
          Expanded(
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
// 4
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              primary: false,
              itemCount: 30,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  contentPadding: const EdgeInsets.only(top: 17),
                  horizontalTitleGap: 12,
                  leading: rank(ranks[index]),
                  title: avatarWithName(images[index], names[index]),
                  trailing: xpAmount(xps[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  xpAmount(int xp) {
    return Container(
      margin: const EdgeInsets.only(right: 15),
      child: Text(
        '$xp XP',
        style: const TextStyle(fontSize: 17),
      ),
    );
  }

  avatarWithName(String image, String name) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          avatar(image),
          const Padding(padding: EdgeInsets.only(right: 20)),
          friendName(name),
        ],
      ),
    );
  }

  friendName(String name) {
    return Text(
      name,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        color: Color(0xFF4B4B4B),
        fontSize: 20,
      ),
    );
  }

  avatar(String image) {
    return Container(
      // padding: const EdgeInsets.only(top: 5),
      // margin: const EdgeInsets.only(bottom: 10),
      child: CircleAvatar(
        backgroundImage: AssetImage(image),
        radius: 22,
      ),
    );
  }

  rank(int rank) {
    return Container(
      margin: const EdgeInsets.only(left: 15),
      child: Text(
        '$rank',
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Color(0xFF58CC02),
        ),
      ),
    );
  }
}

class BodyBar extends StatelessWidget {
  const BodyBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Text(
                  'in the top 1%',
                  style: appstyle(12, Color(0xFFFFFFFF), FontWeight.w600),
                ),
                Text(
                  '97654',
                  style: appstyle(20, Color(0xff900C3F), FontWeight.w600),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.groups_2,
                      size: 21,
                      color: Color(0xff900C3F),
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Text(
                      'Users',
                      style: appstyle(16, Color(0xff900C3F), FontWeight.w500),
                    ),
                  ],
                )
              ],
            ),
            Column(
              children: [
                Text(
                  'in the top 1%',
                  style: appstyle(12, Color(0xffF94C10), FontWeight.w600),
                ),
                Text(
                  '90',
                  style: appstyle(20, Color(0xff900C3F), FontWeight.w600),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.emoji_events,
                      color: Color(0xff900C3F),
                      size: 18,
                    ),
                    Text(
                      'Rank',
                      style: appstyle(16, Color(0xff900C3F), FontWeight.w500),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ],
    );
  }
}

class TopAvatar extends StatelessWidget {
  const TopAvatar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircleAvatarLeaderboard(
            radius: 40,
            height: 12,
            width: 12,
            rank: 3,
          ),
          CircleAvatarLeaderboard(
            radius: 60,
            height: 0,
            width: 0,
            rank: 1,
          ),
          CircleAvatarLeaderboard(
            rank: 2,
            radius: 40,
            height: 12,
            width: 12,
          ),
        ],
      ),
    );
  }
}

class CircleAvatarLeaderboard extends StatelessWidget {
  const CircleAvatarLeaderboard({
    super.key,
    required this.radius,
    required this.height,
    required this.width,
    required this.rank,
  });
  final int rank;
  final double radius;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Stack(
            children: [
              CircleAvatar(
                radius: radius,
                backgroundImage: const AssetImage('assets/images/goggins.png'),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                    child: Center(
                        child: Text('$rank',
                            style:
                                appstyle(12, Colors.black, FontWeight.w600))),
                    height: 42 - height,
                    width: 42 - width,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage('assets/images/crown.png'),
                    ))),
              ),
            ],
          ),
        ),
        Text('jackson mary', style: appstyle(12, Colors.black, FontWeight.w600))
      ],
    );
  }
}
