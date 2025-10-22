import 'package:flutter/material.dart';
import 'package:news/api/api_manger.dart';
import 'package:news/core/constants/app_strings.dart';
import 'package:news/core/theme/app_colors.dart';
import 'package:news/features/views/home/category/general/widget/source_tab.dart';
import 'package:news/model/source_response.dart';

class GeneralView extends StatefulWidget {
  const GeneralView({super.key});

  @override
  State<GeneralView> createState() => _GeneralViewState();
}

class _GeneralViewState extends State<GeneralView> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.general,
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
          horizontal: 0.05 * width,
          vertical: 0.02 * height,
        ),
        child: FutureBuilder(
          future: ApiManger.getSource(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).canvasColor,
                ),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Column(
                  spacing: 0.03*height,
                  children: [
                    Text(
                      AppStrings.somethingWentWrong,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        //todo reload
                        ApiManger.getSource();
                        setState(() {});
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.gray,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)
                          ),
                          padding: EdgeInsets.symmetric(vertical: 0.015*height,horizontal: 0.03*width)
                      ),
                      child: Text(
                        AppStrings.tryAgain,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ),
                  ],
                ),
              );
            } else if (snapshot.data?.status != 'ok') {
              return Center(
                child: Column(
                  spacing: 0.03*height,
                  children: [
                    Text(
                      snapshot.data?.message ?? "",
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        //todo reload
                        ApiManger.getSource();
                        setState(() {});
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.gray,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)
                          ),
                        padding: EdgeInsets.symmetric(vertical: 0.015*height,horizontal: 0.03*width)
                      ),
                      child: Text(
                        AppStrings.tryAgain,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ),
                  ],
                ),
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
