import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:great_news/core/constants/apiKeys.dart';
import 'package:great_news/news_details.dart';
import 'package:great_news/utils/all_function.dart';
import 'package:great_news/utils/color.dart';
import 'package:great_news/utils/text.dart';
import 'package:timeago/timeago.dart' as timeago;


class ListNews extends StatelessWidget {
   ListNews({ Key? key,
   
   required this.news,
    }) : super(key: key);

   final Map<String, dynamic> news;
   

  final AllFunction _allFunction = AllFunction();

  @override
  Widget build(BuildContext context) {
    return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15), 
                              color: kPrimaryLightColor,
                            ),
                            margin: EdgeInsets.symmetric(vertical: 8),
                            //margin is for outside the container 
                            //while padding is for inside the container
                            padding: EdgeInsets.all( 8),
                            height:  120,
                            width: double.infinity,
                            child: InkWell(
                              onTap: (() {
                                Navigator.push(context, 
                                MaterialPageRoute(builder: (context)=> 
                                NewsDetail(
                                  news: news,
                                )
                                ));
                              }),
                              child: Row(
                                children: [
                                  Container(
                                    height: 100,
                                    width: 120,
                                    clipBehavior: Clip.hardEdge,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: CachedNetworkImage(
                                      imageUrl: news['media'] == null || news[ApiKeys.image]==''?
                                       'https://static.netnaija.com/i/gVpagA34KwO.jpg':
                                       news['media'],
                                       //ApiKeys.mage has alraedy been declared in the apiKey file
                                       // " " means empty string
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(width: 8,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: MediaQuery.of(context).size.width/2,
                                        child: AppText.captionMedium(news[ApiKeys.title],
                                        color: pure,
                                        overflow: TextOverflow.ellipsis,
                                        maxlines: 3,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      AppText.captionMedium(timeago.format(DateTime.parse(news[ApiKeys.time])))
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
  }
}