import 'package:flutter/material.dart';
//import 'package:great_news/news_details.dart';
import 'package:great_news/views/first_page.dart';
import 'package:great_news/widgets/splash.dart';
//import 'package:great_news/views/search/components/search_bar.dart';
//import 'package:great_news/views/search/search_view.dart';
//import 'package:great_news/views/home_view.dart';

void main() {
  runApp( const MyApp(//news: {},
  ));
}

 class MyApp extends StatelessWidget {
   const MyApp({ Key? key,
   //required this.news,
    }) : super(key: key);
   // final Map<String, dynamic> news;
   static final String  title = 'Great News';
 
   @override
   Widget build(BuildContext context) {
     return MaterialApp(
       title: title,
       home:  SplashScreen(),
     );
   }
 }