import 'package:app/core/views/shared/appstyle.dart';
import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(65);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 120,
      backgroundColor: const Color(0xff900C3F),
      elevation: 1.5,
      leading: flag(),
      title: Row(
        children: [
          const Padding(padding: EdgeInsets.all(2)),
          crown(136),
          const Padding(padding: EdgeInsets.all(20)),
        ],
      ),
      actions: [
        heart(20),
      ],
    );
  }

  Widget heart(int n) {
    return Row(
      children: [
        Container(
          child: Image.asset(
            'assets/images/gem.png',
            width: 36,
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(2),
        ),
        Text('$n', style: appstyle(18, Colors.redAccent, FontWeight.bold)),
        const Padding(
          padding: EdgeInsets.all(5),
        ),
      ],
    );
  }

  Widget crown(int n) {
    return Row(
      children: [
        Image.asset(
          'assets/images/crown.png',
          width: 30,
        ),
        const Padding(
          padding: EdgeInsets.all(4),
        ),
        Text(
          '$n',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFFFFC800),
          ),
        )
      ],
    );
  }

  Widget flag() {
    return Container(
      margin: const EdgeInsets.only(left: 14, top: 18, bottom: 18),
      decoration: BoxDecoration(
        color: const Color(0xff900C3F),
        image: const DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/images/english_flag.png'),
          // fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          width: 1.5,
          color: const Color(0xFFE5E5E5),
        ),
      ),
      child: null /* add child content here */,
    );
  }
}
