import 'package:news_app/model/source_response.dart';

class NewsResponse {
  String? status;
  int? totalResults;
  List<News>? articles;
  String? code;
  String? message;

  NewsResponse(
      {this.status, this.totalResults, this.articles, this.code, this.message});

  NewsResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    totalResults = json['totalResults'];
    code = json['code'];
    message = json['message'];
    if (json['articles'] != null) {
      articles = <News>[];
      json['articles'].forEach((v) {
        articles!.add(new News.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['totalResults'] = this.totalResults;
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.articles != null) {
      data['articles'] = this.articles!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class News {
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  News(
      {this.source,
      this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt,
      this.content});

  News.fromJson(Map<String, dynamic> json) {
    source =
        json['source'] != null ? new Source.fromJson(json['source']) : null;
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.source != null) {
      data['source'] = this.source!.toJson();
    }
    data['author'] = this.author;
    data['title'] = this.title;
    data['description'] = this.description;
    data['url'] = this.url;
    data['urlToImage'] = this.urlToImage;
    data['publishedAt'] = this.publishedAt;
    data['content'] = this.content;
    return data;
  }
}
