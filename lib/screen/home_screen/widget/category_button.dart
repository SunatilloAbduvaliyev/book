import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/repository/category_repository.dart';

class CategoryButton extends StatefulWidget {
  final ValueChanged<int> categoryId;
  const CategoryButton({super.key,required this.categoryId,});

  @override
  State<CategoryButton> createState() => _CategoryButtonState();
}

class _CategoryButtonState extends State<CategoryButton> {
  int isActive = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ...List.generate(
            bookCategories.length,
            (index) => Container(
              margin: EdgeInsets.only(right: 5.w),
              child: Ink(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: isActive == index? Colors.blue:Colors.white,
                  border: Border.all(
                    color: isActive == index? Colors.blue:Colors.black,
                    width: 1.0,
                  ),
                ),
                child: InkWell(
                  onTap: (){
                    setState(() {
                      isActive = index;
                      widget.categoryId.call(index);
                    });
                  },
                  borderRadius: BorderRadius.circular(10.r),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                    child: Center(
                      child: Text(
                        bookCategories[index],
                        style:  TextStyle(
                          color: isActive == index? Colors.white:Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
