import 'package:flutter/material.dart';
import 'package:tappedinterview/models/book_model.dart';
import 'package:tappedinterview/ui/widgets/book_entry/components/book_cover/book_cover.dart';

class BookEntrySearchResult extends StatelessWidget {
  const BookEntrySearchResult({required this.book, super.key});

  final Book book;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        print("Klicked");
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child:
                  BookCover(bookCoverUrl: book.image, width: size.width * 0.15),
            ),
            // 12
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  book.title,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(book.author, style: Theme.of(context).textTheme.bodySmall),
                const SizedBox(
                  height: 14,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
