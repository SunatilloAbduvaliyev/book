import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/models/book_model/book_model.dart';

class SearchBook extends SearchDelegate{
  SearchBook({required this.books});
  List<BookModel> books;
  @override
  List<Widget>? buildActions(BuildContext context) => [
    IconButton(
      onPressed: () {
        query = '';
      },
      icon: const Icon(Icons.close),
    )
  ];

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, query);
      },
      icon: const Icon(Icons.arrow_back),
    );

  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text(
        query,
        style: const TextStyle(
          fontSize: 64,
        ),
      ),
    );

  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<BookModel> searchBook = books.where((searchResult) {
      final result = searchResult.productName.toLowerCase();
      final input = query.toLowerCase();
      return result.contains(input);
    }).toList();

    return ListView.builder(
      itemCount: searchBook.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 1.0,
              ),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(12.r),
                bottomRight: Radius.circular(12.r),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  // spreadRadius: 1.0,
                  blurRadius: 1.0,
                ),
              ],
              color: Colors.white,
            ),
            margin: EdgeInsets.symmetric(vertical: 2.5.h),
            child: Row(
              children: [
                Image.network(
                  searchBook[index].imageUrl,
                  fit: BoxFit.cover,
                  height: 50.h,
                  width: 40.w,
                ),
                SizedBox(width: 10.w),
                Text(
                  searchBook[index].productName,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                    fontSize: 14.0,
                  ),
                ),
                const Spacer(),
                Text(
                  searchBook[index].rate.toString(),
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.0,
                  ),
                ),
                SizedBox(width: 3.w),
                const Icon(Icons.star, color: Colors.amberAccent),
                SizedBox(width: 10.r)
              ],
            ),
          ),
        );
      },);
  }
}