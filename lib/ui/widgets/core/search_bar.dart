import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tappedinterview/models/book_model.dart';
import 'package:tappedinterview/provider/book_list_provider.dart';
import 'package:tappedinterview/ui/widgets/book_entry/book_entry_search_result.dart';

const double cSearchbarHeight = 60.0;

class SearchBar extends StatefulWidget {
  const SearchBar({super.key});

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  void _closeResults() {
    _searchController.clear();
    FocusManager.instance.primaryFocus?.unfocus();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: () {
            _closeResults();
          },
          child: (_searchController.text.isNotEmpty)
              ? Container(
                  color: Colors.transparent,
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                )
              : const SizedBox(),
        ),
        SafeArea(
          child: Column(
            children: [
              Container(
                color: Theme.of(context).colorScheme.background,
                padding: const EdgeInsets.symmetric(horizontal: 18),
                height: cSearchbarHeight,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: TextField(
                        focusNode: focusNode,
                        onChanged: (value) => _onSearchChanged(),
                        controller: _searchController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search for something',
                          hintStyle: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                        ),
                      ),
                    ),
                    (_searchController.text.isEmpty)
                        ? IconButton(
                            icon: Icon(
                              Icons.search,
                              color: Theme.of(context).colorScheme.onBackground,
                            ),
                            onPressed: () {
                              focusNode.requestFocus();
                            },
                          )
                        : IconButton(
                            onPressed: () {
                              _closeResults();
                            },
                            icon: Icon(
                              Icons.close,
                              color: Theme.of(context).colorScheme.onBackground,
                            ),
                          ),
                  ],
                ),
              ),
              _buildSearchResult(),
            ],
          ),
        ),
      ],
    );
  }

  void _onSearchChanged() {
    if (_searchController.text.isEmpty) {
      _closeResults();
    }
    setState(() {});
  }

  Widget _buildSearchResult() {
    final List<Book> books =
        Provider.of<BookListProvider>(context, listen: false).books;
    List<Book> listToShow;
    if (_searchController.text.isNotEmpty) {
      listToShow = books
          .where(
            (e) =>
                e.title
                    .toLowerCase()
                    .contains(_searchController.text.toLowerCase()) ||
                e.title
                    .toLowerCase()
                    .startsWith(_searchController.text.toLowerCase()),
          )
          .toList();

      return Flexible(
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF2C885C).withOpacity(0.3),
                spreadRadius: 0,
                blurRadius: 10,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: listToShow.length,
            separatorBuilder: (context, index) => const Divider(),
            itemBuilder: (context, index) {
              return BookEntrySearchResult(book: listToShow[index]);
            },
          ),
        ),
      );
    } else {
      return const SizedBox();
    }
  }
}

/*
class BuildSearchResult extends SearchDelegate<Book> {
  final List<Book> books;

  BuildSearchResult({required this.books});

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Book> listToShow;
    if (query.isNotEmpty) {
      listToShow = books
          .where((e) =>
              e.title.toLowerCase().contains(query.toLowerCase()) ||
              e.title.toLowerCase().startsWith(query.toLowerCase()))
          .toList();
    } else {
      listToShow = books;
    }

    return Container(
        color: Colors.red,
        child: ListView.separated(
          shrinkWrap: true,
          itemCount: listToShow.length,
          separatorBuilder: (context, index) => const Divider(),
          itemBuilder: (context, index) {
            return BookEntrySearchResult(book: listToShow[index]);
          },
        ));
  }

  @override
  List<Widget> buildActions(BuildContext context) => [
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            query = '';
            Navigator.pop(context);
          },
        )
      ];

  @override
  Widget buildLeading(BuildContext context) => const SizedBox();

  @override
  Widget buildResults(BuildContext context) {
    List<Book> listToShow;
    if (query.isNotEmpty) {
      listToShow = books
          .where((e) =>
              e.title.toLowerCase().contains(query.toLowerCase()) ||
              e.title.toLowerCase().startsWith(query.toLowerCase()))
          .toList();
    } else {
      listToShow = books;
    }

    return Container(
      color: Colors.blue,
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: listToShow.length,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          return BookEntrySearchResult(book: listToShow[index]);
        },
      ),
    );
  }

  @override
  void showSuggestions(BuildContext context) {
    // TODO: implement showSuggestions
    super.showSuggestions(context);
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context);
  }

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    return ResultPage(result: buildResults(context));
  }

  @override
  String get searchFieldLabel => 'Search for something';
}

class ResultPage extends StatelessWidget {
  const ResultPage({required this.result, super.key});

  final Widget result;

  @override
  Widget build(BuildContext context) {
    return result;
  }
}
*/