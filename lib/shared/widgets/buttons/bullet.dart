import 'package:flutter/material.dart';

class MyBullet extends StatelessWidget {
  final Color color;
  MyBullet(this.color);
  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 15.0,
      width: 15.0,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}
