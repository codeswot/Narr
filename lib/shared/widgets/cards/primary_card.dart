import 'package:flutter/material.dart';

class PrimaryCard extends StatelessWidget {
  final Widget child;
  PrimaryCard({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 9),
      padding: EdgeInsets.only(
        top: 15,
        bottom: 15,
        left: 15,
        right: 15,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 2.4),
            blurRadius: 5,
            color: Colors.grey.withOpacity(0.25),
          ),
        ],
      ),
      child: child,
    );
  }
}
