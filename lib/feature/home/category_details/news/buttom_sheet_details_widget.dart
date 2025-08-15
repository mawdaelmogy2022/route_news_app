import 'package:flutter/material.dart';
import 'package:news_app/feature/home/category_details/news/news_web_view.dart';
import 'package:news_app/model/news_response.dart';

class ButtomSheetDetailsWidget extends StatelessWidget {
  ButtomSheetDetailsWidget({super.key, required this.news});
  News news;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: size.width * .02, vertical: size.height * .01),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: size.height * .3,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                    image: NetworkImage(news.urlToImage ?? ''),
                    fit: BoxFit.fill)),
          ),
          SizedBox(
            height: size.height * .01,
          ),
          Text(
            //  "${news.content ?? ""}..... [${news.content!.length - 10 * 4}] chars",
            news.content ?? '',
            style: Theme.of(context).textTheme.titleSmall,
            maxLines: 4,
          ),
          const Spacer(),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  minimumSize: Size(double.infinity, size.height * .07),
                  backgroundColor: Theme.of(context).canvasColor),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return NewsWebView(
                      newUrl: news.url!,
                    );
                  },
                ));
              },
              child: Text(
                'View Full Articel',
                style: Theme.of(context).textTheme.labelMedium,
              ))
        ],
      ),
    );
  }
}
