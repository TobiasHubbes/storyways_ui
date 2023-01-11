class Book {
  final String title;
  final String author;
  final DateTime? publishedDate;
  final String image;

  Book({
    required this.title,
    required this.author,
    required this.publishedDate,
    required this.image,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      title: (json['title'] ?? "").toString(),
      author: (json['author'] ?? "").toString(),
      publishedDate: DateTime.tryParse((json['published'] ?? "").toString()),
      image: (json['image'] ?? "").toString(),
    );
  }
}
