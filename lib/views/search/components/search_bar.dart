import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:great_news/utils/color.dart';
import 'package:great_news/utils/text.dart';
import 'package:great_news/views/search/search_view.dart';



class SearchBar extends StatefulWidget {
  const SearchBar({ Key? key, this.text }) : super(key: key);
  final String? text;

  @override
  State<SearchBar> createState() => _SearchState();
}

class _SearchState extends State<SearchBar> {
  final TextEditingController _controller = TextEditingController();
  @override
  void initState() {
   // _controller.text = widget.text;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(5, 5, 0, 5),
                    decoration: BoxDecoration(
                      color: kPrimaryColor.withOpacity(0.2),
                    ),
                    width: MediaQuery.of(context).size.width,
                    child: TextField(
                      onSubmitted: (value) {
                        value = _controller.text;
                        Navigator.pushReplacement(context,
                         MaterialPageRoute(
                          builder: (context) => SearchView(q: _controller.text,
                            
                          )
                          )
                         );
                      },
                      controller: _controller,
                      textInputAction: TextInputAction.search,
                      autofocus: true,
                      style:  const TextStyle(
                        color: pure,
                        fontSize: 18
                      ),
                      decoration: InputDecoration(
                        prefixIcon: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            Icons.arrow_back_ios_new_outlined,
                            color: pure,
                            size: 20,
                          ),
                        ),
                        hintText: 'search',
                        hintStyle: const TextStyle(
                          fontSize: 15,
                          color: grey,
                        ),
                        border: InputBorder.none
                      ),
                    ),
                  )
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: AppText.headingMeduim('Recent searches'),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.cancel,
                      color: grey,
                    ),
                    const SizedBox(width: 5)
                  ],
                ),
              ),
            )
          ],
        )
        ),
    );
  }
}