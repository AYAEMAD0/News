import 'package:flutter/material.dart';
import 'package:news/core/constants/app_strings.dart';
import 'package:news/core/widgets/custom_text_field.dart';
import 'package:news/model/news_response.dart';
import '../../../../api/api_manger.dart';
import '../../../../core/widgets/error_api_widget.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../category_details/news/widget/news_item.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final TextEditingController searchController = TextEditingController();
  List<News> searchResults = [];
  bool isLoading = false;
  String errorMessage = '';

  void searchNews(String searchValue) async {
    //todo search empty
    if (searchValue.isEmpty) {
      searchResults = [];
      errorMessage = '';
      setState(() {});
      return;
    }
    isLoading = true;
    errorMessage = '';
    setState(() {});
    try {
      //todo connection api
      final response = await ApiManger.searchNews(query: searchValue);
      //todo done successfully
      if (response.status == 'ok') {
        searchResults = response.articles ?? [];
        setState(() {});
      } else {
        setState(() {
          errorMessage = response.message ?? AppStrings.searchError;
        });
      }
    } catch (e) {
      errorMessage = e.toString();
      setState(() {});
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 0.04 * width,
            vertical: 0.02 * height,
          ),
          child: Column(
            children: [
              CustomTextField(
                textStyle: Theme.of(context).textTheme.labelMedium!,
                hint: AppStrings.search,
                hintStyle: Theme.of(context).textTheme.labelMedium!,
                controller: searchController,
                borderColor: Theme.of(context).canvasColor,
                fillColor: Theme.of(context).dividerColor,
                prefixIconColor: Theme.of(context).canvasColor,
                prefixIcon: Icon(Icons.search),
                suffixIconColor: Theme.of(context).canvasColor,
                suffixIcon: IconButton(
                  onPressed: () {
                    searchController.clear();
                    setState(() {
                      searchResults = [];
                      errorMessage = '';
                    });
                  },
                  icon: Icon(Icons.close),
                ),
                onChanged: searchNews,
              ),
              SizedBox(height: height * 0.04),
              Expanded(
                child: isLoading
                    ? const LoadingWidget()
                    : errorMessage.isNotEmpty
                    ? ErrorApiWidget(
                        message: errorMessage,
                        onPressed: () => searchNews(searchController.text),
                      )
                    : searchResults.isEmpty
                    ? Center(
                        child: Text(
                          AppStrings.noResult,
                          style: Theme.of(context).textTheme.labelMedium!,
                        ),
                      )
                    : ListView.separated(
                        padding: EdgeInsets.only(top: height * 0.025),
                        itemCount: searchResults.length,
                        itemBuilder: (context, index) =>
                            NewsItem(news: searchResults[index]),
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 0.025 * height),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
