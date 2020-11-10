class ArticleModel {
  // Match them with the news api, on https://newsapi.org/
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String context;
 // add
  ArticleModel({
    this.author,
    this.context,
    this.description,
    this.title,
    this.url,
    this.urlToImage,
  });
}
