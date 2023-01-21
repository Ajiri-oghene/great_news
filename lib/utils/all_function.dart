


//import 'package:flutter/cupertino.dart';
import 'package:great_news/core/services/news_services.dart';

class AllFunction{
  List<Map<String, dynamic>> newsList = [];
  //List<Map<String, dynamic>> searchNewsList = [];
  //List<Map<String, dynamic>> trendingList = [];
  static final List<Map<String, dynamic>> favouriteList = [];


int page = 1;
bool isLoading = false;
 final NewsService _newsService = NewsService();

  getNews(q) async{ // why page: page
    newsList.addAll(await _newsService.getNewsByKeyword(q: q, page:page ));
  }

   getSearchNews(q) async{ // why page: page
    newsList.addAll(await _newsService.getNewsByKeyword(q: q, page:page ));
  }

  addFavourite(Map<String,dynamic> f){
    favouriteList.add(f);
  }
  getMoreNews(q){
    page++;
    if (page < _newsService.totalPages){
      getNews(q);
    }
  }

}