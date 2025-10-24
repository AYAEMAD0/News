import 'package:flutter/material.dart';
import 'package:news/api/api_manger.dart';
import 'package:news/core/widgets/error_api_widget.dart';
import 'package:news/core/widgets/loading_widget.dart';
import 'package:news/model/source_response.dart';
import '../../../../core/widgets/error_base_widget.dart';
import 'widget/source_tab.dart';

class CategoryDetailsView extends StatefulWidget {
  const CategoryDetailsView({super.key});

  @override
  State<CategoryDetailsView> createState() => _CategoryDetailsViewState();
}

class _CategoryDetailsViewState extends State<CategoryDetailsView> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'general',
          style: Theme.of(context).textTheme.labelMedium,
        ),
        leading: Icon(Icons.list_rounded, size: 25),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 0.02 * width),
            child: Icon(Icons.search),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 0.02 * width,
          vertical: 0.02 * height,
        ),
        child: FutureBuilder(
          future: ApiManger.getSource(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return LoadingWidget();
            } else if (snapshot.hasError) {
              return ErrorBaseWidget(
                onPressed: () {
                  //todo reload
                  ApiManger.getSource();
                  setState(() {});
                },
              );
            } else if (snapshot.data?.status != 'ok') {
              return ErrorApiWidget(
                onPressed: () {
                  //todo reload
                  ApiManger.getSource();
                  setState(() {});
                },
                message: snapshot.data!.message!,
              );
            }
            List<Sources>? data = snapshot.data?.sources;
            return SourceTab(sourceList: data!);
          },
        ),
      ),
    );
  }
}
