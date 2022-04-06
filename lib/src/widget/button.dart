import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const CustomButton({Key? key, required this.onTap, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 5.h,
        width: 29.w,
        decoration: BoxDecoration(
            color: Color(0xff05595B),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                  spreadRadius: 0.7,
                  blurRadius: 7,
                  color: Colors.black45,
                  offset: Offset(0.7, 0.7))
            ]),
        child: Text(
          title,
          style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
      ),
    );
  }
}
