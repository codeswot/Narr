import 'package:flutter/material.dart';

class ReadButton extends StatelessWidget {
  const ReadButton({required this.title, required this.onTap});
  final String title;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(left: 18, right: 18, top: 10, bottom: 10),
        decoration: BoxDecoration(
          border: Border.all(
            color: Color(0xff00a368),
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: Color(0xff00a368),
          ),
        ),
      ),
    );
  }
}
