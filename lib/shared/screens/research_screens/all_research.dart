import 'package:flutter/material.dart';
import 'package:narr/core/services/service_injector/service_injectors.dart';
import 'package:narr/shared/globals/configs.dart';
import 'package:narr/shared/globals/global_var.dart';
import 'package:narr/shared/widgets/cards/primary_card.dart';
import 'package:narr/shared/widgets/drawer/menu_drawer.dart';

class AllResearch extends StatefulWidget {
  static String id = '/repository list';
  @override
  _AllResearchState createState() => _AllResearchState();
}

class _AllResearchState extends State<AllResearch> {
  @override
  Widget build(BuildContext context) {
    List<Widget> researchWidget = [
      Container(
        margin: EdgeInsets.all(15),
        child: Material(
          elevation: 5.0,
          borderRadius: BorderRadius.circular(50),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search Repository',
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              contentPadding: EdgeInsets.only(
                left: 15,
                bottom: 11,
                top: 11,
                right: 15,
              ),
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 160),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                offset: Offset(0, 2.5),
                blurRadius: 5,
              ),
            ],
          ),
          // child: DropdownButtonFormField<dynamic>(
          //   decoration: InputDecoration(
          //     border: UnderlineInputBorder(
          //       borderSide: BorderSide.none,
          //     ),
          //   ),
          //   hint: Padding(
          //     padding: const EdgeInsets.only(left: 8.0),
          //     child: Text(
          //       'By Category',
          //       style: TextStyle(color: Colors.grey[700]),
          //     ),
          //   ),
          //   // items: _dropdownHelper.getFilterDropdownItems(),
          //   // onChanged: (value) {
          //   //   setState(() {
          //   //     _dropdownHelper.selectedFilter = value;
          //   //   });
          //   // },
          // ),
        ),
      ),
      SizedBox(
        height: 11,
      ),
      Padding(
        padding: const EdgeInsets.only(bottom: 8.0, left: 15),
        child: Text(
          'All Research',
          style: TextStyle(fontSize: 20, color: Colors.grey),
        ),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Repository'),
      ),
      drawer: Drawer(
        child: DrawerItems(),
      ),
      body: FutureBuilder<dynamic>(
        future: narrService.researchService.getAllResearch(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (!snapshot.hasData) {
            return Center(
              child: Text('No Data!'),
            );
          }

          final payload = snapshot.data;

          for (var document in payload) {
            var image = document['thumbnail'];
            var imageUrl = '$baseUrl$image?token=${currentUser.token}';

            final coverPage = Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
              child: PrimaryCard(
                child: Container(
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(6),
                      topLeft: Radius.circular(6),
                    ),
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            );
            researchWidget.add(coverPage);
          }
          return ListView(
            children: researchWidget,
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        // backgroundColor: Color(0xff00a368),
        onPressed: () {
          // Navigator.of(context).pushNamed(SingleFileUpload.id);
        },
        label: Text('Upload Research'),
        icon: Icon(Icons.add),
      ),
    );
  }
}

// class ResearchRepositoryCard extends StatelessWidget {
//   const ResearchRepositoryCard({
//     Key? key,
//     required this.imageUrl,
//     required this.researchTitle,
//     required this.researchYear,
//     required this.researchAuthor,
//     required this.pages,
//     required this.onTap,
//     required this.category,
//     required this.genre,
//   }) : super(key: key);
//   final String researchTitle, researchYear, imageUrl, category, genre;
//   final int pages;
//   final String researchAuthor;
//   final VoidCallback onTap;
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         width: double.infinity,
//         margin: EdgeInsets.only(left: 15, right: 15, bottom: 15),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(6),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.15),
//               offset: Offset(0, 2.5),
//               blurRadius: 5,
//             ),
//           ],
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Stack(
//               children: [
//                 Container(
//                   height: 280,
//                   width: double.infinity,
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.only(
//                       topRight: Radius.circular(6),
//                       topLeft: Radius.circular(6),
//                     ),
//                     child: Image.network(
//                       imageUrl,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 5),
//             Padding(
//               padding: const EdgeInsets.only(left: 8.0, right: 8.0),
//               child: Divider(
//                 color: Color(0xff00a368),
//               ),
//             ),
//             Container(
//               padding: EdgeInsets.all(15),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     '$researchTitle',
//                     maxLines: 2,
//                     overflow: TextOverflow.ellipsis,
//                     style: TextStyle(
//                       fontSize: 17,
//                       fontWeight: FontWeight.bold,
//                       color: Color(0xff1b5e20),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 12,
//                   ),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         children: [
//                           Text(
//                             'Authors: ',
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               color: Color(0xff1b5e20),
//                             ),
//                           ),
//                           Flexible(
//                             child: Text(
//                               '$researchAuthor',
//                               maxLines: 1,
//                               overflow: TextOverflow.ellipsis,
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: 5,
//                       ),
//                       Row(
//                         children: [
//                           Text(
//                             'Year: ',
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               color: Color(0xff1b5e20),
//                             ),
//                           ),
//                           Text(
//                             '$researchYear',
//                             maxLines: 1,
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: 5,
//                       ),
//                       Row(
//                         children: [
//                           Text(
//                             'Pages: ',
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               color: Color(0xff1b5e20),
//                             ),
//                           ),
//                           Text(
//                             '$pages',
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: 5,
//                       ),
//                       Row(
//                         children: [
//                           Text(
//                             'Category: ',
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               color: Color(0xff1b5e20),
//                             ),
//                           ),
//                           Text(
//                             '$category',
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: 5,
//                       ),
//                       Row(
//                         children: [
//                           Text(
//                             'Genre: ',
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               color: Color(0xff1b5e20),
//                             ),
//                           ),
//                           Text(
//                             '$genre',
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
