import 'package:flutter/material.dart';
import 'package:narr/shared/widgets/cards/primary_card.dart';

class ResearchCard extends StatelessWidget {
  const ResearchCard({
    Key? key,
    required this.child,
    required this.cardHeader,
    required this.itemCount,
  }) : super(key: key);
  final Widget child;
  final String cardHeader;
  final int itemCount;
  @override
  Widget build(BuildContext context) {
    double height = 40;
    if (itemCount == 1) {
      height = 90;
    } else if (itemCount == 2) {
      height = 150;
    } else if (itemCount >= 3) {
      height = 250;
    } else {
      height = 40;
    }
    return PrimaryCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                cardHeader,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: () {
                  // Navigator.of(context).pushNamed(History.id);
                },
                child: Text(
                  'View More..',
                ),
              ),
            ],
          ),
          Divider(thickness: 1.2),
          SizedBox(height: 15),
          Container(
            // ignore: unnecessary_null_comparison
            height: (itemCount != null) ? height : 10,
            // ignore: unnecessary_null_comparison
            child: (child != null) ? child : Container(),
          )
        ],
      ),
    );
  }
}
