import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpdateBook extends StatelessWidget {
  const UpdateBook({
    super.key,
    required this.title,
    required this.controller,
    required this.type,
    required this.lines,
  });

  final String title;
  final TextEditingController controller;
  final TextInputType type;
  final int lines;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16.w,
            color: Colors.black,
          ),
        ),
        SizedBox(
          height: 50.h,
          child: TextField(
            keyboardType: type,
            textAlign: TextAlign.left,
            maxLines: lines,
            decoration:  InputDecoration(
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: Colors.red,
                ),
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 5.h),
            ),
            controller: controller,
          ),
        ),
      ],
    );
  }
}
