import 'package:flutter/material.dart';
import 'package:news/features/views/home/category/general/widget/source_name.dart';
import '../../../../../../model/source_response.dart';

class SourceTab extends StatefulWidget {
  final List<Sources> sourceList;
  const SourceTab({super.key, required this.sourceList});

  @override
  State<SourceTab> createState() => _SourceTabState();
}

class _SourceTabState extends State<SourceTab> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.sourceList.length,
      child: Column(
        children: [
          TabBar(
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            dividerColor: Theme.of(context).scaffoldBackgroundColor,
            indicatorColor: Theme.of(context).canvasColor,
            onTap: (value) {
              selectedIndex = value;
              setState(() {});
            },
            tabs: widget.sourceList.map((source) {
              return SourceName(
                sources: source,
                isSelected: selectedIndex == widget.sourceList.indexOf(source),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
