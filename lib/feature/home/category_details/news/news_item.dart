import 'package:flutter/material.dart';
import 'package:news_app/model/news_response.dart';
import 'package:news_app/utils/app_style.dart';

class NewsItem extends StatelessWidget {
  NewsItem({super.key, required this.news});
  News news;

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.parse(news.publishedAt!);
    DateTime now = DateTime.now().toUtc();
    int minutes = now.difference(dateTime).inMinutes;
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: size.width * .04, vertical: size.height * .01),
      padding: EdgeInsets.symmetric(
          horizontal: size.width * .02, vertical: size.height * .01),
      width: double.infinity,
      height: size.height * .45,
      decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).focusColor),
          borderRadius: BorderRadius.circular(16)),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: size.height * .3,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                    image: NetworkImage(
                      news.urlToImage ?? '',
                    ),
                    fit: BoxFit.fill)),
          ),
          SizedBox(
            height: size.height * .01,
          ),
          Text(
            news.title ?? '',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.labelMedium,
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'By: ${news.author != null ? news.author!.substring(0, news.author!.length < 7 ? news.author!.length : 5) : ''}',
                style: AppStyle.gray12meduim,
              ),
              Text(
                '${minutes} minutes ago',
                style: AppStyle.gray12meduim,
              ),
            ],
          )
        ],
      ),
    );
  }
}

/*
void main() {
  String timestamp = "2025-08-03T08:28:03Z";
  DateTime dateTime = DateTime.parse(timestamp);
  DateTime now = DateTime.now().toUtc();

  int minutes = now.difference(dateTime).inMinutes;

  print('$minutes minutes ago');
} */