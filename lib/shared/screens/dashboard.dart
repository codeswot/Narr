import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:narr/core/services/service_injector/service_injectors.dart';
import 'package:narr/module/researcher/screens/reading_history.dart';
import 'package:narr/shared/screens/profile.dart';
import 'package:narr/shared/screens/research_screens/upload_research.dart';
import 'package:narr/shared/screens/third_party_services/crowd_funding/crowd_funding.dart';
import 'package:narr/shared/screens/third_party_services/grant/grants.dart';
import 'package:narr/shared/themes/colors.dart';
import 'package:narr/shared/widgets/buttons/bullet.dart';
import 'package:narr/shared/widgets/cards/activities_card.dart';
import 'package:narr/shared/widgets/cards/institution_info_card.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:narr/shared/globals/global_var.dart';
import 'package:narr/shared/widgets/cards/blockchain_card.dart';
import 'package:narr/shared/widgets/cards/primary_card.dart';
import 'package:narr/shared/widgets/cards/research_card.dart';
import 'package:narr/shared/widgets/drawer/menu_drawer.dart';
import 'package:intl/intl.dart';

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
        backgroundColor: NarrColors.royalGreen,
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
                            currentUser.user.fullName,
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            currentUser.user.email,
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Last LogIn: ${narrService.utilityService.dateFormatting(currentUser.user.lastLoggedIn)}',
                            style: TextStyle(color: Colors.white),
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
                  SizedBox(height: 15),
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
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: ActivitiesCard(
                      color: Color(0xff00a368),
                      icon: Icons.cloud_upload,
                      title: 'Upload',
                      onTap: () => narrService.routerService.nextRoute(
                        context,
                        ResearchUpload(),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ActivitiesCard(
                      color: Color(0xffFF7A93),
                      icon: Icons.import_contacts,
                      title: 'Grants',
                      onTap: () => narrService.routerService.nextRoute(
                        context,
                        GrantScreen(),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ActivitiesCard(
                      color: Color(0xff609CFE),
                      icon: FontAwesomeIcons.handHoldingUsd,
                      title: 'Fund',
                      onTap: () => narrService.routerService.nextRoute(
                        context,
                        CrowdFunding(),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ActivitiesCard(
                      color: Color(0xffF9B620),
                      icon: Icons.people,
                      title: 'Online Users',
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12),
            InstitutionInfoCard(
              logo: 'https://app.narr.ng${currentUser.user.institution.logo}',
              name: currentUser.user.institution.name,
              acronym: currentUser.user.institution.acronym,
              type: currentUser.user.institution.type,
              ownership: currentUser.user.institution.ownership,
              established: currentUser.user.institution.year,
              website: currentUser.user.institution.url,
              onTap: () {},
            ),
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
                                        // narrService.routerService.nextRoute(
                                        //   context,
                                        //   // SingleResearch(
                                        //   //   researchId: researchHistory['_id'],
                                        //   // ),
                                        // );
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
                ],
              ),
            ),
            SizedBox(height: 12),
            Observer(builder: (_) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Blockchain Analytics',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: AnalyticsCard(
                            title: 'Latest Block',
                            count:
                                '${analytics.blockchainAnalytics == null ? 'loading...' : NumberFormat.decimalPattern().format(analytics.blockchainAnalytics['number'])}',
                            icon: FontAwesomeIcons.thLarge,
                            onTap: () {},
                            info: '',
                          ),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: AnalyticsCard(
                            title: 'Difficulty',
                            count:
                                '${analytics.blockchainAnalytics == null ? 'loading...' : NumberFormat.decimalPattern().format(int.parse(analytics.blockchainAnalytics['difficulty']))}',
                            icon: FontAwesomeIcons.chartLine,
                            info: '',
                            onTap: () {},
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: AnalyticsCard(
                            title: 'Gas Used',
                            info: '',
                            count:
                                '${analytics.blockchainAnalytics == null ? 'loading...' : analytics.blockchainAnalytics['gasUsed']}',
                            icon: FontAwesomeIcons.gasPump,
                            onTap: () {},
                          ),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: AnalyticsCard(
                            title: 'Gas Limit',
                            count:
                                '${analytics.blockchainAnalytics == null ? 'loading...' : NumberFormat.decimalPattern().format(analytics.blockchainAnalytics['gasLimit'])}',
                            icon: FontAwesomeIcons.gasPump,
                            onTap: () {},
                            info: '',
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: AnalyticsCard(
                            title: 'Txn(from)',
                            count:
                                '${transaction.blockchainTransaction == null ? 'loading...' : transaction.blockchainTransaction['from']}',
                            icon: Icons.north_east,
                            onTap: () {},
                            info: '',
                          ),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: AnalyticsCard(
                            title: 'Txn(to)',
                            count:
                                '${transaction.blockchainTransaction == null ? 'loading...' : transaction.blockchainTransaction['to']}',
                            icon: Icons.south_west,
                            info: '',
                            onTap: () {},
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: AnalyticsCard(
                            title: 'Value',
                            info: '',
                            count:
                                '${transaction.blockchainTransaction == null ? 'loading...' : transaction.blockchainTransaction['value']}',
                            icon: FontAwesomeIcons.ethereum,
                            onTap: () {},
                          ),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: AnalyticsCard(
                            title: 'Nonce',
                            count:
                                '${transaction.blockchainTransaction == null ? 'loading...' : transaction.blockchainTransaction['nonce']}',
                            icon: FontAwesomeIcons.gasPump,
                            onTap: () {},
                            info: '',
                          ),
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
