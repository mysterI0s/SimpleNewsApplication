class NewsModel {
  String source;
  String publishedAt;
  String author;
  String title;
  String? description;
  String? imageUrl;
  String? content;

  NewsModel({
    required this.source,
    required this.author,
    required this.publishedAt,
    this.description,
    required this.title,
    this.imageUrl,
    this.content,
  });

  factory NewsModel.fromJson(Map<String, dynamic> data, int index) {
    var base = data['articles'][index];
    return NewsModel(
      content: base['content'] ?? 'This was today\'s news, hope you enjoyed',
      source: base['source']['name'],
      author: base['author'],
      publishedAt: base['publishedAt'],
      description: base['description'] ?? 'This is really EXCITING NEWS',
      title: base['title'],
      imageUrl: base['urlToImage'] ??
          'https://media.gettyimages.com/id/1339466666/nl/vector/breaking-news.jpg?s=612x612&w=gi&k=20&c=zFdbjWQZxPDOk0PUKDUDV8roLM31yF0TwUh0R6x_svA=',
    );
  }
}
