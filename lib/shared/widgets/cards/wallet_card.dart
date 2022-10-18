import 'package:flutter/material.dart';

class WalletCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color;
  const WalletCard(
      {required this.icon, required this.title, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 2.4),
            blurRadius: 5,
            color: Colors.grey.withOpacity(0.25),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: color,
            child: Icon(
              icon,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 8),
          Text(title)
        ],
      ),
    );
  }
}
