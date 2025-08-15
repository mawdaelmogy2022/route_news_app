import 'package:flutter/material.dart';
import 'package:news_app/feature/home/category_details/news/news_widget.dart';
import 'package:news_app/feature/home/category_details/source/source_name.dart';
import 'package:news_app/model/source_response.dart';
import 'package:news_app/utils/app_color.dart';

class SourceTabWidget extends StatefulWidget {
  SourceTabWidget({super.key, required this.sources});
  List<Source> sources;

  @override
  State<SourceTabWidget> createState() => _SourceTabWidgetState();
}

class _SourceTabWidgetState extends State<SourceTabWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: widget.sources.length,
        child: Column(
          children: [
            TabBar(
                dividerColor: AppColor.transparentColor,
                tabAlignment: TabAlignment.start,
                isScrollable: true,
                indicatorColor: Theme.of(context).focusColor,
                onTap: (index) {
                  selectedIndex = index;
                  setState(() {});
                },
                tabs: widget.sources.map(
                  (source) {
                    return SourceName(
                      source: source,
                      isselected:
                          selectedIndex == widget.sources.indexOf(source),
                    );
                  },
                ).toList()),
            Expanded(child: NewsWidget(source: widget.sources[selectedIndex]))
          ],
        ));
  }
}
