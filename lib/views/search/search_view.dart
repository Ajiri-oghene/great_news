import 'package:flutter/material.dart';
import 'package:great_news/news_details.dart';
import 'package:great_news/utils/all_function.dart';
import 'package:great_news/utils/color.dart';
import 'package:great_news/utils/text.dart';
import 'package:great_news/views/search/components/search_bar.dart';
import 'package:great_news/widgets/ListNewsSkeleton.dart';
import 'package:great_news/widgets/news_scroll.dart';
import 'package:sliver_tools/sliver_tools.dart';


class SearchView extends StatefulWidget {
   SearchView({ Key? key,
   this.q,
    }) : super(key: key);
    String? q;
    // q is a constructor

  @override
  State<SearchView> createState() => _SearchViewState();
}

final AllFunction _allFunction = AllFunction();
class _SearchViewState extends State<SearchView> {

  @override
  void initState() {
   _allFunction.newsList.clear();
  Future.delayed(const Duration(microseconds: 200), () => init()); 
    super.initState();
    setState(() {
      
    });
  } 
  
  init() async{
    await _allFunction.getSearchNews(widget.q==null? 'trending' :widget.q);
    setState(() {
      
    });
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: kPrimaryColor,
              floating: true,
              leading: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.arrow_back_ios_new_outlined,
                  color: pure,
                  size: 25,
                ),
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, 
                      MaterialPageRoute(
                        builder: (context) => SearchBar() 
                      )
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                      decoration: BoxDecoration(
                        color: kPrimaryLightColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      width: MediaQuery.of(context).size.width - 135,
                      child: Row(
                        children: [
                          AppText.captionMedium(widget.q == null?'Search myNewz':"${widget.q}")
                        ],
                      ),
                    ),
                  )
                ],
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: GestureDetector(
                    onTap: (){},
                    child: const Icon(
                      Icons.settings,
                      color: pure,
                      size: 25,
                    ),
                  ),
                )
              ],
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: 5),
            ),
            const SliverToBoxAdapter(
              child: Divider(
                thickness: 2,
              ),
            ),
            SliverPinnedHeader(
              child: Container(
                padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
                color: kPrimaryColor,
                child: AppText.headingMeduim('Trending & Latest on myNewz'),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    ...List.generate(9, (index) => InkWell(
                      onTap: () {
                        Navigator.push(context, 
                        MaterialPageRoute(builder: (context) => NewsDetail(
                          news: _allFunction.newsList[index]
                        ))
                        );
                      },
                      child:_allFunction.newsList.isEmpty? ListNewsSkeleton(): ListNews(
                        news: _allFunction.newsList[index],
                      ),
                    )
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}