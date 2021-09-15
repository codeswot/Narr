import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:narr/core/services/service_injector/service_injectors.dart';
import 'package:narr/module/researcher/screens/reading_history.dart';
import 'package:narr/shared/globals/configs.dart';
import 'package:narr/shared/screens/profile.dart';
import 'package:narr/shared/screens/research_screens/research.dart';
import 'package:narr/shared/screens/research_screens/single_research.dart';
import 'package:narr/shared/widgets/buttons/bullet.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:narr/shared/globals/global_var.dart';
import 'package:narr/shared/widgets/cards/header_card.dart';
import 'package:narr/shared/widgets/cards/primary_card.dart';
import 'package:narr/shared/widgets/cards/research_card.dart';
import 'package:narr/shared/widgets/drawer/menu_drawer.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:charts_flutter/flutter.dart' as charts;

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
              narrService.routerService.nextRoute(context, Profile());
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
                  ), //search and ctgr
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hello',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                          SizedBox(height: 5),
                          Text(
                            currentUser.user.fullName,
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.white,
                        backgroundImage:
                            AssetImage('assets/images/jpg/profile.jpg'),
                      ),
                    ],
                  ),
                  SizedBox(height: 25),
                  // Observer(builder: (_) {
                  //   return UserInfoCard(
                  //     institutionLogo: 'assets/images/jpg/profile.jpg',
                  //     name: currentUser.user.fullName,
                  //     role: currentUser.user.userRole,
                  //     email: currentUser.user.email,
                  //     institutionName: currentUser.user.institution.name,
                  //     phone: currentUser.user.phone,
                  //     address: currentUser.user.address,
                  //     usersOnline:
                  //         usersOnline.usersOnlineList.length.toString(),
                  //     onTap: () {},
                  //   );
                  // }),
                  // SizedBox(height: 15),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(15.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search NARR',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  suffixIcon: Icon(Icons.search),
                  fillColor: Colors.grey[200],
                  filled: true,
                ),
              ),
            ),
            PrimaryCard(
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

            Container(
              margin: EdgeInsets.all(15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Top Researches',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            narrService.routerService
                                .nextRoute(context, AllResearch());
                          },
                          child: Text('View More...'))
                    ],
                  ),
                  SizedBox(height: 15),
                  Container(
                    height: 200,
                    child: FutureBuilder<dynamic>(
                      future: narrService.researchService.getAllResearch(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (!snapshot.hasData) {
                          return Center(
                            child: Text('No Data!'),
                          );
                        }
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            final payload = snapshot.data[index];
                            var image = payload['thumbnail'];
                            var id = payload['_id'];
                            var imageUrl =
                                '$baseUrl$image?token=${currentUser.token}';
                            return Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: GestureDetector(
                                onTap: () {
                                  narrService.routerService.nextRoute(
                                      context, SingleResearch(researchId: id));
                                },
                                child: Container(
                                  child: Image.network(
                                    imageUrl,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            // InstitutionInfoCard(
            //   usersOnline: usersOnline.usersOnlineList.length,
            //   userName: currentUser.user.fullName,
            //   userEmail: currentUser.user.email,
            //   onTap: () {},
            // ),
            currentUser.user.userRole == 'researcher'
                ? ResearchCard(
                    child: Observer(
                      builder: (_) {
                        return research.readingHistoryList.length < 1
                            ? Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 50,
                                      child: SvgPicture.asset(
                                          'assets/svg/no_data.svg'),
                                    ),
                                    Text(
                                      'No Reading History yet!',
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                  ],
                                ),
                              )
                            : Container(
                                child: ListView.separated(
                                  itemBuilder: (context, index) {
                                    var researchHistory =
                                        research.readingHistoryList[index];
                                    return ListTile(
                                      contentPadding: EdgeInsets.zero,
                                      leading: CircleAvatar(
                                        child: Icon(Icons.insert_drive_file),
                                      ),
                                      title: Text(
                                        '${researchHistory['researchTitle']}',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      subtitle: Text(
                                        '${researchHistory['authors'].toString().replaceAll('[', '').replaceAll(']', '')}',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      trailing: CircularPercentIndicator(
                                        radius: 40.0,
                                        lineWidth: 4.0,
                                        percent: 0.7,
                                        center: Text('70%'),
                                        progressColor: Colors.green,
                                      ),
                                      onTap: () {
                                        narrService.routerService.nextRoute(
                                          context,
                                          SingleResearch(
                                            researchId: researchHistory['_id'],
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  separatorBuilder: (context, index) =>
                                      Divider(),
                                  itemCount: research.readingHistoryList.length,
                                ),
                              );
                      },
                    ),
                    cardHeader: 'Reading History',
                    itemCount: research.readingHistoryList.length,
                    viewMoreTap: () {
                      narrService.routerService.nextRoute(
                        context,
                        ReadingHistory(),
                      );
                    },
                  )
                : Container(),
            currentUser.user.userRole == 'researcher'
                ? ResearchCard(
                    child: Observer(
                      builder: (_) {
                        return research.suggestionList.length < 1
                            ? Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 50,
                                      child: SvgPicture.asset(
                                          'assets/svg/no_data.svg'),
                                    ),
                                    Text(
                                      'No Suggestion yet!',
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                  ],
                                ),
                              )
                            : Container(
                                child: ListView.separated(
                                  itemBuilder: (context, index) {
                                    var researchSuggestion =
                                        research.suggestionList[index];
                                    return ListTile(
                                      contentPadding: EdgeInsets.zero,
                                      leading: CircleAvatar(
                                        child: Icon(Icons.insert_drive_file),
                                      ),
                                      title: Text(
                                        '${researchSuggestion['researchTitle']}',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      subtitle: Text(
                                        '${researchSuggestion['authors'].toString().replaceAll('[', '').replaceAll(']', '')}',
                                      ),
                                      trailing: Column(
                                        children: [
                                          Text(
                                              '${researchSuggestion['accessType']}'),
                                          SizedBox(height: 5),
                                          Text(
                                              '${researchSuggestion['nPages']}')
                                        ],
                                      ),
                                    );
                                  },
                                  separatorBuilder: (context, index) =>
                                      Divider(),
                                  itemCount: research.suggestionList.length,
                                ),
                              );
                      },
                    ),
                    cardHeader: 'Reading Suggestion',
                    itemCount: research.suggestionList.length,
                  )
                : Container(),
            currentUser.user.userRole == 'researcher'
                ? ResearchCard(
                    child: Observer(
                      builder: (_) {
                        return research.trendingList.length < 1
                            ? Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 50,
                                      child: SvgPicture.asset(
                                          'assets/svg/no_data.svg'),
                                    ),
                                    Text(
                                      'No Trending research yet!',
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                  ],
                                ),
                              )
                            : Container(
                                child: ListView.separated(
                                  itemBuilder: (context, index) {
                                    var trendingResearch =
                                        research.trendingList[index];
                                    return ListTile(
                                      contentPadding: EdgeInsets.zero,
                                      leading: CircleAvatar(
                                        child: Icon(Icons.insert_drive_file),
                                      ),
                                      title: Text(
                                        '${trendingResearch['researchTitle']}',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      subtitle: Text(
                                        '${trendingResearch['authors'].toString().replaceAll('[', '').replaceAll(']', '')}',
                                      ),
                                      trailing: Column(
                                        children: [
                                          Text(
                                              '${trendingResearch['accessType']}'),
                                          SizedBox(height: 5),
                                          Text('${trendingResearch['nPages']}')
                                        ],
                                      ),
                                    );
                                  },
                                  separatorBuilder: (context, index) =>
                                      Divider(),
                                  itemCount: 0,
                                ),
                              );
                      },
                    ),
                    cardHeader: 'Trending',
                    itemCount: 0,
                  )
                : Container(),
            PrimaryCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Overview',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Divider(),
                  SizedBox(
                    height: 180,
                    child: currentUser.user.userRole == 'admin'
                        ? charts.PieChart(
                            pieChartAnalytics,
                            defaultRenderer: charts.ArcRendererConfig(
                              arcWidth: 100,
                              arcRendererDecorators: [
                                charts.ArcLabelDecorator()
                              ],
                            ),
                          )
                        : charts.LineChart(lineChartAnalytics),
                  ),
                  SizedBox(height: 8),
                  currentUser.user.userRole == 'admin'
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    MyBullet(Colors.red),
                                    SizedBox(width: 5),
                                    Text('All Research')
                                  ],
                                ),
                                SizedBox(height: 8),
                                Row(
                                  children: [
                                    MyBullet(Colors.green),
                                    SizedBox(width: 5),
                                    Text('OCR')
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    MyBullet(Colors.blue),
                                    SizedBox(width: 5),
                                    Text('All Researchers')
                                  ],
                                ),
                                SizedBox(height: 8),
                                Row(
                                  children: [
                                    MyBullet(Color(0xff795548)),
                                    SizedBox(width: 5),
                                    Text('Doc Convertion')
                                  ],
                                ),
                              ],
                            ),
                          ],
                        )
                      : Container(),
                  SizedBox(height: 10),
                  currentUser.user.userRole == 'admin'
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MyBullet(Colors.deepOrange),
                            SizedBox(width: 5),
                            Text('Researches')
                          ],
                        )
                      : Container(),

                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  // Column(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //     ListTile(
                  //       leading: MyBullet(Colors.red),
                  //       title: Text('Researches'),
                  //     ),
                  //     ListTile(
                  //       leading: MyBullet(Colors.green),
                  //       title: Text('Researches'),
                  //     ),
                  //   ],
                  // ),
                  // Column(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //     ListTile(
                  //       leading: MyBullet(Colors.blue),
                  //       title: Text('Researches'),
                  //     ),
                  //     ListTile(
                  //       leading: MyBullet(Color(0xff795548)),
                  //       title: Text('Researches'),
                  //     ),
                  //     ListTile(
                  //       leading: MyBullet(Colors.deepOrange),
                  //       title: Text('Researches'),
                  //     ),
                  //   ],
                  // ),
                  //   ],
                  // ),
                ],
              ),
            ),
            Observer(builder: (_) {
              return PrimaryCard(
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
                              '${analytics.blockchainAnalytics == null ? 'loading...' : analytics.blockchainAnalytics['number']}',
                          icon: FontAwesomeIcons.thLarge,
                          onTap: () {},
                          info: '',
                        ),
                        AnalyticsCard(
                          title: 'Difficulty',
                          count:
                              '${analytics.blockchainAnalytics == null ? 'loading...' : analytics.blockchainAnalytics['difficulty']}',
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
                              '${analytics.blockchainAnalytics == null ? 'loading...' : analytics.blockchainAnalytics['gasUsed']}',
                          icon: FontAwesomeIcons.gasPump,
                          onTap: () {},
                        ),
                        AnalyticsCard(
                          title: 'Gas Limit',
                          count:
                              '${analytics.blockchainAnalytics == null ? 'loading...' : analytics.blockchainAnalytics['gasLimit']}',
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
                          icon: Icons.north_east,
                          onTap: () {},
                          info: '',
                        ),
                        AnalyticsCard(
                          title: 'Txn(to)',
                          count:
                              '${transaction.blockchainTransaction == null ? 'loading...' : transaction.blockchainTransaction['to']}',
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
                          icon: FontAwesomeIcons.ethereum,
                          onTap: () {},
                        ),
                        AnalyticsCard(
                          title: 'Nonce',
                          count:
                              '${transaction.blockchainTransaction == null ? 'loading...' : transaction.blockchainTransaction['nonce']}',
                          icon: FontAwesomeIcons.gasPump,
                          onTap: () {},
                          info: '',
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
