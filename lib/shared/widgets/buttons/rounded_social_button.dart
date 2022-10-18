import 'package:flutter/material.dart';

class RoundedSocialButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final Color iconColor;
  const RoundedSocialButton(
      {super.key, required this.icon, required this.onPressed, required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      shape: const CircleBorder(),
      elevation: 4.0,
      disabledElevation: 4.0,
      fillColor: Colors.white,
      constraints: const BoxConstraints(minWidth: 34.0, minHeight: 34.0),
      onPressed: onPressed,
      child: Icon(
        icon,
        size: 18,
        color: iconColor,
      ),
    );
  }
}
