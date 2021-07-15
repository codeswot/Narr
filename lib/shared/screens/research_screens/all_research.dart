import 'package:flutter/material.dart';
import 'package:narr/core/services/service_injector/service_injectors.dart';
import 'package:narr/shared/globals/configs.dart';
import 'package:narr/shared/globals/global_var.dart';
import 'package:narr/shared/screens/research_screens/single_research.dart';
import 'package:narr/shared/widgets/cards/primary_card.dart';
import 'package:narr/shared/widgets/drawer/menu_drawer.dart';

class AllResearch extends StatefulWidget {
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
            var id = document['_id'];
            var image = document['thumbnail'];
            var imageUrl = '$baseUrl$image?token=${currentUser.token}';

            final coverPage = GestureDetector(
              onTap: () => narrService.routerService.nextRoute(
                context,
                SingleResearch(researchId: id),
              ),
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
