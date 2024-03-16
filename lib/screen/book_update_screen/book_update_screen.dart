import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:library_proect/data/models/book_model/book_model.dart';
import 'package:library_proect/screen/book_update_screen/widgets/global_button.dart';
import 'package:library_proect/screen/book_update_screen/widgets/update_book.dart';
import 'package:library_proect/view_models/view_models.dart';
import 'package:provider/provider.dart';

class BookUpdateScreen extends StatefulWidget {
  const BookUpdateScreen({super.key, required this.bookModel});

  final BookModel bookModel;

  @override
  State<BookUpdateScreen> createState() => _BookUpdateScreenState();
}

class _BookUpdateScreenState extends State<BookUpdateScreen> {
  late TextEditingController controllerOne;
  late TextEditingController controllerTwo;
  late TextEditingController controllerThree;
  late TextEditingController controllerFour;

  @override
  void initState() {
    super.initState();
    controllerOne = TextEditingController(text: widget.bookModel.productName);
    controllerTwo = TextEditingController(text: widget.bookModel.description);
    controllerThree = TextEditingController(text: widget.bookModel.imageUrl);
    controllerFour =
        TextEditingController(text: widget.bookModel.price.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.bookModel.productName,
          style: TextStyle(
            fontSize: 16.w,
            color: Colors.white,
          ),
        ),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 5.h),
            UpdateBook(
              title: "Name update",
              controller: controllerOne,
              type: TextInputType.text,
              lines: 1,
            ),
            UpdateBook(
              title: "Description update",
              controller: controllerTwo,
              type: TextInputType.text,
              lines: 4,
            ),
            SizedBox(height: 10.h),
            UpdateBook(
              title: "ImageUrl update",
              controller: controllerThree,
              type: TextInputType.text,
              lines: 4,
            ),
            SizedBox(height: 10.h),
            UpdateBook(
              title: "Price update",
              controller: controllerFour,
              type: TextInputType.number,
              lines: 1,
            ),
            const Spacer(),
            GlobalButton(
              text: "Update",
              onTap: () async {
                BookModel updatedBook = BookModel(
                  categoryId: widget.bookModel.categoryId,
                  productName: controllerOne.text,
                  description: controllerTwo.text,
                  imageUrl: controllerThree.text,
                  price: double.parse(controllerFour.text),
                  uuid: widget.bookModel.uuid,
                  rate: 4.6,
                  author: 'Author Jhon',
                );
                await Provider.of<BookViewModel>(context, listen: false)
                    .updateBook(updatedBook);
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        "Book updated successfully",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.w,
                        ),
                      ),
                    ),
                  );
                }
                Navigator.pop(context);
              },
            ),
            SizedBox(height: 10.h),
            GlobalButton(
              text: "Delete",
              onTap: () {
                Provider.of<BookViewModel>(context, listen: false)
                    .deleteBook(widget.bookModel.uuid.toString());
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      "Delete Book",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.w,
                      ),
                    ),
                  ),
                );
                Navigator.pop(context);
              },
            ),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }
}
