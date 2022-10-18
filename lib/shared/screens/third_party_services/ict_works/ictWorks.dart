import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:narr/core/services/service_injector/service_injectors.dart';
import 'package:narr/shared/screens/third_party_services/ict_works/ictWorks_content.dart';
import 'package:narr/shared/widgets/cards/outlined_card.dart';

class IctWorks extends StatefulWidget {
  @override
  _IctWorksState createState() => _IctWorksState();
}

class _IctWorksState extends State<IctWorks> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ICT Works'),
      ),
      body: OutlinedContainer(
        child: FutureBuilder<dynamic>(
          future: narrService.researchService.getAllIctWork(),
          builder: (context, snapshot) {
            var data = snapshot.data;
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              print('${snapshot.error}');
            } else if (!snapshot.hasData) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 100,
                    child: SvgPicture.asset('assets/svg/no_data.svg'),
                  ),
                  Text(
                    'No Data',
                    style: TextStyle(fontSize: 25),
                  ),
                ],
              );
            } else if (snapshot.hasData) {
              return ListView.separated(
                itemCount: data.length,
                separatorBuilder: (BuildContext context, int index) =>
                    Divider(),
                itemBuilder: (BuildContext context, int index) {
                  var tag =
                      data[index]['contentEncoded'].replaceAll('<h3>', '<p>');
                  var content = tag.split('<p>')[1];
                  var result = content.split('src=')[1];
                  var img = result.split('"')[1];

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: IctWorksContent(
                          content: data[index]['contentEncodedSnippet'] ?? "",
                          title: data[index]['title'] ?? "",
                          creator: data[index]['creator'] ?? "",
                          imgUrl: img ?? '',
                          categories: data[index]['categories'] ?? "",
                          linkUrl: data[index]['link'] ?? "",
                          date: data[index]['created'],
                        ),
                      ),
                    ],
                  );
                },
              );
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 100,
                    child: SvgPicture.asset('assets/svg/no_data.svg'),
                  ),
                  Text(
                    'No Data',
                    style: TextStyle(fontSize: 25),
                  ),
                ],
              );
            }
            return Text('${snapshot.error}');
          },
        ),
      ),
    );
  }
}