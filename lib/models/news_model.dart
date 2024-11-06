class NewsModel {
  String source;
  String publishedAt;
  String? author;
  String title;
  String? description;
  String? imageUrl;
  String? content;

  NewsModel({
    required this.source,
    this.author,
    required this.publishedAt,
    this.description,
    required this.title,
    this.imageUrl,
    this.content,
  });

  factory NewsModel.fromJson(Map<String, dynamic> data) {
    return NewsModel(
      content: data['content'] ?? 'This was today\'s news, hope you enjoyed',
      source: data['source']['name'],
      author: data['author'] ?? 'World',
      publishedAt: data['publishedAt'],
      description: data['description'] ?? 'This is really EXCITING NEWS',
      title: data['title'],
      imageUrl: data['urlToImage'] ??
          'https://media.gettyimages.com/id/1339466666/nl/vector/breaking-news.jpg?s=612x612&w=gi&k=20&c=zFdbjWQZxPDOk0PUKDUDV8roLM31yF0TwUh0R6x_svA=',
    );
  }

  static List<NewsModel> fromJsonList(Map<String, dynamic> data) {
    List<dynamic> articles = data['articles'];
    return articles.map((article) => NewsModel.fromJson(article)).toList();
  }
}
