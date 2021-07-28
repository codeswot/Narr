import 'package:flutter/material.dart';
import 'package:narr/core/services/service_injector/service_injectors.dart';
import 'package:narr/shared/globals/global_var.dart';
import 'package:narr/shared/screens/research_screens/single_research.dart';

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
      body: Container(
        margin: EdgeInsets.only(left: 15, right: 15),
        child: ListView.separated(
          itemCount: research.readingHistoryList.length,
          separatorBuilder: (BuildContext context, int index) => Divider(),
          itemBuilder: (context, index) {
            var researchHistory = research.readingHistoryList[index];
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
              subtitle: Column(
                children: [
                  Text(
                    '${researchHistory['authors'].toString().replaceAll('[', '').replaceAll(']', '')}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 8),
                  LinearProgressIndicator(
                    value: researchHistory['percentCompleted'] / 100,
                  ),
                ],
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('${researchHistory['accessType']},'),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    '${researchHistory['nPages']}',
                    style: TextStyle(
                      color: Color(0xff00a368),
                    ),
                  ),
                ],
              ),
              onTap: () {
                narrService.routerService.nextRoute(
                  context,
                  SingleResearch(researchId: researchHistory['_id']),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
