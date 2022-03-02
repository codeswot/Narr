import 'package:flutter/material.dart';

class UsersOnlineCard extends StatelessWidget {
  final String name;
  final String institution;

  final String userImage;
  UsersOnlineCard(
      {required this.name, required this.institution, required this.userImage});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      margin: EdgeInsets.only(bottom: 15),
      // height: 65,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 120,
                child: Text(
                  name,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16.0,
                  ),
                ),
              ),
              Container(
                width: 130,
                child: Text(
                  'Online',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Color(0xff00a368),
                  ),
                ),
              ),
            ],
          ),
          CircleAvatar(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset(userImage),
            ),
            backgroundColor: Color(0xff00a368),
          ),
        ],
      ),
    );
  }
}
