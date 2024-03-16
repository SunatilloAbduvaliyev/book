import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:library_proect/view_models/view_models.dart';
import 'package:provider/provider.dart';

import '../../data/repository/category_repository.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'BookMark',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: context.watch<BookViewModel>().isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : RefreshIndicator(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: ListView(
                  children: [
                    SizedBox(height: 10.h),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ...List.generate(
                            bookCategories.length,
                            (index) => Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                border: Border.all(
                                  color: Colors.black,
                                  width: 1.0,
                                ),
                              ),
                              margin: EdgeInsets.only(right: 5.w),
                              padding: EdgeInsets.symmetric(
                                horizontal: 10.w,
                                vertical: 5.h,
                              ),
                              child: Text(
                                bookCategories[index],
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.h),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ...List.generate(
                            context.watch<BookViewModel>().allBooks.length,
                            (index) => Container(
                              width: 120.w,
                              height: 150.h,
                              margin: EdgeInsets.only(right: 10.w),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12.r),
                                child: Image.network(
                                  context
                                      .watch<BookViewModel>()
                                      .allBooks[index]
                                      .imageUrl,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ...List.generate(
                      context.watch<BookViewModel>().allBooks.length,
                      (index) => Container(
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
                        margin: EdgeInsets.symmetric(vertical: 5.h),
                        child: Row(
                          children: [
                            Image.network(
                              context
                               .watch<BookViewModel>()
                               .allBooks[index]
                               .imageUrl,
                              fit: BoxFit.cover,
                              height: 50.h,
                            ),
                            SizedBox(width: 10.w),
                            Text(
                              context
                                  .watch<BookViewModel>()
                                  .allBooks[index]
                                  .productName,
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                fontSize: 18.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
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
