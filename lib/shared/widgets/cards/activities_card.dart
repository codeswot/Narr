import 'package:flutter/material.dart';

class ActivitiesCard extends StatefulWidget {
  final Color color;
  final IconData icon;
  final String title;
  final Function()? onTap;
  ActivitiesCard(
      {required this.color,
      required this.icon,
      required this.title,
      this.onTap});
  @override
  _ActivitiesCardState createState() => _ActivitiesCardState();
}

class _ActivitiesCardState extends State<ActivitiesCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: widget.color,
              ),
              child: Icon(
                widget.icon,
                size: 20,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 8),
          Text(
            widget.title,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
