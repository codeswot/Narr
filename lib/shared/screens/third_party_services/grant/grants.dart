import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:narr/core/services/service_injector/service_injectors.dart';
import 'package:narr/shared/screens/third_party_services/grant/grant_proposal.dart';
import 'package:narr/shared/screens/third_party_services/grant/grants_content.dart';
import 'package:narr/shared/widgets/cards/outlined_card.dart';

class GrantScreen extends StatefulWidget {
  @override
  _GrantScreenState createState() => _GrantScreenState();
}

class _GrantScreenState extends State<GrantScreen> {
  bool buttonPressed = false;
  String loremIpsum =
      'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Reiciendis, dolores? Mollitia animi numquam, repellendus deserunt ab quasi cum dicta! Nesciunt laudantium beatae saepe, reprehenderit fugit similique, veritatis quisquam illum aut officia nihil dolores';
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Research Grant'),
      ),
      body: OutlinedContainer(
        child: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.all(12),
              child: GestureDetector(
                onTap: () {
                  narrService.routerService.nextRoute(
                    context,
                    GrantsProposal(),
                  );
                },
                child: GrantsContent(
                  loremIpsum: loremIpsum,
                  iconButtonOnPressed: () {
                    setState(() {
                      buttonPressed = !buttonPressed;
                    });
                  },
                  iconButtonIcon: buttonPressed == false
                      ? FontAwesomeIcons.heart
                      : FontAwesomeIcons.solidHeart,
                  iconButtonIconColor:
                      buttonPressed == false ? Colors.green : Colors.red,
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) => Divider(),
          itemCount: 3,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Text('Manage'),
        onPressed: null,
      ),
    );
  }
}


//  Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(
//                     top: 8.0, bottom: 8.0, right: 8.0, left: 15),
//                 child: Text(
//                   'Research GrantScreen Feed',
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
//                 ),
//               ),
//               Divider(
//                 thickness: 1.0,
//               ),
//               Container(
//                 margin: EdgeInsets.all(15),
//                 child: Column(
//                   children: [
//                     GestureDetector(
//                       onTap: () {
//                         // Navigator.pushNamed(context, ResearchGrantScreenProposal.id);
//                       },
//                       child: ResearchGrantScreenContent(
//                         loremIpsum: loremIpsum,
//                         iconButtonOnPressed: () {
//                           setState(() {
//                             buttonPressed = !buttonPressed;
//                           });
//                         },
//                         iconButtonIcon: buttonPressed == false
//                             ? FontAwesomeIcons.heart
//                             : FontAwesomeIcons.solidHeart,
//                         iconButtonIconColor:
//                             buttonPressed == false ? Colors.green : Colors.red,
//                       ),
//                     ),
//                     SizedBox(height: 12),
//                     Divider(
//                       thickness: 1.0,
//                     ),
//                     SizedBox(height: 12),
//                     ResearchGrantScreenContent(
//                       loremIpsum: loremIpsum,
//                       iconButtonOnPressed: () {
//                         setState(() {
//                           buttonPressed = !buttonPressed;
//                         });
//                       },
//                       iconButtonIcon: buttonPressed == false
//                           ? FontAwesomeIcons.heart
//                           : FontAwesomeIcons.solidHeart,
//                       iconButtonIconColor:
//                           buttonPressed == false ? Colors.green : Colors.red,
//                     ),
//                     SizedBox(height: 12),
//                     Divider(
//                       thickness: 1.0,
//                     ),
//                     SizedBox(height: 12),
//                     ResearchGrantScreenContent(
//                       loremIpsum: loremIpsum,
//                       iconButtonOnPressed: () {
//                         setState(() {
//                           buttonPressed = !buttonPressed;
//                         });
//                       },
//                       iconButtonIcon: buttonPressed == false
//                           ? FontAwesomeIcons.heart
//                           : FontAwesomeIcons.solidHeart,
//                       iconButtonIconColor:
//                           buttonPressed == false ? Colors.green : Colors.red,
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
