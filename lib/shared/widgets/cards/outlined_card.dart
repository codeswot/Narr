import 'package:flutter/material.dart';

class OutlinedContainer extends StatelessWidget {
  final Widget child;
  const OutlinedContainer({Key? key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 0.1),
        color: Colors.white,
      ),
      child: child,
    );
  }
}
