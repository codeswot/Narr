import 'package:flutter/material.dart';
import 'package:narr/core/services/service_injector/service_injectors.dart';

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
        future: narrService.researchService.getAllResearchers(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
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
                onTap: () {},
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
