import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/bloc/source/source_cubit.dart';
import 'package:news/features/views/home/category_details/news/news_widget.dart';
import '../../../../../model/source_response.dart';
import 'source_name.dart';

class SourceTab extends StatefulWidget {
  final List<Sources> sourceList;
  const SourceTab({super.key, required this.sourceList});

  @override
  State<SourceTab> createState() => _SourceTabState();
}

class _SourceTabState extends State<SourceTab> {
  SourceCubit viewModel = SourceCubit();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: viewModel,
      builder: (context, state) {
        int index = viewModel.selectedIndex;
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
                  //todo change index
                  viewModel.changeIndex(value);
                },
                tabs: widget.sourceList.map((source) {
                  return SourceName(
                    sources: source,
                    isSelected: index == widget.sourceList.indexOf(source),
                  );
                }).toList(),
              ),
              Expanded(
                child: NewsWidget(
                  key: ValueKey(widget.sourceList[index].id),
                  source: widget.sourceList[index],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
