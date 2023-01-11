import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tappedinterview/provider/book_list_provider.dart';
import 'package:tappedinterview/provider/book_list_to_continue_provider.dart';
import 'package:tappedinterview/ui/widgets/book_entry/book_entry.dart';
import 'package:tappedinterview/ui/widgets/book_entry/book_entry_to_continue.dart';
import 'package:tappedinterview/ui/widgets/core/bottom_navigation_bar.dart';
import 'package:tappedinterview/ui/widgets/core/search_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<void>? loadBooksNew;
  Future<void>? loadBooksToContinue;

  @override
  void initState() {
    loadBooksNew =
        Provider.of<BookListProvider>(context, listen: false).loadBooks();
    loadBooksToContinue =
        Provider.of<BookListToContinueProvider>(context, listen: false)
            .loadBooks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: cSearchbarHeight,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      "Continue",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.175,
                    child: bookListToContinue(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0, top: 18.0),
                    child: Text(
                      "New",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                  Flexible(child: bookListNew()),
                ],
              ),
            ),
            const SearchBar(),
          ],
        ),
      ),
      bottomNavigationBar: const StorywaysBottomNavigationBar(),
    );
  }

  Widget bookListToContinue() {
    return Consumer<BookListToContinueProvider>(
      builder: ((context, bookList, child) => FutureBuilder(
            future: loadBooksToContinue,
            builder: ((context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }
              if (snapshot.hasError) {
                return const Text('ERROR');
              }
              return ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: bookList.books.length,
                separatorBuilder: (context, index) => const SizedBox(width: 19),
                itemBuilder: (context, index) {
                  return BookEntryToContinue(book: bookList.books[index]);
                },
              );
            }),
          )),
    );
  }

  Widget bookListNew() {
    return Consumer<BookListProvider>(
      builder: ((context, bookList, child) => FutureBuilder(
            future: loadBooksNew,
            builder: ((context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }
              if (snapshot.hasError) {
                return const Text('ERROR');
              }
              return ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: bookList.books.length,
                itemBuilder: (context, index) {
                  return BookEntry(book: bookList.books[index]);
                },
                separatorBuilder: (context, index) => const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Divider(),
                ),
              );
            }),
          )),
    );
  }
}
