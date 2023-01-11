import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BookCoverRounded extends StatelessWidget {
  const BookCoverRounded({required this.bookCoverUrl, super.key});

  final String bookCoverUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(80),
      child: SizedBox(
        child: AspectRatio(
          aspectRatio: 1 / 1,
          child: CachedNetworkImage(
            imageUrl: bookCoverUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
