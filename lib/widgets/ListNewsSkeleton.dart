import 'package:flutter/material.dart';
import 'package:great_news/utils/color.dart';
import 'package:great_news/widgets/skeleton.dart';
import 'package:shimmer/shimmer.dart';

class ListNewsSkeleton extends StatelessWidget {
  const ListNewsSkeleton({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[400]!,
      highlightColor: Colors.grey[300] !,
      child:  Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15), 
                              color: kSkelenton,
                            ),
                            margin: EdgeInsets.symmetric(vertical: 8),
                            //margin is for outside the container 
                            //while padding is for inside the container
                            padding: EdgeInsets.all( 8),
                            height:  120,
                            width: double.infinity,
                            //  child: InkWell(
                            //   onTap: (() {
                            //     Navigator.push(context, 
                            //     MaterialPageRoute(builder: (context)=> 
                            //     NewsDetail(
                            //       news: news,
                            //     )
                            //     ));
                             // }),
                              child: Row(
                                children: [
                                  Container(
                                    height: 100,
                                    width: 120,
                                    clipBehavior: Clip.hardEdge,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Skeleton(
                                      height: 100,
                                      width: 120,
                                    ) 
                                    // CachedNetworkImage(
                                    //   imageUrl: news['media'] == null?
                                    //    'https://static.netnaija.com/i/gVpagA34KwO.jpg':
                                    //    news['media'],
                                    //   fit: BoxFit.cover,
                                    // ),
                                  ),
                                  const SizedBox(width: 8,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: MediaQuery.of(context).size.width/2,
                                        child: Skeleton(
                                          height: 15,
                                          width: 85,
                                        )
                                        // AppText.captionMedium(news['title'],
                                        // color: pure,
                                        // overflow: TextOverflow.ellipsis,
                                        //maxlines: 3,
                                        ),
                                      //),
                                      SizedBox(height: 5),
                                      Skeleton(
                                        height: 15,
                                        width: 50,
                                      )
                                     // AppText.captionMedium(news['published_date'])
                                    ],
                                  )
                                ],
                              ),
                            ),
                          
      );
    
  }
}