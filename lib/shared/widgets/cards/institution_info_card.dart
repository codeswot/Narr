import 'package:flutter/material.dart';
import 'package:narr/shared/widgets/cards/primary_card.dart';

class InstitutionInfoCard extends StatelessWidget {
  const InstitutionInfoCard({
    Key? key,
    required this.name,
    required this.logo,
    required this.type,
    required this.acronym,
    required this.ownership,
    required this.established,
    required this.website,
    required this.onTap,
  }) : super(key: key);
  final String name;
  final String logo;
  final String type, acronym, ownership, established, website;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return PrimaryCard(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: MediaQuery.of(context).size.width / 80 * 48,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Name: ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                    Container(
                      // width: 130,
                      child: Text(
                        name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 7),
                Row(
                  children: [
                    Text(
                      'Type: ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                    Text(type),
                  ],
                ),
                SizedBox(height: 7),
                Row(
                  children: [
                    Text(
                      'Ownership: ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                    Text(ownership),
                  ],
                ),
                SizedBox(height: 7),
                Row(
                  children: [
                    Text(
                      'Established: ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                    Text(established),
                  ],
                ),
                SizedBox(height: 7),
                Row(
                  children: [
                    Text(
                      'Website: ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                    Container(
                      width: 140,
                      child: Text(
                        website,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 7),
                Row(
                  children: [
                    Text(
                      'Acronym: ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                    Text(acronym),
                  ],
                ),
              ],
            ),
          ),
          CircleAvatar(
            radius: 40,
            child: CircleAvatar(
              radius: 38,
              backgroundColor: Colors.white,
              backgroundImage: NetworkImage(logo),
            ),
          ),
        ],
      ),
    );
  }
}

// Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 CircleAvatar(
//                   radius: 30,
//                   child: CircleAvatar(
//                     radius: 28,
//                     backgroundColor: Colors.white,
//                     backgroundImage: NetworkImage(logo),
//                   ),
//                 ),
//                 SizedBox(width: 10),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Text(
//                       name,
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 13,
//                       ),
//                       textAlign: TextAlign.center,
//                       overflow: TextOverflow.ellipsis,
//                       maxLines: 2,
//                     ),
//                     Text(
//                       '($acronym)',
//                       style: TextStyle(
//                         fontSize: 10,
//                       ),
//                       textAlign: TextAlign.center,
//                       overflow: TextOverflow.ellipsis,
//                       maxLines: 1,
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//             Divider(thickness: 1.3),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'Name: $name',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 12,
//                   ),
//                 ),
//                 SizedBox(height: 5),
//                 Text(
//                   'Type: $type',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 12,
//                   ),
//                 ),
//                 SizedBox(height: 5),
//                 Text(
//                   'Ownership: $ownership',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 12,
//                   ),
//                 ),
//                 SizedBox(height: 5),
//                 Text(
//                   'Established: $established',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 12,
//                   ),
//                 ),
//                 SizedBox(height: 5),
//                 Row(
//                   children: [
//                     Text(
//                       'Website: ',
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 12,
//                       ),
//                     ),
//                     Text(
//                       '$website',
//                       style: TextStyle(
//                         fontSize: 12,
//                         color: Colors.blue,
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ],
//         ),
