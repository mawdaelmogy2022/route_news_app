import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/feature/home/category_details/news/news_item.dart';
import 'package:news_app/feature/search/widget/custom_Text_form_field.dart';
import 'package:news_app/model/news_response.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchcontroller = TextEditingController();
  Future<NewsResponse?>? searchfuture;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * .03, vertical: size.height * .02),
              child: CustomTextFormField(
                onsubmit: (value) {
                  if (value != null && value.isNotEmpty) {
                    startSearch(value);
                  }
                },
                searchcontroller: searchcontroller,
              ),
            ),
            searchfuture == null
                ? Center(
                    child: Text(
                      AppLocalizations.of(context)!.search_for_news,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  )
                : Expanded(
                    child: FutureBuilder<NewsResponse?>(
                      future: searchfuture,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return const Column(
                            children: [Text('Error ')],
                          );
                        } else if (snapshot.data?.status != 'ok') {
                          return const Column(
                            children: [Text('Errorrrr ')],
                          );
                        }
                        List<News> news = snapshot.data!.articles!;
                        return ListView.separated(
                            itemBuilder: (context, index) {
                              return NewsItem(news: news[index]);
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                height: size.height * .01,
                              );
                            },
                            itemCount: news.length);
                      },
                    ),
                  )
          ],
        ),
      ),
    );
  }

  void startSearch(String qSearch) {
    setState(() {
      searchfuture = ApiManager.getNewsbysearch(qSearch: qSearch);
    });
  }
}
