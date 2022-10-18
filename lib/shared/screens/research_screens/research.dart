import 'package:flutter/material.dart';
import 'package:narr/core/services/service_injector/service_injectors.dart';
import 'package:narr/shared/screens/research_screens/all_research.dart';
import 'package:narr/shared/screens/research_screens/upload_research.dart';
import 'package:narr/shared/themes/colors.dart';

class AllResearch extends StatefulWidget {
  @override
  _AllResearchState createState() => _AllResearchState();
}

class _AllResearchState extends State<AllResearch> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Repository'),
          backgroundColor: NarrColors.royalGreen,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(40.0),
            child: TabBar(
              indicatorColor: Colors.white,
              isScrollable: true,
              tabs: [
                Tab(
                  child: Text('All'),
                ),
                Tab(
                  child: Text('Project'),
                ),
                Tab(
                  child: Text('Dissertation'),
                ),
                Tab(
                  child: Text('Journal'),
                ),
                Tab(
                  child: Text('Thesis'),
                )
              ],
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search),
            ),
          ],
        ),
        body: TabBarView(
          children: [
            ResearchCategory('all'),
            ResearchCategory('Project'),
            ResearchCategory('Dissertation'),
            ResearchCategory('Journal'),
            ResearchCategory('Thesis')
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: NarrColors.royalGreen,
          onPressed: () {
            narrService.routerService.nextRoute(context, ResearchUpload());
          },
          label: Text('Upload Research'),
          icon: Icon(Icons.add),
        ),
      ),
    );
  }
}
