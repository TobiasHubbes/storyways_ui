import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BookCover extends StatelessWidget {
  const BookCover({required this.bookCoverUrl, required this.width, super.key});

  final String bookCoverUrl;
  final double width;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: SizedBox(
        width: width,
        child: AspectRatio(
          aspectRatio: 1 / 1.45,
          child: CachedNetworkImage(
            imageUrl: bookCoverUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
