import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:narr/core/services/service_injector/service_injectors.dart';
import 'package:narr/shared/globals/configs.dart';
import 'package:narr/shared/widgets/cards/primary_card.dart';

class Singleresearcher extends StatefulWidget {
  final String researcherId;
  Singleresearcher({required this.researcherId});

  @override
  _SingleresearcherState createState() => _SingleresearcherState();
}

class _SingleresearcherState extends State<Singleresearcher> {
  @override
  void initState() {
    super.initState();
    narrService.userService.getOneResearcher(widget.researcherId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<dynamic>(
        future: narrService.userService.getOneResearcher(widget.researcherId),
        builder: (context, snapshot) {
          var user = snapshot.data;
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return SafeArea(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {},
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage: AssetImage('images/profile.jpg'),
                          radius: 45.0,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              user['fullName'],
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 4.0,
                            ),
                            Text(
                              user['userRole'],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  PrimaryCard(
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Personal Information',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                        Divider(),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.person,
                              size: 20.0,
                            ),
                            SizedBox(
                              width: 4.0,
                            ),
                            Text(
                              user['fName'],
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.person,
                              size: 20.0,
                            ),
                            SizedBox(
                              width: 4.0,
                            ),
                            Text(
                              user['lName'],
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.email,
                              size: 20.0,
                            ),
                            SizedBox(
                              width: 4.0,
                            ),
                            Flexible(
                              child: Text(
                                user['email'],
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.phone,
                              size: 20.0,
                            ),
                            SizedBox(
                              width: 4.0,
                            ),
                            Text(
                              user['phone'],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.house,
                              size: 20.0,
                            ),
                            SizedBox(
                              width: 4.0,
                            ),
                            Flexible(
                              child: Text(
                                user['address'],
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.calendar_today,
                              size: 20.0,
                            ),
                            SizedBox(
                              width: 4.0,
                            ),
                            Text(
                              user['dob'],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          children: <Widget>[
                            Text('Last Login: '),
                            SizedBox(
                              width: 4.0,
                            ),
                            Text(
                              '20 munites ago',
                              style: TextStyle(color: Colors.orange),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  PrimaryCard(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Institution Information',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                        Divider(),
                        Row(
                          children: [
                            Image.network(
                              '$baseUrl${user['institution']['logo']}',
                              width: 60,
                            ),
                            SizedBox(width: 5),
                            Text(user['institution']['acronym'])
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.school,
                              size: 20.0,
                            ),
                            SizedBox(
                              width: 4.0,
                            ),
                            Flexible(
                              child: Text(
                                user['institution']['name'],
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.school,
                              size: 20.0,
                            ),
                            SizedBox(
                              width: 4.0,
                            ),
                            Text(
                              user['institution']['type'],
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.event,
                              size: 20.0,
                            ),
                            SizedBox(
                              width: 4.0,
                            ),
                            Text(
                              user['institution']['year'],
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.apartment,
                              size: 20.0,
                            ),
                            SizedBox(
                              width: 4.0,
                            ),
                            Text(
                              user['institution']['ownership'],
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.link,
                              size: 20.0,
                            ),
                            SizedBox(
                              width: 4.0,
                            ),
                            Flexible(
                              child: InkWell(
                                onTap: () => narrService.utilityService
                                    .launchURL(user['institution']['url']),
                                child: Text(
                                  user['institution']['url'],
                                  style: TextStyle(color: Colors.blue),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15)
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: SpeedDial(
        child: Icon(
          Icons.person,
          color: Colors.white,
        ),
        activeIcon: Icons.close,
        backgroundColor: Colors.blue,
        children: [
          SpeedDialChild(
            child: Icon(
              Icons.person_remove,
              color: Colors.white,
            ),
            label: 'Remove',
            backgroundColor: Colors.red,
          ),
          SpeedDialChild(
            child: Icon(
              Icons.how_to_reg,
              color: Colors.white,
            ),
            label: 'Activate',
            backgroundColor: Colors.green,
          ),
        ],
      ),
    );
  }
}
