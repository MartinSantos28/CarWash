import 'package:carousel_slider/carousel_slider.dart';
import 'package:carwash/core/app_export.dart';
import 'package:carwash/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

import 'widgets/sixteen_item_widget.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key})
      : super(
          key: key,
        );

  int sliderIndex = 1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: SizeUtils.height,
          width: double.maxFinite,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 128.h,
                    vertical: 382.v,
                  ),
                  decoration: AppDecoration.fillBlueA,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 42.v),
                      CustomElevatedButton(
                        text: "Agendar cita",
                        buttonStyle: CustomButtonStyles.fillOrangeA,
                      ),
                    ],
                  ),
                ),
              ),
              _buildThirteen(context),
              _buildScrollHorizontal(context),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildThirteen(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: SizedBox(
        height: 382.v,
        width: double.maxFinite,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            CustomImageView(
              imagePath: ImageConstant.imgImage3,
              height: 382.v,
              width: 390.h,
              alignment: Alignment.center,
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 14.h,
                  top: 12.v,
                  bottom: 199.v,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: 48.v,
                        bottom: 57.v,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Bienvenido",
                            style: CustomTextStyles.headlineLargeSemiBold,
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "Martin",
                              style: CustomTextStyles
                                  .headlineLargeKufamOrange400d1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    CustomImageView(
                      imagePath: ImageConstant.imgRectangle15171x178,
                      height: 170.v,
                      width: 178.h,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildScrollHorizontal(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(
          left: 16.h,
          bottom: 142.v,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Destacado",
              style: theme.textTheme.titleLarge,
            ),
            SizedBox(height: 5.v),
            Padding(
              padding: EdgeInsets.only(left: 100.h),
              child: CarouselSlider.builder(
                options: CarouselOptions(
                  height: 200.v,
                  initialPage: 0,
                  autoPlay: true,
                  viewportFraction: 1.0,
                  enableInfiniteScroll: false,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (
                    index,
                    reason,
                  ) {
                    sliderIndex = index;
                  },
                ),
                itemCount: 3,
                itemBuilder: (context, index, realIndex) {
                  return SixteenItemWidget();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
