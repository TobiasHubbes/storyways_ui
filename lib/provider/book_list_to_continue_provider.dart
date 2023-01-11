import 'package:tappedinterview/api/data/fetch_book_to_continue_data.dart';
import 'package:tappedinterview/provider/book_list_provider.dart';

class BookListToContinueProvider extends BookListProvider {
  @override
  Future<void> loadBooks() async {
    super.addBookList(await fetchBookToContinueData());
  }
}
