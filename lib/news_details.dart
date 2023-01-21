import 'package:flutter/material.dart';
import 'package:great_news/utils/all_function.dart';
import 'package:great_news/utils/color.dart';
import 'package:great_news/utils/text.dart';
import 'package:great_news/views/home_tab/components/first_new_card.dart';
import 'package:great_news/widgets/explore_button.dart';


class NewsDetail extends StatelessWidget {
   NewsDetail({ Key? key,
   required this.news,
    }) : super(key: key);

  final _allFunction = AllFunction();
  final Map<String, dynamic> news;
   

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: Expanded(
          child:
          ListView(
            children: [
              Container(
                margin: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     FirstNewsCard(
                      news: news,
                    ),
                   SizedBox(height: 20,),
                   AppText.headingMeduim(news['summary']),
                   SizedBox(height: 20,),
                   ExploreButton(news: news,)

                  ],
                ),
              ),
            ],
          ) ,
        ) 
      ),
    );
  }
}