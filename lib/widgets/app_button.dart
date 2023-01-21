import 'package:flutter/material.dart';
import 'package:great_news/utils/color.dart';

// revisit code

class AppButton extends StatelessWidget {
  const AppButton({ Key? key,
  
  required this.title,
  this.backgroundColor = kSecondaryColor,
  this.showBorder = false,
  this.textColor = pure,
  this.onTap,
  this.showBoxShadow = false,
  this.height = 50,
  this.isDisabled = false,
  this.width

  
   }) : super(key: key);

   final String title;
   final double? width;
   final double? height;
   final Color backgroundColor;
   final bool showBoxShadow;
   final bool showBorder;
   final Color textColor;
   final Function()? onTap;
   final bool isDisabled;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {

      },
      child: Container(
        clipBehavior: Clip.none,
        height: height,
        width: width,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: kSecondaryColor,
        ),
      ),
    );
  }
}
