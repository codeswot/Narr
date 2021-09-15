import 'package:flutter/material.dart';
import 'package:narr/core/services/service_injector/service_injectors.dart';
import 'package:narr/shared/globals/configs.dart';
import 'package:narr/shared/globals/global_var.dart';
import 'package:narr/shared/screens/research_screens/single_research.dart';
import 'package:narr/shared/widgets/cards/primary_card.dart';

class ResearchCategory extends StatefulWidget {
  final String category;

  ResearchCategory(this.category);

  @override
  _ResearchCategoryState createState() => _ResearchCategoryState();
}

class _ResearchCategoryState extends State<ResearchCategory> {
  List<Widget> researchWidget = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<dynamic>(
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
            if (widget.category == 'all') {
              researchWidget.add(coverPage);
            } else {
              researchWidget.add(
                widget.category == document['genre'] ? coverPage : Container(),
              );
            }
          }
          return ListView(
            children: researchWidget,
          );
        },
      ),
    );
  }
}
