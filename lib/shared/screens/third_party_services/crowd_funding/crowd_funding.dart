import 'package:flutter/material.dart';
import 'package:narr/shared/screens/third_party_services/crowd_funding/crowd_funding_content.dart';

class CrowdFunding extends StatefulWidget {
  const CrowdFunding({Key? key}) : super(key: key);

  @override
  _CrowdFundingState createState() => _CrowdFundingState();
}

class _CrowdFundingState extends State<CrowdFunding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crowd Funding'),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 15),
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return CrowdFundingContent(
              researchTitle: 'Support SVM & Regression Research',
              researchContent:
                  'Lorem ipsum dolor sit amet consectetur adipisicing elit. Incidunt molestias nostrum ab dolorem saepe daple funto!',
              image:
                  'https://miro.medium.com/max/1146/1*KhUes1b3TtkStUXseSseEA.png',
              onTap: () {},
            );
          },
        ),
      ),
    );
  }
}
