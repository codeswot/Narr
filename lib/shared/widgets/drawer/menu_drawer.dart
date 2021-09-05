import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:narr/core/services/service_injector/service_injectors.dart';
import 'package:narr/module/researcher/screens/reading_history.dart';
import 'package:narr/shared/globals/global_var.dart';
import 'package:narr/shared/screens/auth_screens/login.dart';
import 'package:narr/shared/screens/blockchain/payment_info_screen.dart';
import 'package:narr/shared/screens/dashboard.dart';
import 'package:narr/shared/screens/profile.dart';
import 'package:narr/shared/screens/research_screens/all_research.dart';
import 'package:narr/shared/screens/third_party_services/chat/chat_screen.dart';
import 'package:narr/shared/screens/third_party_services/crowd_funding/crowd_funding.dart';
import 'package:narr/shared/screens/third_party_services/doc_convertion/doc_convertion.dart';
import 'package:narr/shared/screens/third_party_services/grant/grants.dart';
import 'package:narr/shared/screens/third_party_services/ict_works/ictWorks.dart';
import 'package:narr/shared/screens/third_party_services/ocr/ocr.dart';
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
                            narrService.routerService.nextRoute(
                              context,
                              Dashboard(),
                            );
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
                            narrService.routerService.nextRoute(
                              context,
                              Dashboard(),
                            );
                          },
                        )
                      : Container(),
                  (currentUser.user.userRole == 'sponsor')
                      ? ListTile(
                          leading: Icon(Icons.dashboard),
                          title: Text('Dashboard'),
                          enabled: true,
                          onTap: () {},
                        )
                      : Container(),
                  (currentUser.user.userRole == 'investor')
                      ? ListTile(
                          leading: Icon(Icons.dashboard),
                          title: Text('Dashboard'),
                          enabled: true,
                          onTap: () {},
                        )
                      : Container(),
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text('Profile'),
                    onTap: () {
                      narrService.routerService.nextRoute(context, Profile());
                    },
                  ),
                  ListTile(
                    leading: Icon(FontAwesomeIcons.database),
                    title: Text('Repository'),
                    onTap: () {
                      narrService.routerService
                          .nextRoute(context, AllResearch());
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
                  currentUser.user.userRole == 'researcher'
                      ? ListTile(
                          leading: Icon(Icons.history),
                          title: Text('Reading History'),
                          onTap: () {
                            narrService.routerService
                                .nextRoute(context, ReadingHistory());
                          },
                        )
                      : Container(),

                  (currentUser.user.userRole == 'researcher' ||
                          currentUser.user.userRole == 'admin')
                      ? CustomExpansionTile(
                          title: Text('Grants & Funding'),
                          children: <Widget>[
                            ListTile(
                              leading: Icon(Icons.import_contacts),
                              title: Text('Grants'),
                              onTap: () {
                                narrService.routerService.nextRoute(
                                  context,
                                  GrantScreen(),
                                );
                              },
                            ),
                            ListTile(
                              leading: Icon(FontAwesomeIcons.handHoldingUsd),
                              title: Text('Crowd Funding'),
                              onTap: () {
                                narrService.routerService
                                    .nextRoute(context, CrowdFunding());
                              },
                            ),
                            ListTile(
                              leading: Icon(FontAwesomeIcons.laptopCode),
                              title: Text('ICT Works'),
                              onTap: () {
                                narrService.routerService
                                    .nextRoute(context, IctWorks());
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
                          // ...
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => PaymentInfoScreen(),
                            ),
                          );
                        },
                      ),
                      ListTile(
                        leading: Icon(FontAwesomeIcons.history),
                        title: Text('History'),
                        onTap: () {},
                      ),
                    ],
                  ),
                  // (currentUser.userRole == 'researcher')?
                  ListTile(
                    leading: Icon(FontAwesomeIcons.solidComment),
                    title: Text('Chat'),
                    onTap: () {
                      narrService.routerService.nextRoute(
                        context,
                        ChatScreen(),
                      );
                    },
                  ),
                  // : Container(),
                  // (currentUser.userRole == 'researcher')

                  ListTile(
                    leading: Icon(FontAwesomeIcons.textWidth),
                    title: Text('Image to Text'),
                    onTap: () {
                      narrService.routerService.nextRoute(
                        context,
                        OCRScreen(),
                      );
                      // ...
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.insert_drive_file),
                    title: Text('Document Conversion'),
                    onTap: () {
                      // ...
                      narrService.routerService.nextRoute(
                        context,
                        DocumentConvertion(),
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.video_call),
                    title: Text('Video Conferencing'),
                    onTap: () {
                      // ...
                    },
                  ),

                  ListTile(
                    leading: Icon(Icons.email),
                    title: Text('Email Client'),
                    onTap: () {},
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
