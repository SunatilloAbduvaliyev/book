import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:library_proect/screen/book_update_screen/book_update_screen.dart';
import 'package:library_proect/screen/home_screen/widget/category_button.dart';
import 'package:library_proect/view_models/view_models.dart';
import 'package:provider/provider.dart';
import '../search/search_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('build');
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
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: SearchBook(
                  books: Provider.of<BookViewModel>(context, listen: false).allBooks,
                ),
              );
            },
            icon: const Icon(Icons.search),
          ),
        ],
        backgroundColor: Colors.white,
      ),
      body: Consumer<BookViewModel>(
        builder: (context, model, child) {
          return model.isLoading
              ? const Center(
            child: CircularProgressIndicator(),
          )
              : Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: ListView(
              children: [
                SizedBox(height: 10.h),
                CategoryButton(
                  categoryId: (id) {
                    Provider.of<BookViewModel>(context, listen: false).getCategoryBook(id: id);
                  },
                ),
                SizedBox(height: 10.h),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...List.generate(
                        model.allBooks.length,
                            (index) => Padding(
                          padding: EdgeInsets.only(right: 15.w),
                          child: Stack(
                            children: [
                              SizedBox(
                                width: 120.w,
                                height: 220.h,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 120.w,
                                      height: 150.h,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12.r),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(12.r),
                                        child: Image.network(
                                          model.allBooks[index].imageUrl,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10.h),
                                    SizedBox(
                                      child: Text(
                                        model.allBooks[index].productName,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12.w,
                                        ),
                                      ),
                                    ),
                                    const Spacer(),
                                    Row(
                                      children: [
                                        Text(
                                          "\$ ${model.allBooks[index].price}",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12.w,
                                          ),
                                        ),
                                        const Spacer(),
                                        GestureDetector(
                                          child: const Icon(Icons.save_alt_rounded),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                top: 0,
                                left: 0,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 5.w,
                                    vertical: 2.h,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(12.r),
                                    ),
                                    color: Colors.black,
                                  ),
                                  child: Row(
                                    children: [
                                      const Icon(Icons.star, color: Colors.amber),
                                      SizedBox(width: 2.w),
                                      Text(
                                        model.allBooks[index].rate.toString(),
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.h),
                ...List.generate(
                  model.categoryBook.length,
                      (index) => GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BookUpdateScreen(
                            bookModel: model.categoryBook[index],
                          ),
                        ),
                      );
                    },
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
                            model.categoryBook[index].imageUrl,
                            fit: BoxFit.cover,
                            height: 50.h,
                            width: 40.w,
                          ),
                          SizedBox(width: 10.w),
                          Text(
                            model.categoryBook[index].productName,
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 14.0,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            model.categoryBook[index].rate.toString(),
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
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
