import 'package:flutter/material.dart';

class PriceTagWidget extends StatelessWidget {
  final String _price;

  PriceTagWidget(this._price);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0,vertical: 2.0),
      decoration: BoxDecoration(
        color: Theme.of(context).accentColor,
        borderRadius: BorderRadius.circular(4.0)
      ),
      child: Text(
        '\$$_price', 
        style: TextStyle(
          color: Colors.white
        ),
      ),
    );
  }
}