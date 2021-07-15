import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:narr/shared/globals/configs.dart';
import 'package:narr/shared/globals/global_var.dart';
import 'package:narr/shared/widgets/cards/header_card.dart';
import 'package:narr/shared/widgets/cards/institution_info_card.dart';
import 'package:narr/shared/widgets/cards/primary_card.dart';
import 'package:narr/shared/widgets/cards/research_card.dart';
import 'package:narr/shared/widgets/cards/users_online_card.dart';
import 'package:narr/shared/widgets/drawer/menu_drawer.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: DrawerItems(),
      ),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
            padding: EdgeInsets.all(2),
            alignment: Alignment.centerRight,
            tooltip: 'Notifications',
            icon: Icon(
              Icons.account_circle,
            ),
            onPressed: () {
              // Navigator.of(context).pushNamed(Profile.id);
            },
          ),
          IconButton(
            padding: EdgeInsets.all(2),
            tooltip: 'Notifications',
            icon: Icon(
              Icons.notifications,
            ),
            onPressed: () {},
          ),
          IconButton(
            padding: EdgeInsets.all(2),
            tooltip: 'Email',
            icon: Icon(
              Icons.email,
            ),
            onPressed: () async {
              // Navigator.pushNamed(context, EmailList.id);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 15, right: 15),
              width: double.infinity,
              decoration: BoxDecoration(
                color: determinePrimaryColor(context),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: 15),

                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(left: 10, right: 10),
                    // height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 2.5),
                          blurRadius: 8,
                          color: Colors.black.withOpacity(0.25),
                        ),
                      ],
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search NARR',
                        border: InputBorder.none,
                        suffixIcon: Icon(Icons.search),
                      ),
                    ),
                  ), //search and ctgr

                  SizedBox(height: 25),
                  InstitutionoInfoCard(
                    institutionLogo:
                        '$baseUrl${currentUser.user.institution.logo}',
                    institutionName: currentUser.user.institution.name,
                    institutionAcronym: currentUser.user.institution.acronym,
                    institutionType: currentUser.user.institution.type,
                    year: currentUser.user.institution.year,
                    ownership: currentUser.user.institution.ownership,
                    url: currentUser.user.institution.url,
                    onTap: () {},
                  ),
                  // SizedBox(height: 15),
                ],
              ),
            ),
            SizedBox(height: 15),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
              child: PrimaryCard(
                child: Column(
                  children: [
                    Text('Activities'),
                    Divider(thickness: 1.2),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AnalyticsCard(
                          title: 'Documents \nUploaded',
                          count: '22',
                          color: Color(0xff00a368),
                          icon: Icons.insert_drive_file,
                          onTap: () {},
                          info: '',
                        ),
                        AnalyticsCard(
                          title: 'Read \nSuggestions',
                          count: '22',
                          color: Colors.blue,
                          icon: Icons.import_contacts,
                          info: '',
                          onTap: () {},
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AnalyticsCard(
                          title: 'Mentions',
                          info: 'Mentions in the last 1 year',
                          count: '22',
                          color: Colors.orange,
                          icon: Icons.person,
                          onTap: () {},
                        ),
                        AnalyticsCard(
                          title: 'Research Grants',
                          count: '22',
                          color: Colors.red,
                          icon: Icons.insert_drive_file,
                          onTap: () {},
                          info: '',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Observer(builder: (_) {
              return UsersOnlineCard(
                usersOnline: usersOnline.usersOnlineList.length,
                userName: currentUser.user.fullName,
                userEmail: currentUser.user.email,
                onTap: () {
                  // Navigator.of(context).pushNamed(Profile.id);
                },
              );
            }),
            Observer(builder: (_) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                child: PrimaryCard(
                  child: Column(
                    children: [
                      Text('Blockchain Analytics'),
                      Divider(thickness: 1.2),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AnalyticsCard(
                            title: 'Latest Block',
                            count:
                                '${analytics.blockchainAnalytics == null ? '0' : analytics.blockchainAnalytics['number']}',
                            color: Colors.blue,
                            icon: FontAwesomeIcons.thLarge,
                            onTap: () {},
                            info: '',
                          ),
                          AnalyticsCard(
                            title: 'Difficulty',
                            count:
                                '${analytics.blockchainAnalytics == null ? '0' : analytics.blockchainAnalytics['difficulty']}',
                            color: Colors.blue,
                            icon: FontAwesomeIcons.chartLine,
                            info: '',
                            onTap: () {},
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AnalyticsCard(
                            title: 'Gas Used',
                            info: '',
                            count:
                                '${analytics.blockchainAnalytics == null ? '0' : analytics.blockchainAnalytics['gasUsed']}',
                            color: Colors.blue,
                            icon: FontAwesomeIcons.gasPump,
                            onTap: () {},
                          ),
                          AnalyticsCard(
                            title: 'Gas Limit',
                            count:
                                '${analytics.blockchainAnalytics == null ? '0' : analytics.blockchainAnalytics['gasLimit']}',
                            color: Colors.blue,
                            icon: FontAwesomeIcons.gasPump,
                            onTap: () {},
                            info: '',
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AnalyticsCard(
                            title: 'Txn(from)',
                            count:
                                '${transaction.blockchainTransaction == null ? 'loading...' : transaction.blockchainTransaction['from']}',
                            color: Colors.blue,
                            icon: Icons.north_east,
                            onTap: () {},
                            info: '',
                          ),
                          AnalyticsCard(
                            title: 'Txn(to)',
                            count:
                                '${transaction.blockchainTransaction == null ? 'loading...' : transaction.blockchainTransaction['to']}',
                            color: Colors.blue,
                            icon: Icons.south_west,
                            info: '',
                            onTap: () {},
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AnalyticsCard(
                            title: 'Value',
                            info: '',
                            count:
                                '${transaction.blockchainTransaction == null ? 'loading...' : transaction.blockchainTransaction['value']}',
                            color: Colors.blue,
                            icon: FontAwesomeIcons.ethereum,
                            onTap: () {},
                          ),
                          AnalyticsCard(
                            title: 'Nonce',
                            count:
                                '${transaction.blockchainTransaction == null ? 'loading...' : transaction.blockchainTransaction['nonce']}',
                            color: Colors.blue,
                            icon: FontAwesomeIcons.gasPump,
                            onTap: () {},
                            info: '',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }),
            currentUser.user.userRole == 'researcher'
                ? Container(
                    margin: EdgeInsets.symmetric(horizontal: 15, vertical: 9),
                    child: ResearchCard(
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          return Container();
                        },
                        separatorBuilder: (context, index) => Divider(),
                        itemCount: 0,
                      ),
                      cardHeader: 'Reading History',
                      itemCount: 0,
                    ),
                  )
                : Container(),

            currentUser.user.userRole == 'researcher'
                ? Container(
                    margin: EdgeInsets.symmetric(horizontal: 15, vertical: 9),
                    child: ResearchCard(
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          return Container();
                        },
                        separatorBuilder: (context, index) => Divider(),
                        itemCount: 0,
                      ),
                      cardHeader: 'Reading Suggestion',
                      itemCount: 0,
                    ),
                  )
                : Container(),

            currentUser.user.userRole == 'researcher'
                ? Container(
                    margin: EdgeInsets.symmetric(horizontal: 15, vertical: 9),
                    child: ResearchCard(
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          return Container();
                        },
                        separatorBuilder: (context, index) => Divider(),
                        itemCount: 0,
                      ),
                      cardHeader: 'Trending',
                      itemCount: 0,
                    ),
                  )
                : Container(),

            // Analytics(
            //   chartWidget: chartWidget,
            //   title: '',
            //   child: Container(),
            // ),
            //     ReadingHistoryCard(
            //       child: readingHistory.readingHistoryDocument.length < 1
            //           ? Center(
            //               child: Text(
            //                 'No Readding history yet!',
            //                 style: TextStyle(color: Colors.blue),
            //               ),
            //             )
            //           : ListView.separated(
            //               physics: NeverScrollableScrollPhysics(),
            //               itemCount:
            //                   readingHistory.readingHistoryDocument.length,
            //               separatorBuilder:
            //                   (BuildContext context, int index) => Divider(),
            //               itemBuilder: (context, index) {
            //                 return ListTile(
            //                   contentPadding: EdgeInsets.zero,
            //                   leading: CircleAvatar(
            //                     child: Icon(Icons.insert_drive_file),
            //                   ),
            //                   title: Text(
            //                     '${readingHistory.readingHistoryDocument[index]['researchTitle']}',
            //                     maxLines: 1,
            //                     overflow: TextOverflow.ellipsis,
            //                   ),
            //                   subtitle: Text(
            //                     '${readingHistory.readingHistoryDocument[index]['authors'].toString().replaceAll('[', '').replaceAll(']', '')}',
            //                     maxLines: 1,
            //                     overflow: TextOverflow.ellipsis,
            //                   ),
            //                   trailing: Column(
            //                     mainAxisAlignment: MainAxisAlignment.end,
            //                     children: [
            //                       Text(
            //                           '${readingHistory.readingHistoryDocument[index]['accessType']},'),
            //                       SizedBox(
            //                         height: 8,
            //                       ),
            //                       Text(
            //                         '${readingHistory.readingHistoryDocument[index]['nPages']}',
            //                         style: TextStyle(
            //                           color: Color(0xff00a368),
            //                         ),
            //                       ),
            //                     ],
            //                   ),
            //                   onTap: () {
            //                     Navigator.push(
            //                       context,
            //                       MaterialPageRoute(
            //                         builder: (context) => ResearchWork(
            //                           researchId: readingHistory
            //                                   .readingHistoryDocument[index]
            //                               ['_id'],
            //                         ),
            //                       ),
            //                     );
            //                   },
            //                 );
            //               },
            //             ),
            //       itemCount: readingHistory.readingHistoryDocument.length,
            //     ),
            //     SizedBox(
            //       height: 15,
            //     ),
            //     TrendinCard(
            //       child: trending.readingTrends.length < 1
            //           ? Center(
            //               child: Text(
            //                 'No Trends yet!',
            //                 style: TextStyle(color: Colors.blue),
            //               ),
            //             )
            //           : ListView.separated(
            //               physics: NeverScrollableScrollPhysics(),
            //               itemBuilder: (context, index) {
            //                 return ListTile(
            //                   leading: CircleAvatar(
            //                     child: Icon(
            //                       Icons.insert_drive_file,
            //                       color: Colors.white,
            //                     ),
            //                     backgroundColor: Colors.blue,
            //                   ),
            //                   title: Text('Linial Warhead'),
            //                   subtitle: Text('Musa Damu'),
            //                   trailing: Text('12-03-2020'),
            //                 );
            //               },
            //               separatorBuilder: (context, index) {
            //                 return Divider(
            //                   thickness: 1.3,
            //                 );
            //               },
            //               itemCount: trending.readingTrends.length),
            //       itemCount: trending.readingTrends.length,
            //     ),
            //     SizedBox(height: 15.0),
            //     SuggestionCard(
            //       child: suggestion.readingSuggestions.length < 1
            //           ? Center(
            //               child: Text(
            //                 'No Suggestions yet!',
            //                 style: TextStyle(color: Colors.blue),
            //               ),
            //             )
            //           : ListView.separated(
            //               physics: NeverScrollableScrollPhysics(),
            //               itemBuilder: (context, index) {
            //                 return ListTile(
            //                   leading: CircleAvatar(),
            //                   title: Text('Axial Warhead'),
            //                   subtitle: Text('Musa Damu'),
            //                   trailing: Text('12-03-2020'),
            //                 );
            //               },
            //               separatorBuilder: (context, index) {
            //                 return Divider(
            //                   thickness: 1.3,
            //                 );
            //               },
            //               itemCount: suggestion.readingSuggestions.length),
            //       itemCount: suggestion.readingSuggestions.length,
            //     ),
            //
            //   ],
            // ),
            // ),
          ],
        ),
      ),
    );
  }
}
