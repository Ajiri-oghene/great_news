import 'dart:ffi';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:great_news/utils/color.dart';
import 'package:great_news/utils/text.dart';
import 'package:great_news/views/first_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({ Key? key }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async{
    await Future.delayed(Duration(milliseconds: 400), () {
    Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => FirstPage()));  
    });
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Container(
            //   height: 350,
            //   width: 450,
            //   clipBehavior: Clip.hardEdge,
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(15),
            //   ),
            //   child: CachedNetworkImage(
            //     imageUrl: 'https://c8.alamy.com/comp/PR1RFW/news-logo-illustration-PR1RFW.jpg' ),
            // ),
            // SizedBox(height: 12,),
            AppText.headingRegular('Great News'),
          ],
        ),
      ),
    );
  }
}