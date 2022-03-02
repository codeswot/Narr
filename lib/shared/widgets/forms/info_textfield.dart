import 'package:flutter/material.dart';

class InfoTextField extends StatelessWidget {
  const InfoTextField({
    Key? key,
    this.data = '',
    this.value = '',
  }) : super(key: key);
  final String data, value;
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        enabled: false,
        hintText: '$data: $value',
        filled: true,
      ),
    );
  }
}
