import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:great_news/core/constants/apiKeys.dart';
import 'package:great_news/utils/all_function.dart';
import 'package:great_news/utils/color.dart';
import 'package:great_news/utils/text.dart';
import 'package:timeago/timeago.dart' as timeago;


class FirstNewsCard extends StatefulWidget {
   FirstNewsCard({ Key? key,
  required this.news, 
  // required this.title,
  // required this.image,
  // this.icon,
  // required this.days,
  }) : super(key: key);

 final Map<String, dynamic> news;

  @override
  State<FirstNewsCard> createState() => _FirstNewsCardState();
}

class _FirstNewsCardState extends State<FirstNewsCard> {
// final String image;
bool onClicked = false;

//addFavoufrite(){
final AllFunction _allFunction = AllFunction(); 
 //(instance of all function)
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
       Container(
          height: 350,
          width: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: CachedNetworkImage(
              //for stateful widget you use widget.news['media']
             imageUrl: widget.news[ApiKeys.image],
              fit: BoxFit.cover,
            ),
          ),
        ),

        Positioned(
          child: Container(
            width: double.infinity,
            height: 350,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.2),
              borderRadius: BorderRadius.circular(15),
            ),
          )
        ),
        Positioned(
          bottom: 40,
          left: 15,
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: AppText.headingRegular(widget.news[ApiKeys.title],
            overflow: TextOverflow.ellipsis,
            maxlines: 3,
            ),
          ), 
        ),
        Positioned(
          bottom: 20,
          left: 15,
          child: AppText.captionMedium(timeago.format(DateTime.parse(widget.news[ApiKeys.time])),
          color: pure, 
          ),
        ),
        Positioned(
          right: 15,
          top: 20,
          child: GestureDetector(
            onTap: () {
              //kSecondaryColor;
              _allFunction.addFavourite(widget.news); //news replaces f
              // revisit ontap colour
              onClicked = true;
              //anytime you want to change colour you use bool
              setState(() {
                
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: kSecondaryColor,
                  elevation: 5,
                  duration: Duration(seconds: 3),
                  content: AppText.headingMeduim('Added to favourites')),
                
              );
            },
            child: Container(
              child: Icon(Icons.favorite,
              color: onClicked == true? kSecondaryColor: pure,
              ),
            ),
          ),
        )
      ],
    );
  }
}