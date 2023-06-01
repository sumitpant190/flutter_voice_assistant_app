// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class FeaturesBox extends StatelessWidget {
  final String headerText;
  final Color color;
  final String descriptionText;
  const FeaturesBox({
    Key? key,
    required this.headerText,
    required this.color,
    required this.descriptionText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 35, vertical: 6),
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14.0)
            .copyWith(left: 15, right: 15),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                headerText,
                style: TextStyle(
                    fontFamily: 'Cera Pro',
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 3,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 22.0),
              child: Text(
                descriptionText,
                style: TextStyle(
                  fontFamily: 'Cera Pro',
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
