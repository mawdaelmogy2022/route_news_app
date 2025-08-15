import 'package:flutter/material.dart';
import 'package:news_app/model/category_model.dart';
import 'package:news_app/utils/app_color.dart';

class CategoryItemWidget extends StatelessWidget {
  CategoryItemWidget(
      {super.key,
      required this.categoryModel,
      required this.index,
      required this.isdark});
  CategoryModel categoryModel;
  int index;
  bool isdark;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
        alignment:
            index % 2 == 0 ? Alignment.bottomRight : Alignment.bottomLeft,
        children: [
          Container(
            width: double.infinity,
            height: size.height * .26,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                  image: AssetImage(
                    isdark
                        ? categoryModel.categortimagewhite
                        : categoryModel.categortimageblack,
                  ),
                  fit: BoxFit.cover,
                )),
          ),
          Container(
            margin: EdgeInsets.symmetric(
                vertical: size.height * .02, horizontal: size.width * .03),
            padding: index % 2 == 0
                ? EdgeInsets.only(
                    left: size.width * .03,
                  )
                : EdgeInsets.only(right: size.width * .03),
            width: size.width * .45,
            decoration: BoxDecoration(
                color: AppColor.grayColor,
                borderRadius: BorderRadius.circular(40)),
            child: Row(
              textDirection:
                  index % 2 == 0 ? TextDirection.ltr : TextDirection.rtl,
              children: [
                Text(
                  'View All',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const Spacer(),
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Theme.of(context).canvasColor,
                  child: Icon(
                    index % 2 == 0
                        ? Icons.arrow_forward_ios
                        : Icons.arrow_back_ios,
                    color: Theme.of(context).focusColor,
                  ),
                ),
              ],
            ),
          ),
        ]);
  }
}
/*
 Container(
       // width: size.width * .01,
        // height: size.height,
        decoration: BoxDecoration(
            color: AppColor.grayColor, 
            borderRadius: BorderRadius.circular(40)),
            child: Row(children: [
              Text('View All',style: Theme.of(context).textTheme.titleLarge,)
            ],),
      ),
    ) */