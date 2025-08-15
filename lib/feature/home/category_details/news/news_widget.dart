import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/feature/home/category_details/news/buttom_sheet_details_widget.dart';
import 'package:news_app/feature/home/category_details/news/news_item.dart';
import 'package:news_app/model/news_response.dart';
import 'package:news_app/model/source_response.dart';
import 'package:news_app/utils/app_color.dart';

class NewsWidget extends StatefulWidget {
  NewsWidget({super.key, required this.source});
  Source source;

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse?>(
      future: ApiManager.getNewsbydourceId(widget.source.id ?? ''),
      builder: (context, snapshot) {
        // to do : loading
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
              child: CircularProgressIndicator(
            color: AppColor.grayColor,
          ));
          // to do : error => client
        } else if (snapshot.hasError) {
          return Column(
            children: [
              const Text('something went wrong '),
              ElevatedButton(
                  onPressed: () {
                    ApiManager.getNewsbydourceId(widget.source.id ?? '');
                  },
                  child: const Text('try again'))
            ],
          );
        }
        // to do : error => server
        else if (snapshot.data?.status != 'ok') {
          return Column(
            children: [
              Text(snapshot.data!.message!),
              ElevatedButton(
                  onPressed: () {
                    ApiManager.getNewsbydourceId(widget.source.id ?? '');
                  },
                  child: const Text('try again'))
            ],
          );
        }
        List<News> news = snapshot.data!.articles!;
        return ListView.builder(
          itemBuilder: (context, index) {
            return GestureDetector(
                onTap: () {
                  showNewDestailsButtomSheet(news: news[index]);
                },
                child: NewsItem(news: news[index]));
          },
          itemCount: news.length,
        );
      },
    );
  }

  void showNewDestailsButtomSheet({required News news}) {
    showModalBottomSheet(
      backgroundColor: Theme.of(context).focusColor,
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(16), // يخليها مربعة بدون زوايا بيضاء
      ),
      context: context,
      builder: (context) {
        return ButtomSheetDetailsWidget(news: news);
      },
    );
  }
}
