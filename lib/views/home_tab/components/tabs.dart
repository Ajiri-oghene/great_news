import 'package:flutter/material.dart';
import 'package:great_news/utils/color.dart';
import 'package:great_news/utils/text.dart';

class Tabs extends StatelessWidget {
   Tabs({ Key? key, 
  required this.color,
  required this.text
  }) : super(key: key);

  late String text; // meaning of late
  late Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 5,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: color
        ),
        child: AppText.captionMedium(text,
        color: pure,
        ),
      ),
    );
  }
}