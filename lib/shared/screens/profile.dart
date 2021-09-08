import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:narr/shared/globals/global_var.dart';
import 'package:narr/shared/themes/colors.dart';
import 'package:narr/shared/widgets/cards/primary_card.dart';
import 'package:narr/shared/widgets/cards/single_user_online_card.dart';

import 'blockchain/payment_info_screen.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Widget build(BuildContext context) {
    DateTime date = currentUser.user.lastLoggedIn;
    DateTime localDate = date.toLocal();
    String dateSlug =
        "${localDate.year.toString()}-${localDate.month.toString().padLeft(2, '0')}-${localDate.day.toString().padLeft(2, '0')}, ${localDate.hour}:${localDate.minute}";
    return Scaffold(
      body: SafeArea(
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
                    onPressed: () {
                      // Navigator.pushNamed(context, EditProfile.id);
                    },
                  )
                ],
              ),
              Container(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/images/jpg/profile.jpg'),
                            radius: 45.0,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                currentUser.user.fullName,
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
                                currentUser.user.userRole,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                    PrimaryCard(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => PaymentInfoScreen(),
                              ));
                            },
                            child: Column(
                              children: [
                                Icon(
                                  Icons.account_balance_wallet,
                                  size: 30,
                                  color: NarrColors.royalGreen,
                                ),
                                Text('Wallet'),
                              ],
                            ),
                          ),
                          Container(
                              height: 50,
                              child: VerticalDivider(thickness: 2, width: 1.8)),
                          GestureDetector(
                            onTap: () {
                              // print('tap');
                              // Navigator.of(context).push(MaterialPageRoute(
                              //   builder: (context) =>
                              //       TransactionHistoryScreen(),
                              // ));
                            },
                            child: Column(
                              children: [
                                Icon(
                                  Icons.account_balance,
                                  size: 30,
                                  color: NarrColors.royalGreen,
                                ),
                                Text('Bank info'),
                              ],
                            ),
                          ),
                          Container(
                              height: 50,
                              child: VerticalDivider(thickness: 2, width: 1.8)),
                          GestureDetector(
                            onTap: () {
                              // print('tap');
                              // Navigator.of(context).push(MaterialPageRoute(
                              //   builder: (context) => PersonalInfo(currentUser),
                              // ));
                            },
                            child: Column(
                              children: [
                                Icon(
                                  Icons.person,
                                  size: 30,
                                  color: NarrColors.royalGreen,
                                ),
                                Text('Personal info'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    PrimaryCard(
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              CircleAvatar(
                                radius: 15,
                                child: Icon(Icons.email, size: 20.0),
                              ),
                              SizedBox(
                                width: 4.0,
                              ),
                              Text(
                                currentUser.user.email,
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
                              CircleAvatar(
                                radius: 15,
                                child: Icon(Icons.school, size: 20.0),
                              ),
                              SizedBox(
                                width: 4.0,
                              ),
                              Text(
                                currentUser.user.institution.name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                          SizedBox(height: 10.0),
                          Row(
                            children: <Widget>[
                              CircleAvatar(
                                radius: 15,
                                child: Icon(Icons.phone, size: 20.0),
                              ),
                              SizedBox(
                                width: 4.0,
                              ),
                              Text(
                                currentUser.user.phone,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            children: <Widget>[
                              CircleAvatar(
                                radius: 15,
                                child: Icon(Icons.house, size: 20.0),
                              ),
                              SizedBox(
                                width: 4.0,
                              ),
                              Text(
                                currentUser.user.address,
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
                              CircleAvatar(
                                radius: 15,
                                child: Icon(Icons.calendar_today, size: 20.0),
                              ),
                              SizedBox(
                                width: 4.0,
                              ),
                              Text(
                                currentUser.user.dob.toString(),
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
                                dateSlug,
                                style: TextStyle(color: Colors.orange),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            children: <Widget>[
                              Text('Total Upload'),
                              SizedBox(
                                width: 4.0,
                              ),
                              Text(
                                currentUser.user.totalUploads.toString(),
                                style: TextStyle(color: Colors.orange),
                              ),
                            ],
                          ),
                          SizedBox(height: 15),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Observer(builder: (_) {
                return PrimaryCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Users Online',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '${usersOnline.usersOnlineList.length} Online',
                            style: TextStyle(
                              color: Color(0xff00a368),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: usersOnline.usersOnlineList.length,
                        itemBuilder: (context, index) {
                          var onlineUserfullName =
                              usersOnline.usersOnlineList[index]['fullName'];

                          return GestureDetector(
                            onTap: () {},
                            child: UsersOnlineCard(
                              name: '$onlineUserfullName',
                              userImage: 'assets/images/jpg/profile.jpg',
                              institution: '',
                            ),
                          );
                        },
                        // children: usersOnlineCardOnlineWidgets,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                );
              }),
              SizedBox(height: 15),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.upload),
        onPressed: () {},
      ),
    );
  }
}
