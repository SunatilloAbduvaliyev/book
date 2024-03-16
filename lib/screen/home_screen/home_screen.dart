import 'package:flutter/material.dart';
import 'package:library_proect/view_models/view_models.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'HomeScreen',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: context.watch<BookViewModel>().isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : RefreshIndicator(
              child: ListView(
                children: [
                  ...List.generate(
                    context.watch<BookViewModel>().allBooks.length,
                    (index) => ListTile(
                      title: Text(
                        context
                            .watch<BookViewModel>()
                            .allBooks[index]
                            .productName,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              onRefresh: () {
                return Future<void>.delayed(
                  const Duration(seconds: 2),
                  () {
                    context.read<BookViewModel>().getAllBooks();
                  },
                );
              },
            ),
    );
  }
}