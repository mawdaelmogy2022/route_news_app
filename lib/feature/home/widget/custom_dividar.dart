import 'package:flutter/material.dart';
import 'package:news_app/utils/app_color.dart';

class CustomDividar extends StatelessWidget {
  const CustomDividar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: AppColor.whiteColor,
      endIndent: 10,
      indent: 10,
      thickness: 1,
    );
  }
}
