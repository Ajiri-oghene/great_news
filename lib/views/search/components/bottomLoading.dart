import 'package:flutter/material.dart';
import 'package:great_news/utils/color.dart';
import 'package:great_news/utils/text.dart';

class BottomLoading extends StatelessWidget {
  const BottomLoading({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppText.headingMeduim('Getting more feeds'),
        const SizedBox( width: 20),
        const SizedBox(
          height: 20,
          width: 20,
          child: Center(
            child: CircularProgressIndicator(
              color: kSecondaryColor,
            ),
          ),
        )
      ],
    );
  }
}