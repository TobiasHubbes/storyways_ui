import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:tappedinterview/models/book_model.dart';
import 'package:tappedinterview/api/parser/book_list_parser.dart';

Future<List<Book>> fetchBookToContinueData() async {
  try {
    final jsonData =
        await rootBundle.loadString('assets/json/books_to_continue.json');
    return BookListParser()
        .parseBookList(json.decode(jsonData)["books"] as List<dynamic>);
  } catch (e) {
    // TODO: Handle error
  }
  return [];
}
