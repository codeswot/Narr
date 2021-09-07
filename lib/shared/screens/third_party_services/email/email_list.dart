import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:narr/core/services/service_injector/service_injectors.dart';
import 'package:narr/shared/screens/third_party_services/email/compose_mail.dart';
import 'package:narr/shared/screens/third_party_services/email/single_mail.dart';
import 'package:narr/shared/themes/colors.dart';

class EmailScreen extends StatefulWidget {
  @override
  _EmailScreenState createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
  List starredMail = [];
  Future readEmail() async {
    final String response =
        await rootBundle.loadString('assets/json/email.json');
    final data = await json.decode(response);
    return data;
    // ...
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        child: Container(
          height: 10,
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 15),
                height: 100,
                color: NarrColors.royalGreen,
                child: Center(
                  child: Text(
                    'Email Client',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 23,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    ListTile(
                      leading: Icon(Icons.inbox),
                      title: Text('Inbox'),
                      trailing: Text('20'),
                    ),
                    ListTile(
                      leading: Icon(Icons.outbox),
                      title: Text('Outbox'),
                      trailing: Text('2'),
                    ),
                    ListTile(
                      leading: Icon(Icons.star_border),
                      title: Text('Starred'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: Text('Email'),
      ),
      body: FutureBuilder<dynamic>(
        future: readEmail(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              var mail = snapshot.data[index];
              bool isStarred = starredMail.contains(mail);
              return ListTile(
                leading: CircleAvatar(
                  child: Text('${mail['sender'][0]}'),
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${mail['sender']}',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 2.5),
                    Text(
                      '${mail['title']}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                subtitle: Text(
                  '${mail['message']}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${mail['time']}',
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                    InkWell(
                        onTap: () {
                          setState(() {
                            if (isStarred) {
                              starredMail.remove(mail);
                              print('Unstar mail');
                            } else {
                              starredMail.add(mail);
                              print('Star mail');
                            }
                          });
                        },
                        child: Icon(
                          isStarred ? Icons.star : Icons.star_border,
                          color: isStarred ? Colors.yellow : null,
                        )),
                  ],
                ),
                onTap: () {
                  narrService.routerService.nextRoute(context, ViewEmail(mail));
                },
              );
            },
            separatorBuilder: (BuildContext context, int index) => Divider(),
            itemCount: snapshot.data.length,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.edit),
        onPressed: () {
          narrService.routerService.nextRoute(
            context,
            ComposeEmail(),
          );
        },
      ),
    );
  }
}
