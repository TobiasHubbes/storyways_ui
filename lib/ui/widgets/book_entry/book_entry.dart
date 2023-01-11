import 'package:flutter/material.dart';
import 'package:tappedinterview/models/book_model.dart';
import 'package:tappedinterview/ui/widgets/book_entry/components/book_cover/book_cover.dart';
import 'package:tappedinterview/ui/widgets/book_entry/components/book_entry_notification_bell.dart';
import 'package:tappedinterview/ui/widgets/book_entry/components/published_date_widget.dart';

class BookEntry extends StatelessWidget {
  const BookEntry({required this.book, super.key});

  final Book book;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child:
                  BookCover(bookCoverUrl: book.image, width: size.width * 0.2),
            ),
            // 12
            Expanded(
              flex: 15,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    book.title,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text(book.author,
                      style: Theme.of(context).textTheme.bodySmall),
                  const SizedBox(
                    height: 14,
                  ),
                  PublishedDateWidget(publishedDate: book.publishedDate),
                ],
              ),
            ),
            const NotificationBell(),
          ],
        ),
      ),
    );
  }
}
