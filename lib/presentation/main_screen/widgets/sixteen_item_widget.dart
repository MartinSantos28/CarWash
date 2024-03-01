import 'package:flutter/material.dart';
import 'package:carwash/core/app_export.dart';

// ignore: must_be_immutable
class SixteenItemWidget extends StatelessWidget {
  const SixteenItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Opacity(
        opacity: 0.9,
        child: CustomImageView(
          imagePath: ImageConstant.imgRectangle11,
          height: 215.v,
          width: 297.h,
          radius: BorderRadius.circular(
            8.h,
          ),
        ),
      ),
    );
  }
}
