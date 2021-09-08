import 'package:flutter/material.dart';
import 'package:narr/core/services/service_injector/service_injectors.dart';
import 'package:narr/shared/screens/research_screens/single_research.dart';
import 'package:shimmer/shimmer.dart';

class Researchers extends StatefulWidget {
  @override
  _ResearchersState createState() => _ResearchersState();
}

class _ResearchersState extends State<Researchers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'All Researchers',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: FutureBuilder<dynamic>(
        future: narrService.userService.getAllResearchers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Shimmer.fromColors(
              child: ListView.separated(
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/images/jpg/profile.jpg'),
                    ),
                    title: Text('loading...'),
                    subtitle: Text('Loading...'),
                    trailing: Text(
                      '',
                    ),
                    onTap: () {},
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    Divider(),
                itemCount: 10,
              ),
              baseColor: Color(0xffE0E0E0),
              highlightColor: Color(0xffF5F5F5),
              enabled: true,
            );
          }
          return ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              var user = snapshot.data[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/jpg/profile.jpg'),
                ),
                title: Text('${user['fullName']}'),
                subtitle: Text('${user['email']}'),
                trailing: Text(
                  '${user['status']}',
                  style: TextStyle(
                    color: user['status'] == 'active'
                        ? Color(0xff00a368)
                        : Colors.red,
                  ),
                ),
                onTap: () {
                  narrService.routerService.nextRoute(
                    context,
                    SingleResearch(
                      researchId: user['_id'],
                    ),
                  );
                },
              );
            },
            separatorBuilder: (BuildContext context, int index) => Divider(),
            itemCount: snapshot.data.length,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.person_add,
          color: Colors.white,
        ),
        onPressed: () {},
      ),
    );
  }
}
