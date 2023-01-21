
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class NewsService{
  final String hostkey = 'free-news.p.rapidapi.com'; 
  final String apiKey = '7fbcb088d9msh3ce824fe7ecb2cbp1731d7jsn77469f7fdd18';
  final String host = 'X-RapidAPI-Key';
  final String api = 'X-RapidAPI-Key';
  final baseURL = 'https://free-news.p.rapidapi.com';
  final String dateToday = DateFormat('dd-mm-yyyy').format(DateTime.now());
  late int totalPages;

  Future<List<Map<String, dynamic>>> getNewsByKeyword({
    required String q,
    required int page,
  }) async{
    try{
      http.Response response = await http.get(
        Uri.parse(
          '$baseURL/v1/search?q=$q&page=$page&page_size=15'
        ),
        headers: {
          host: hostkey,
          api: apiKey,
        }
      );
print(response.body);
      final data = jsonDecode(response.body)['articles'];
     // totalPages = jsonDecode(response.body)[''];
     final List<Map<String, dynamic>> newsList =
     List<Map<String, dynamic>>.from(
      data.map((e)=>e)
     );
     return newsList;
    } catch (e) {
      print('error is $e');
      rethrow;
    }
  }

}