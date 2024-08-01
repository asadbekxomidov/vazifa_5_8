class Book {
  final String id;
  final String title;
  final String author;
  final String coverUrl;
  final String downloadUrl;
  final String price;
  final List<String> categories;
  bool isDownloaded;

  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.coverUrl,
    required this.downloadUrl,
    required this.price,
    required this.categories,
    this.isDownloaded = false,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'],
      title: json['title'],
      author: json['author'],
      coverUrl: json['coverUrl'],
      price: json['price'],
      downloadUrl: json['downloadUrl'],
      categories: List<String>.from(json['categories']),
    );
  }
}
