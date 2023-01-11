import 'package:flutter/material.dart';
import 'package:tappedinterview/api/data/fetch_book_data.dart';
import 'package:tappedinterview/models/book_model.dart';

class BookListProvider extends ChangeNotifier {
  List<Book> _books = [];

  List<Book> get books => _books;

  void addBook(Book book) {
    _books.add(book);
    notifyListeners();
  }

  void addBookList(List<Book> books) {
    _books.addAll(books);
    notifyListeners();
  }

  void removeBook(Book book) {
    _books.remove(book);
    notifyListeners();
  }

  Future<void> loadBooks() async {
    _books = await fetchBookData();
    notifyListeners();
  }
}
