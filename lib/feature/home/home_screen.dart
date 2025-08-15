import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/feature/home/category_details/category_details.dart';
import 'package:news_app/feature/home/category_fragment/category_fragment.dart';
import 'package:news_app/feature/home/widget/home_drawer.dart';
import 'package:news_app/model/category_model.dart';
import 'package:news_app/utils/app_route.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            selectedCategory == null
                ? AppLocalizations.of(context)!.home
                : selectedCategory!.categoryname,
            style: Theme.of(context).textTheme.labelLarge,
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoute.searchRoute);
                },
                icon: const Icon(
                  Icons.search,
                  size: 24,
                ))
          ],
        ),
        drawer: HomeDrawer(ongotohomeclick: onGoToHomeClick),
        body: selectedCategory == null
            ? CategoryFragment(
                oncategoryactionclick: onCategoryActionClick,
              )
            : CategoryDetails(
                categoryModel: selectedCategory!,
              ));
  }

  CategoryModel? selectedCategory;

  onCategoryActionClick(CategoryModel newcategory) {
    selectedCategory = newcategory;
    setState(() {});
  }

  onGoToHomeClick() {
    selectedCategory = null;
    Navigator.pop(context);
    setState(() {});
  }
}
