import 'package:flutter/material.dart';
import 'package:great_news/utils/all_function.dart';
import 'package:great_news/utils/color.dart';
import 'package:great_news/widgets/custom_appbar.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Web extends StatefulWidget {
   Web({ Key? key,
  required this.news
   }) : super(key: key);
   final Map<String, dynamic> news;
   final _allFunction = AllFunction();

  @override
  State<Web> createState() => _ExploreButtonState();
}

class _ExploreButtonState extends State<Web> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(title: '', 
            onTap: (){}, 
            isDisabled: false, 
            enableArrowBack: true,
            ),
            SizedBox(height: 8,),

            Expanded(
              child: WebView(
                initialUrl: widget.news['link'],
                javascriptMode: JavascriptMode.unrestricted,
              ),
            )
          ],
        ) 
      ),
    );
  }
}