import 'package:flutter/material.dart';
import 'package:great_news/utils/color.dart';
import 'package:great_news/widgets/skeleton.dart';
import 'package:shimmer/shimmer.dart';

class FirstCardSkeleton extends StatelessWidget {
  const FirstCardSkeleton({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[400]!,
      highlightColor:Colors.grey[300] !,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 350,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15)
            ),
            child: Skeleton()
          ),
          const Positioned(
            bottom: 40,
            left: 15,
            child: Skeleton(
              width: 305,
              height: 15
            ),
          ),
         const Positioned(
            bottom: 20,
            left: 15,
            child: Skeleton(
              height: 15,
              width: 185,
            )
          ),
          const Positioned(
            right: 15,
            top: 20,
            child: Skeleton(
              height: 40,
              width: 40,
            )
          )
        ],
      ),
    );
  }
}


