import 'package:carwash/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:carwash/core/app_export.dart';

class InicioScreen extends StatelessWidget {
  const InicioScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: SizedBox(
              height: SizeUtils.height,
              width: double.maxFinite,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 128.h,
                        vertical: 145.v,
                      ),
                      decoration: AppDecoration.fillBlueAF,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(height: 452.v),
                          CustomElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, '/main_screen');
                            },  
                            text: "Iniciar sesion",
                            buttonStyle: CustomButtonStyles.fillOrangeD,
                            buttonTextStyle:
                                CustomTextStyles.labelLargeBlack900,
                            
                          ),
                          
                          SizedBox(height: 26.v),
                          CustomElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, '/registro_screen');
                            },
                            text: "Registrate",
                            buttonTextStyle:
                                CustomTextStyles.labelLargeBlack900,
                          ),
                        ],
                      ),
                    ),
                  ),
                  CustomImageView(
                    imagePath: ImageConstant.imgRectangle12,
                    height: 274.v,
                    width: 390.h,
                    alignment: Alignment.center,
                  ),
                  CustomImageView(
                    imagePath: ImageConstant.imgImage1,
                    height: 183.v,
                    width: 390.h,
                    alignment: Alignment.topCenter,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
