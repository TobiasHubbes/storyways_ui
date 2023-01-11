import 'package:tappedinterview/models/book_model.dart';

class BookListParser {
  List<Book> parseBookList(List<dynamic> json) {
    return json
        .map((dynamic e) => Book.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
