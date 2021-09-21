import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:narr/shared/widgets/cards/primary_card.dart';

class BankInfoTab extends StatefulWidget {
  const BankInfoTab({
    Key? key,
  }) : super(key: key);

  @override
  _BankInfoTabState createState() => _BankInfoTabState();
}

class _BankInfoTabState extends State<BankInfoTab> {
  int currentPosition = 0;
  List bankInfo = [
    {
      'accountName': 'Musa Jibril',
      'bankName': 'FCMB',
      'accountNumber': 0123456789
    },
    {
      'accountName': 'Jibril Musa',
      'bankName': 'GTBank',
      'accountNumber': 0123456789
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CarouselSlider.builder(
                itemBuilder: (context, index, item) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 15.0, left: 15.0, right: 15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Bank Details(${index + 1}/${bankInfo.length})',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            CircleAvatar(
                              radius: 16,
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 17,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      PrimaryCard(
                        child: Column(
                          children: [
                            ListTile(
                              leading: Icon(Icons.account_balance),
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Bank Name',
                                    style: TextStyle(
                                      color: Colors.grey[500],
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    bankInfo[index]['bankName'],
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            ListTile(
                              leading: Icon(Icons.account_circle),
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Account holder name',
                                    style: TextStyle(
                                      color: Colors.grey[500],
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    bankInfo[index]['accountName'],
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            ListTile(
                              leading: Icon(FontAwesomeIcons.calculator),
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Account number',
                                    style: TextStyle(
                                      color: Colors.grey[500],
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    bankInfo[index]['accountNumber'].toString(),
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: bankInfo.map((bank) {
                                int index = bankInfo.indexOf(bank);
                                return Container(
                                  width: 8.0,
                                  height: 8.0,
                                  margin: EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 2.0),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: currentPosition == index
                                        ? Color.fromRGBO(0, 0, 0, 0.9)
                                        : Color.fromRGBO(0, 0, 0, 0.4),
                                  ),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
                itemCount: bankInfo.length,
                options: CarouselOptions(
                    height: 300,
                    viewportFraction: 1.0,
                    scrollDirection: Axis.horizontal,
                    onPageChanged: (index, reason) {
                      setState(() {
                        currentPosition = index;
                      });
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
