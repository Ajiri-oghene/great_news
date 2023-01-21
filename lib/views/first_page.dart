import 'package:flutter/material.dart';
import 'package:great_news/news_details.dart';
import 'package:great_news/utils/color.dart';
import 'package:great_news/views/favourites/favourites.dart';
import 'package:great_news/views/home_tab/home_view.dart';
import 'package:great_news/views/search/search_view.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({ Key? key,
  //required this.news,
   }) : super(key: key);
  // final Map<String, dynamic> news;

  @override
  State<FirstPage> createState() => _FirstPageState();
}
int _selectedPage = 0;
PageController _pageController = PageController();

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    onpageChange(int index) {
      setState(() {
        _selectedPage = index;
      });
      _pageController.jumpToPage(index);
    }
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,// ask meaning of focus scope
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: PageView(// ask for meaning of pageview
          onPageChanged: onpageChange,// ask for meaning of onpage change
          controller: _pageController,// ask for meaning of page controller
          children: [
            const HomeView(),
            SearchView(),
            const FavouriteView(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: kPrimaryColor,
          items: const[
            BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 25,),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search, size: 25,),
              label: 'Search' 
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite, size:  25,),
              label: 'Favourite', 
            )
          ],
          currentIndex: _selectedPage,
          selectedItemColor: kSecondaryColor,
          unselectedItemColor: grey,
          onTap: onpageChange,
        ),
      ),

      
    );
  }
}