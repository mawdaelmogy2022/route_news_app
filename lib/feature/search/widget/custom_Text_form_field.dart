import 'package:flutter/material.dart';
import 'package:news_app/utils/app_color.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField(
      {super.key, required this.searchcontroller, required this.onsubmit});
  TextEditingController searchcontroller;
  void Function(String?)? onsubmit;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: onsubmit,
      controller: searchcontroller,
      decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            size: 24,
            color: Theme.of(context).focusColor,
          ),
          suffixIcon: Icon(
            Icons.close,
            color: Theme.of(context).focusColor,
          ),
          hintText: 'Search',
          hintStyle: Theme.of(context).textTheme.labelLarge,
          enabledBorder: buildborder(AppColor.grayColor),
          focusedBorder: buildborder(AppColor.grayColor),
          errorBorder: buildborder(AppColor.redColor)),
    );
  }

  InputBorder buildborder(Color borderColor) {
    return OutlineInputBorder(
        borderSide: BorderSide(color: borderColor, width: 1),
        borderRadius: BorderRadius.circular(16));
  }
}
