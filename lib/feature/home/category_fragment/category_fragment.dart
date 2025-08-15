import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/feature/home/category_fragment/category_item_widget.dart';
import 'package:news_app/model/category_model.dart';
import 'package:news_app/provider/app_theme_provider.dart';
import 'package:news_app/utils/app_image.dart';
import 'package:provider/provider.dart';

typedef Oncategoryactionclick = void Function(CategoryModel);

class CategoryFragment extends StatelessWidget {
  CategoryFragment({super.key, required this.oncategoryactionclick});

  Oncategoryactionclick oncategoryactionclick;
  @override
  Widget build(BuildContext context) {
    List<CategoryModel> categories = [
      CategoryModel(
          id: 'general',
          categortimagewhite: Appimage.generalwhiteimage,
          categortimageblack: Appimage.generalblackimage,
          categoryname: AppLocalizations.of(context)!.general),
      CategoryModel(
          id: 'business',
          categortimageblack: Appimage.bussinessblackimage,
          categortimagewhite: Appimage.bussinesswhiteimage,
          categoryname: AppLocalizations.of(context)!.business),
      CategoryModel(
          id: 'sports',
          categortimageblack: Appimage.sportsblackimage,
          categortimagewhite: Appimage.sportswhiteimage,
          categoryname: AppLocalizations.of(context)!.sports),
      CategoryModel(
          id: 'technology',
          categortimageblack: Appimage.technolgyblackimage,
          categortimagewhite: Appimage.technolgywhiteimage,
          categoryname: AppLocalizations.of(context)!.technology),
      CategoryModel(
          id: 'entertainment',
          categortimageblack: Appimage.entartinmentsblackimage,
          categortimagewhite: Appimage.entartinmentwhiteimage,
          categoryname: AppLocalizations.of(context)!.entertainment),
      CategoryModel(
          id: 'health',
          categortimageblack: Appimage.healthblackimage,
          categortimagewhite: Appimage.healthwhiteimage,
          categoryname: AppLocalizations.of(context)!.health),
      CategoryModel(
          id: 'science',
          categortimageblack: Appimage.scienceblackimage,
          categortimagewhite: Appimage.sciencewhiteimage,
          categoryname: AppLocalizations.of(context)!.science),
    ];
    Size size = MediaQuery.of(context).size;
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * .03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)!
                  .good_morning_Here_is_some_news_for_you,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(
              height: size.height * .02,
            ),
            Expanded(
                child: ListView.separated(
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // Gategory details
                    oncategoryactionclick(categories[index]);
                  },
                  child: CategoryItemWidget(
                    isdark: themeProvider.appTheme == ThemeMode.dark,
                    categoryModel: categories[index],
                    index: index,
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: size.height * .02,
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}
