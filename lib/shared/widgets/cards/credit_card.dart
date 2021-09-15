import 'package:flutter/material.dart';

Card creditCard(
    {required String cardNumber,
    required String cardHolder,
    required String cardExpiration}) {
  return Card(
    elevation: 4.0,
    color: Color(0xff0153A2),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(14),
    ),
    child: Container(
      height: 200,
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 22.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _buildLogosBlock(),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Text(
              '$cardNumber',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 21,
                  fontFamily: 'CourrierPrime'),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _buildDetailsBlock(
                label: 'CARDHOLDER',
                value: cardHolder.toUpperCase(),
              ),
              _buildDetailsBlock(label: 'VALID THRU', value: cardExpiration),
            ],
          ),
        ],
      ),
    ),
  );
}

Row _buildLogosBlock() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Image.asset(
        "assets/images/png/contact_less.png",
        height: 20,
        width: 18,
      ),
      Image.asset(
        "assets/images/png/mastercard.png",
        height: 50,
        width: 50,
      ),
    ],
  );
}

// Build Column containing the cardholder and expiration information
Column _buildDetailsBlock({required String label, required String value}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        '$label',
        style: TextStyle(
            color: Colors.grey, fontSize: 9, fontWeight: FontWeight.bold),
      ),
      Text(
        '$value',
        style: TextStyle(
          color: Colors.white,
          fontSize: 15,
          fontWeight: FontWeight.bold,
          fontFamily: 'CourrierPrime',
        ),
      )
    ],
  );
}
