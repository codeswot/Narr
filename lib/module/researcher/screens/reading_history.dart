import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:narr/core/services/service_injector/service_injectors.dart';
import 'package:narr/shared/globals/global_var.dart';
import 'package:narr/shared/models/research.dart';
import 'package:narr/shared/screens/research_screens/single_research.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ReadingHistory extends StatefulWidget {
  @override
  _ReadingHistoryState createState() => _ReadingHistoryState();
}

class _ReadingHistoryState extends State<ReadingHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reading History'),
        backgroundColor: Color(0xff00a368),
      ),
      body: research.readingHistoryList.length < 1
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 100,
                  child: SvgPicture.asset('assets/svg/no_data.svg'),
                ),
                Text(
                  'No Reading History yet!',
                  style: TextStyle(fontSize: 25),
                ),
              ],
            )
          : Observer(
              builder: (_) {
                return Container(
                  margin: EdgeInsets.only(left: 15, right: 15),
                  child: ListView.separated(
                    itemCount: research.readingHistoryList.length,
                    separatorBuilder: (BuildContext context, int index) =>
                        Divider(),
                    itemBuilder: (context, index) {
                      ResearchModel researchHistory = ResearchModel.fromJson(
                          research.readingHistoryList[index]);

                      return ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: CircleAvatar(
                          child: Icon(Icons.insert_drive_file),
                        ),
                        title: Text(
                          '${researchHistory.researchTitle}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        subtitle: Text(
                          '${researchHistory.authors.toString().replaceAll('[', '').replaceAll(']', '')}',
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
                            SingleResearch(research: researchHistory),
                          );
                        },
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}
