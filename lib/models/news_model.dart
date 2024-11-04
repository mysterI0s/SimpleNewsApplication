class NewsModel {
  String source;
  String publishedAt;
  String author;
  String title;
  String? description;
  String? imageUrl;

  NewsModel({
    required this.source,
    required this.author,
    required this.publishedAt,
    this.description,
    required this.title,
    this.imageUrl,
  });

  factory NewsModel.fromJson(Map<String, dynamic> data, int i) {
    return NewsModel(
      source: data['articles'][i]['source']['name'],
      author: data['articles'][i]['author'],
      publishedAt: data['articles'][i]['publishedAt'],
      description:
          data['articles'][i]['description'] ?? 'This is really EXCITING NEWS',
      title: data['articles'][i]['title'],
      imageUrl: data['articles'][i]['urlToImage'] ??
          'https://media.gettyimages.com/id/1339466666/nl/vector/breaking-news.jpg?s=612x612&w=gi&k=20&c=zFdbjWQZxPDOk0PUKDUDV8roLM31yF0TwUh0R6x_svA=',
    );
  }
}
