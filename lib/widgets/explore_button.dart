import 'package:flutter/material.dart';
//import 'package:great_news/utils/all_function.dart';
import 'package:great_news/utils/color.dart';
import 'package:great_news/utils/text.dart';
import 'package:great_news/widgets/webView.dart';

class ExploreButton extends StatelessWidget {
   ExploreButton({ Key? key,
  required this.news,
   }) : super(key: key);
   final Map<String, dynamic> news;
//final _allFunction = AllFunction();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => Web(
            news: news,
          )
          ));
      },
      child: Container(
        height: 70,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: kSecondaryColor,
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppText.headingMeduim('Explore'),
            Icon(Icons.explore_sharp,
            color: pure,
            )
          ],
        ),
        
      ),
    );
  }
}