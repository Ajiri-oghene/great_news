//import 'package:cached_network_image/cached_network_image.dart';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:great_news/core/services/news_services.dart';
import 'package:great_news/main.dart';
import 'package:great_news/news_details.dart';
import 'package:great_news/utils/all_function.dart';
import 'package:great_news/utils/color.dart';
import 'package:great_news/utils/text.dart';
import 'package:great_news/views/home_tab/components/bottom_loading.dart';
import 'package:great_news/views/home_tab/components/first_new_card.dart';
import 'package:great_news/views/home_tab/components/firstnewcard_skeleton.dart';
import 'package:great_news/views/home_tab/components/tabs.dart';
import 'package:great_news/widgets/custom_appbar.dart';
import 'package:great_news/widgets/listNewsSkeleton.dart';
import 'package:great_news/widgets/news_scroll.dart';
import 'package:sliver_tools/sliver_tools.dart';

class HomeView extends StatefulWidget {
  const HomeView({ Key? key,
  //this.fullPageIsEmpty = true,
   }) : super(key: key);
  //final bool? fullPageIsEmpty;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  
  final _allFunction = AllFunction();


  int selectedIndex = 0;
  int prevSelectedIndex = 0;//to prevent selected index from reloading,
  int firstSelectedIndex = 1;
  //e.g politics to business when you go back to politics it won't reload again
  var random = Random();
  late int randomNumber = random.nextInt(_allFunction.newsList.length);

  ScrollController scrollController = ScrollController();// ask for use
//scroll controller is used for pagenation
 List tabsList = [
  'Politics',
  'Business',
  'Sports',
  'Entertainment',
  'Travel',
  'Music',
  'Public',
  'Tech'
 ];

  //get newslist => null;
 
 @override
 void initState(){
init(tabsList[0]);  setState(() {});
scrollController.addListener(() { 
if (scrollController.position.pixels ==
scrollController.position.maxScrollExtent &&
_allFunction.newsList.isNotEmpty
){
  if (_allFunction.isLoading == false) {
    Future.delayed(const Duration(milliseconds: 200), ()
    
     => initGetMore(tabsList[selectedIndex])

    );
  }// this function is for bottom loading
}
}
);
 }
 init (q)async{
  print("here now");
  await _allFunction.getNews(q);
 setState(() {
   
 });
 }initGetMore(q) async {
    await _allFunction.getMoreNews(tabsList[selectedIndex]);
    setState(() {});
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        print("settin state now");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    //var index;
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Center(
                child: CustomAppBar(
                  enableArrowBack: false,
                  isDisabled: false,
                  title: MyApp.title,
                  onTap: (){},
                  
                ),
              ),

              Expanded(
                child: CustomScrollView(
                  controller: scrollController,
                  slivers: [
                    SliverToBoxAdapter(
                      child: GestureDetector(// first gesture detector
                      child:  _allFunction.newsList.isEmpty? FirstCardSkeleton(): FirstNewsCard(
                        news: _allFunction.newsList[randomNumber],
                      ),

                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) => NewsDetail(news:_allFunction.newsList[randomNumber] ,) 
                            )
                            );
                        },
                        
                        
                      ),
                    ),
                    const SliverToBoxAdapter(
                      child: const SizedBox(height: 20)
                    ),
                    SliverPinnedHeader(
                      child: Container(
                        padding: const EdgeInsets.only(bottom: 10, top: 10),
                        color: kPrimaryColor,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              ...List.generate(
                                tabsList.length,
                               (index) => InkWell(// second gesture detector
                                onTap: (){ 
                                  selectedIndex = index;
                                  setState(() {
                                  });
                                  //setState help change colour before api call
                                  _allFunction.newsList = [];// refresh listnews
                                init(tabsList[selectedIndex]);

                                  setState(() {
                                    
                                  });
                                 // Navigator.push(
                                   // context,
                                     //MaterialPageRoute(
                                      //builder: (Context) => NewsDetail()
                                     //)
                                  //);
                                },
                                child: Tabs(
                                  color: index == selectedIndex
                                  ? kSecondaryColor
                                  : kPrimaryColor,
                                  text: tabsList[index],
                                ),
                               )
                              )
                            ],
                          ),
                        ),
                      )
                    ),
                    SliverToBoxAdapter(
                      child: Column(
                        children: [
                          ...List.generate(10, (index) => _allFunction.newsList.isEmpty? ListNewsSkeleton():
                          ListNews(
                            news: _allFunction.newsList[index],
                          ),
                          ),
                        ],
                      ),
                    ),
                    if (_allFunction.newsList.isNotEmpty)
                    const SliverToBoxAdapter(
                      child: BottomLoading(),
                    )
                    
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}