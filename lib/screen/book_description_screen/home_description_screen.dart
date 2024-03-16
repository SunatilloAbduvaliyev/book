import 'package:flutter/material.dart';
import 'package:library_proect/data/models/book_model/book_model.dart';

class BookDescriptionScreen extends StatelessWidget {
  const BookDescriptionScreen({super.key, required this.bookModel});

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(bookModel.productName),
        backgroundColor: Colors.indigo,
      ),
    );
  }
}
