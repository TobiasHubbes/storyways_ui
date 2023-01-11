import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tappedinterview/models/book_model.dart';
import 'package:tappedinterview/ui/widgets/book_entry/components/book_cover/book_cover_rounded.dart';

class BookEntryToContinue extends StatelessWidget {
  const BookEntryToContinue({required this.book, super.key});

  final Book book;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                BookCoverRounded(bookCoverUrl: book.image),
                Positioned(bottom: 0, right: 0, child: _playButton())
              ],
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                book.title,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(
                height: 3,
              ),
              Text(book.author, style: Theme.of(context).textTheme.bodySmall),
            ],
          )
        ],
      ),
    );
  }

  Widget _playButton() {
    const String assetName = 'assets/images/playbutton.svg';
    return SvgPicture.asset(
      assetName,
      width: 40,
      height: 40,
    );
  }
}
