import 'package:flutter/material.dart';
import 'package:news_app/model/source_response.dart';

class SourceName extends StatelessWidget {
  SourceName({super.key, required this.source, required this.isselected});
  Source source;
  bool isselected;
  @override
  Widget build(BuildContext context) {
    return Text(
      source.name ?? '',
      style: isselected == true
          ? Theme.of(context).textTheme.labelMedium
          : Theme.of(context).textTheme.labelSmall,
    );
  }
}
