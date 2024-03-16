import 'package:flutter/material.dart';

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
        return ListTile(
          title: Text(searchBook[index].productName),
          subtitle: Text(searchBook[index].author),
          leading: Icon(Icons.book),
        );
      },);
  }
}