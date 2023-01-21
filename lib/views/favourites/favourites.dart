import 'package:flutter/material.dart';
import 'package:great_news/utils/all_function.dart';
import 'package:great_news/utils/color.dart';
import 'package:great_news/widgets/custom_appbar.dart';
import 'package:great_news/widgets/news_scroll.dart';


class FavouriteView extends StatefulWidget {
  const FavouriteView({ Key? key }) : super(key: key);

  @override
  State<FavouriteView> createState() => _FavouriteViewState();
  
}

class _FavouriteViewState extends State<FavouriteView> {
  final _allFunction = AllFunction();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(title: 'Favourites',
            icon: Icons.delete_outline,
             onTap: (){},
              isDisabled: false,
               enableArrowBack: false,
              ),
              const SizedBox(height: 20,),
              Expanded(
                child: ListView(
                  children: [
                    ...List.generate(
                      AllFunction.favouriteList.length, (index) => 
                      ListNews(news: AllFunction.favouriteList[index]
                      )
                    )
                  ],
                ),
              )
          ],
        )
      ),
    );
  }
}