class NewsModel {
  String source;
  String publishedAt;
  String author;
  String title;
  String description;
  String? imageUrl;

  NewsModel({
    required this.source,
    required this.author,
    required this.publishedAt,
    required this.description,
    required this.title,
    this.imageUrl,
  });
}
