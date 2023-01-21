import 'package:flutter/material.dart';
import 'package:great_news/utils/color.dart';

class Skeleton extends StatelessWidget {
  const Skeleton({ Key? key,
  this.width,
  this.height,
  this.isRounded = true,
  this.radius,
   }) : super(key: key);
   final double? height, width;
   final double? radius;
   final bool isRounded;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          //!= means its not equal to
          radius != null
          ? radius!
          : isRounded
          ? 15
          :0
        ),
        color: kSkelenton,
      ),
      padding: const EdgeInsets.all(5),
      
    );
  }
}