import 'package:flutter/material.dart';
import 'package:great_news/main.dart';
import 'package:great_news/utils/color.dart';
import 'package:great_news/utils/text.dart';

class CustomAppBar extends StatelessWidget {
   CustomAppBar({
    
     Key? key,
     required this.title,
     this.icon,
     required this.onTap,
     required this.isDisabled,
     required this.enableArrowBack,
     
      }) : super(key: key);

      final String title;
      final IconData? icon;// meaning of ? //meaning of icondata
      //sign means its nullable
      final Function()? onTap;
      bool? isDisabled;// ask for meaning of isDisabled
      //if true means something is disabled
      bool? enableArrowBack;

      //? read ternary operator in C related programming languages
      //object oriented languages
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 0, 20, 5),
      child: Row(
        children:[
          enableArrowBack! ?// ask meaning
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios_new, color: pure,),
          )
          : const Center(),
          const SizedBox(width:  20),
          AppText.heading(MyApp.title),
          Spacer(),
          isDisabled == false
          ? InkWell(
            onTap: onTap,
            child: Icon(icon, color: pure, size:  30,),
          )
          : Center()
        ]
      ),
    );
  }
}