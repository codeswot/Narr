import 'package:flutter/material.dart';
import 'package:narr/shared/widgets/cards/primary_card.dart';

class ResearchCard extends StatelessWidget {
  const ResearchCard({
    Key? key,
    required this.child,
    required this.cardHeader,
    required this.itemCount,
    this.viewMoreTap,
  }) : super(key: key);
  final Widget child;
  final String cardHeader;
  final int itemCount;
  final Function()? viewMoreTap;
  @override
  Widget build(BuildContext context) {
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
                onTap: viewMoreTap,
                child: Text(
                  'View More..',
                ),
              ),
            ],
          ),
          Divider(thickness: 1.2),
          Container(
            height: 200,
            child: child,
          )
        ],
      ),
    );
  }
}
