import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonCard extends StatelessWidget {
  const CommonCard({Key? key, required this.widget, required this.onTap})
      : super(key: key);
  final Widget widget;
  final GestureTapCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          padding: EdgeInsets.all(16.sp),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8.r)),
          child: widget,
        ));
  }
}

class CommonCardData extends StatelessWidget {
  const CommonCardData({Key? key, required this.title, required this.value})
      : super(key: key);
 final String title, value;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 4.h),
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child: Text(
                title,
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
              )),
          Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(value,
                    style: TextStyle(
                        fontSize: 14.sp, fontWeight: FontWeight.w500)),
              )),
        ],
      ),
    );
  }
}
