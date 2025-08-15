import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/feature/home/category_details/source/source_tab_widget.dart';
import 'package:news_app/model/category_model.dart';
import 'package:news_app/model/source_response.dart';
import 'package:news_app/utils/app_color.dart';

class CategoryDetails extends StatelessWidget {
  CategoryDetails({super.key, required this.categoryModel});
  CategoryModel categoryModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<SourceResponse?>(
        future: ApiManager.getSources(categoryId: categoryModel.categoryname),
        builder: (context, snapshot) {
          // to do : loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                backgroundColor: AppColor.grayColor,
              ),
            );
            // to do : error => client
          } else if (snapshot.hasError) {
            return Column(
              children: [
                const Text('something went wrong '),
                ElevatedButton(
                    onPressed: () {
                      ApiManager.getSources(
                          categoryId: categoryModel.categoryname);
                    },
                    child: const Text('try again'))
              ],
            );
            // to do => error => server
          } else if (snapshot.data?.status != 'ok') {
            return Column(
              children: [
                Text(snapshot.data!.message!),
                ElevatedButton(
                    onPressed: () {
                      ApiManager.getSources(
                          categoryId: categoryModel.categoryname);
                    },
                    child: const Text('try again'))
              ],
            );
          }
          var soucesList = snapshot.data?.sources;
          return SourceTabWidget(sources: soucesList!);
        },
      ),
    );
  }
}
