import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:narr/core/services/service_injector/service_injectors.dart';
import 'package:narr/shared/globals/global_var.dart';
import 'package:narr/shared/screens/auth_screen/login.dart';
import 'package:narr/shared/themes/colors.dart';
import 'package:narr/shared/widgets/drawer/custom_expansion_tile.dart';

class DrawerItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 15),
            height: 100,
            color: determinePrimaryColor(context),
            child: Center(
              child: Image.asset(
                'assets/images/png/narr.png',
                width: 200,
              ),
            ),
          ),
          Flexible(
            child: Container(
              child: ListView(
                children: [
                  (currentUser.user.userRole == 'researcher')
                      ? ListTile(
                          leading: Icon(Icons.home),
                          title: Text('Home'),
                          enabled: true,
                          onTap: () {
                            // Navigator.of(context)
                            //     .pushReplacementNamed(HomeScreen.id);
                            // Update the state of the app.
                            // ...
                          },
                        )
                      : Container(),
                  //
                  (currentUser.user.userRole == 'admin')
                      ? ListTile(
                          leading: Icon(Icons.dashboard),
                          title: Text('Dashboard'),
                          enabled: true,
                          onTap: () {
                            // Navigator.of(context)
                            //     .pushReplacementNamed(AdminDashBoard.id);
                            // Update the state of the app.
                            // ...

                            // Navigator.of(context)
                            //     .popAndPushNamed(AdminDashBoard.id);
                          },
                        )
                      : Container(),
                  (currentUser.user.userRole == 'sponsor')
                      ? ListTile(
                          leading: Icon(Icons.dashboard),
                          title: Text('Dashboard'),
                          enabled: true,
                          onTap: () {
                            // Navigator.of(context).pushReplacementNamed(HomeScreen.id);
                            // Update the state of the app.
                            // ...
                            // Navigator.of(context)
                            //     .pushReplacementNamed(SponsorDashboard.id);
                            // Navigator.of(context)
                            //     .popAndPushNamed(SponsorDashboard.id);
                          },
                        )
                      : Container(),
                  (currentUser.user.userRole == 'investor')
                      ? ListTile(
                          leading: Icon(Icons.dashboard),
                          title: Text('Dashboard'),
                          enabled: true,
                          onTap: () {
                            // Navigator.of(context)
                            //     .pushReplacementNamed(InvestorDashboard.id);
                            // Update the state of the app.
                            // ...

                            // Navigator.of(context)
                            //     .popAndPushNamed(InvestorDashboard.id);
                          },
                        )
                      : Container(),
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text('Profile'),
                    onTap: () {
                      // Navigator.of(context).popAndPushNamed(Profile.id);
                      // Update the state of the app.
                      // ...
                    },
                  ),
                  ListTile(
                    leading: Icon(FontAwesomeIcons.database),
                    title: Text('Repository'),
                    onTap: () {
                      // Navigator.of(context)
                      //     .popAndPushNamed(RepositoryList.id);
                      // Update the state of the app.
                      // ...
                    },
                  ),
                  (currentUser.user.userRole == 'admin')
                      ? CustomExpansionTile(
                          title: Text('Manage'),
                          children: <Widget>[
                            ListTile(
                              leading: Icon(Icons.people),
                              title: Text('Researchers'),
                              onTap: () {
                                // ...
                                // Navigator.of(context)
                                //     .popAndPushNamed(Researchers.id);
                              },
                            ),
                            ListTile(
                              leading: Icon(Icons.person),
                              title: Text('Administrators'),
                              onTap: () {
                                // ...
                                // Navigator.of(context)
                                //     .popAndPushNamed(Administrators.id);
                              },
                            ),
                            ListTile(
                              leading: Icon(Icons.school),
                              title: Text('Institutions'),
                              onTap: () {
                                // ...
                                // Navigator.of(context)
                                //     .popAndPushNamed(AllInstitution.id);
                              },
                            ),
                          ],
                        )
                      : Container(),
                  ListTile(
                    leading: Icon(Icons.history),
                    title: Text('Reading History'),
                    onTap: () {
                      // Navigator.of(context).popAndPushNamed(History.id);
                      // Update the state of the app.
                      // ...
                    },
                  ),

                  (currentUser.user.userRole == 'researcher' ||
                          currentUser.user.userRole == 'admin')
                      ? CustomExpansionTile(
                          title: Text('Grants & Funding'),
                          children: <Widget>[
                            ListTile(
                              leading: Icon(Icons.import_contacts),
                              title: Text('Grants'),
                              onTap: () {
                                // ...
                                // Navigator.of(context)
                                //     .popAndPushNamed(Grants.id);
                              },
                            ),
                            ListTile(
                              leading: Icon(FontAwesomeIcons.handHoldingUsd),
                              title: Text('Crowd Funding'),
                              onTap: () {
                                // ...
                                // Navigator.of(context)
                                //     .popAndPushNamed(CrowdFunding.id);
                              },
                            ),
                            ListTile(
                              leading: Icon(FontAwesomeIcons.laptopCode),
                              title: Text('ICT Works'),
                              onTap: () {
                                // ...
                                // Navigator.of(context)
                                //     .popAndPushNamed(IctWorks.id);
                              },
                            ),
                          ],
                        )
                      : Container(),
                  CustomExpansionTile(
                    title: Text('Blockchain'),
                    children: <Widget>[
                      ListTile(
                        leading: Icon(FontAwesomeIcons.wallet),
                        title: Text('Wallet'),
                        onTap: () {
                          // // ...
                          // Navigator.of(context).push(MaterialPageRoute(
                          //     builder: (context) => PaymentInfoScreen()),);
                        },
                      ),
                      ListTile(
                        leading: Icon(FontAwesomeIcons.history),
                        title: Text('History'),
                        onTap: () {
                          // ...
                          // Navigator.of(context).popAndPushNamed(IctWorks.id);
                        },
                      ),
                    ],
                  ),
                  // (currentUser.userRole == 'researcher')?
                  ListTile(
                    leading: Icon(FontAwesomeIcons.solidComment),
                    title: Text('Chat'),
                    onTap: () {
                      // Navigator.of(context).popAndPushNamed(ChatScreen.id);
                      // Update the state of the app.
                      // ...
                    },
                  ),
                  // : Container(),
                  // (currentUser.userRole == 'researcher')

                  ListTile(
                    leading: Icon(FontAwesomeIcons.textWidth),
                    title: Text('Image to Text'),
                    onTap: () {
                      // Navigator.of(context).popAndPushNamed(OCRScreen.id);
                      // Update the state of the app.
                      // ...
                    },
                  ),
                  // : Container(),
                  // (currentUser.userRole == 'researcher')
                  ListTile(
                    leading: Icon(Icons.insert_drive_file),
                    title: Text('Document Conversion'),
                    onTap: () {
                      // Navigator.of(context).popAndPushNamed(ConvertToPDF.id);
                      // ...
                    },
                  ),
                  // : Container(),

                  ListTile(
                    leading: Icon(Icons.video_call),
                    title: Text('Video Conferencing'),
                    onTap: () {
                      // Navigator.of(context)
                      // .popAndPushNamed(VideoConferenceScreen.id);
                      // Update the state of the app.
                      // ...
                    },
                  ),

                  ListTile(
                    leading: Icon(Icons.email),
                    title: Text('Email Client'),
                    onTap: () {
                      // Navigator.of(context).popAndPushNamed(EmailList.id);
                      // Update the state of the app.
                      // ...
                    },
                  )
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              top: 5,
              bottom: 5,
              left: 10,
              right: 10,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Divider(
                  color: Colors.black,
                ),
                GestureDetector(
                  onTap: () {
                    narrService.socketService.handleLogOutEvent();
                    // HiveBox().clearToken();
                    // socket.destroy();
                    narrService.routerService.popUntil(
                      context,
                      Login(),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Log Out',
                        style: TextStyle(
                          color: Colors.red.withOpacity(0.5),
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      Icon(Icons.exit_to_app),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
