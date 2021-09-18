import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:narr/core/services/service_injector/service_injectors.dart';
import 'package:narr/shared/globals/global_var.dart';
import 'package:narr/shared/widgets/cards/primary_card.dart';
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
              PrimaryCard(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/images/jpg/profile.jpg'),
                            radius: 45.0,
                          ),
                          SizedBox(height: 15.0),
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
                    ),
                    SizedBox(height: 25.0),
                    Observer(builder: (_) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.blue[100],
                                radius: 25,
                                child: Icon(
                                  Icons.people,
                                  color: Colors.blue,
                                ),
                              ),
                              SizedBox(width: 8),
                              Text(
                                '${usersOnline.usersOnlineList.length}',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text('Online'),
                            ],
                          ),
                          Column(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.green[100],
                                radius: 25,
                                child: Icon(
                                  Icons.insert_drive_file,
                                  color: Colors.green,
                                ),
                              ),
                              SizedBox(width: 8),
                              Text(
                                currentUser.user.totalUploads.toString(),
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text('Uploads'),
                            ],
                          ),
                        ],
                      );
                    }),
                    SizedBox(height: 25.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Details',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 24,
                          ),
                        ),
                        Divider(),
                        Row(
                          children: <Widget>[
                            Text(
                              'Email: ',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 18),
                            ),
                            Text(
                              currentUser.user.email,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                        SizedBox(height: 10.0),
                        Row(
                          children: <Widget>[
                            Text(
                              'Narr Email: ',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 18),
                            ),
                            Text(
                              currentUser.user.narrEmail,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                        SizedBox(height: 10.0),
                        Row(
                          children: <Widget>[
                            Text(
                              'Status: ',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 18),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 3,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.green[100],
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Text(
                                currentUser.user.status,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(color: Colors.green),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.0),
                        Row(
                          children: <Widget>[
                            Text(
                              'School: ',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 18),
                            ),
                            SizedBox(width: 4.0),
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
                            Text(
                              'Phone: ',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 18),
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
                            Text(
                              'Address: ',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 18),
                            ),
                            SizedBox(width: 4.0),
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
                            Text(
                              'DOB: ',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 18),
                            ),
                            SizedBox(width: 4.0),
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
                        SizedBox(height: 15),
                      ],
                    ),
                  ],
                ),
              ),
              PrimaryCard(
                child: Column(
                  children: [
                    ListTile(
                      leading: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.green[100],
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Icon(
                          Icons.settings,
                          color: Colors.green,
                        ),
                      ),
                      title: Text(
                        'Settings',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    ListTile(
                      leading: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.red[100],
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Icon(
                          Icons.account_balance_wallet,
                          color: Colors.red,
                        ),
                      ),
                      title: Text(
                        'Wallet Details',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      onTap: () {
                        narrService.routerService
                            .nextRoute(context, PaymentInfoScreen());
                      },
                    ),
                    ListTile(
                      leading: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.blue[100],
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Icon(
                          Icons.account_balance,
                          color: Colors.blue,
                        ),
                      ),
                      title: Text(
                        'Bank Details',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
            ],
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.upload),
      //   onPressed: () {},
      // ),
    );
  }
}
