import 'package:flutter/material.dart';
import 'package:narr/core/services/service_injector/service_injectors.dart';
import 'package:narr/shared/screens/reader/reader.dart';

class ReadButton extends StatelessWidget {
  const ReadButton({required this.id, required this.title});
  final String id, title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        narrService.routerService.nextRoute(context, Reader(id));
      },
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
