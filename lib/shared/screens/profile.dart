import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:narr/shared/globals/configs.dart';
import 'package:narr/shared/globals/global_var.dart';
import 'package:narr/shared/widgets/cards/primary_card.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Widget build(BuildContext context) {
    // print(onlineUsers.numberOfUsersOnline);
    DateTime date = currentUser.user.lastLoggedIn;
    DateTime localDate = date.toLocal();
    String dateSlug =
        "${localDate.year.toString()}-${localDate.month.toString().padLeft(2, '0')}-${localDate.day.toString().padLeft(2, '0')}, ${localDate.hour}:${localDate.minute}";
    // print(dateSlug);
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
                margin: EdgeInsets.only(left: 15),
                child: Column(
                  children: [
                    Container(
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
                              // print('tap');
                              // Navigator.of(context).push(MaterialPageRoute(
                              //   builder: (context) => PaymentInfoScreen(),
                              // ));
                            },
                            child: Column(
                              children: [
                                Icon(
                                  Icons.account_balance_wallet,
                                  size: 30,
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
                                Icon(Icons.history, size: 30),
                                Text('Transaction History'),
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
                                Icon(Icons.person, size: 30),
                                Text('Personal info'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 32.0),
                    Container(
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
                                foregroundImage: NetworkImage(
                                  '$baseUrl${currentUser.user.institution.logo}',
                                ),
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
              SizedBox(
                height: 10,
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
                            child: Users(
                              name: '$onlineUserfullName',
                              userImage: 'images/profile.jpg',
                              institution: '',
                            ),
                          );
                        },
                        // children: usersOnlineWidgets,
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

class Users extends StatelessWidget {
  final String name;
  final String institution;

  final String userImage;
  Users(
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
                  (name != null) ? name : '',
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
            child: (userImage != null)
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset((userImage != null) ? userImage : ''))
                : Icon(Icons.person),
            backgroundColor: Color(0xff00a368),
          ),
        ],
      ),
    );
  }
}

class ReuseableCard extends StatelessWidget {
  final Widget child;
  ReuseableCard({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 12.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: child,
    );
  }
}
