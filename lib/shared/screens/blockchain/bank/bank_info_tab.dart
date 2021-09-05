import 'package:flutter/material.dart';
import 'package:narr/shared/widgets/cards/primary_card.dart';
import 'package:narr/shared/widgets/forms/info_textfield.dart';

class BankInfoTab extends StatelessWidget {
  const BankInfoTab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: PrimaryCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Bank Details'),
                  Text(
                    'Edit',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
              Divider(thickness: 2),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InfoTextField(
                    data: 'Account Name',
                    value: 'Musa Damu',
                  ),
                  SizedBox(height: 15),
                  InfoTextField(
                    data: 'Account number',
                    value: '021133944',
                  ),
                  SizedBox(height: 15),
                  InfoTextField(
                    data: 'Bank Name',
                    value: 'FCMB',
                  ),
                ],
              ),
              SizedBox(height: 25),
              Text('BVN Details'),
              Divider(thickness: 2),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InfoTextField(
                    data: 'First Name',
                    value: 'Musa',
                  ),
                  SizedBox(height: 15),
                  InfoTextField(
                    data: 'Middle Name',
                    value: '-',
                  ),
                  SizedBox(height: 15),
                  InfoTextField(
                    data: 'Sur Name',
                    value: 'Damu',
                  ),
                  SizedBox(height: 15),
                  InfoTextField(
                    data: 'BVN',
                    value: '3948272238',
                  ),
                  SizedBox(height: 15),
                  InfoTextField(
                    data: 'Date of birth',
                    value: '12/05/2000',
                  ),
                  SizedBox(height: 15),
                  InfoTextField(
                    data: 'Gender',
                    value: 'Male',
                  ),
                ],
              ),
              SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}
