import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:narr/shared/themes/colors.dart';

class AnalyticsCard extends StatelessWidget {
  const AnalyticsCard(
      {required this.title,
      required this.count,
      required this.onTap,
      this.color = NarrColors.royalGreen,
      required this.icon,
      required this.info});
  final String title;
  final String info;
  final String count;
  final VoidCallback onTap;
  final Color color;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 5),
                Icon(
                  icon,
                  color: NarrColors.royalGreen,
                  size: 20,
                ),
                SizedBox(width: 5),
                Text(
                  '$count',
                  style: TextStyle(
                    fontSize: 15,
                    color: color,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Image.asset(
              'assets/images/png/wave.png',
              width: double.infinity,
            )
          ],
        ),
      ),
    );
  }
}
