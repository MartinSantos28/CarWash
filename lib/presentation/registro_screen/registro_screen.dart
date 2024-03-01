import 'package:carwash/core/app_export.dart';
import 'package:carwash/widgets/custom_elevated_button.dart';
import 'package:carwash/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class RegistroScreen extends StatelessWidget {
  RegistroScreen({Key? key})
      : super(
          key: key,
        );

  TextEditingController editTextController = TextEditingController();

  TextEditingController editTextController1 = TextEditingController();

  TextEditingController editTextController2 = TextEditingController();

  TextEditingController editTextController3 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
                    horizontal: 25.h,
                    vertical: 93.v,
                  ),
                  decoration: AppDecoration.fillBlueA,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Spacer(

                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 5.h),

                        child: Text(
                          "Nombre completo:",
                          style: theme.textTheme.labelLarge,
                        ),
                      
                      ),SizedBox(height: 3.v),
                      _buildEditText(context),
                      SizedBox(height: 41.v),
                      Padding(
                        padding: EdgeInsets.only(left: 5.h),
                        
                        child: Text(
                          "Correo electronico:",
                          style: theme.textTheme.labelLarge,
                        ),
                      ),
                      SizedBox(height: 3.v),
                      _buildEditText(context),
                      SizedBox(height: 41.v),
                      Padding(
                        padding: EdgeInsets.only(left: 5.h),
                        child: Text(
                          "Contraseña:",
                          style: theme.textTheme.labelLarge,
                        ),
                      ),
                      SizedBox(height: 2.v),
                      _buildEditText1(context),
                      SizedBox(height: 42.v),
                      Padding(
                        padding: EdgeInsets.only(left: 5.h),
                        child: Text(
                          "Repite contraseña:",
                          style: theme.textTheme.labelLarge,
                        ),
                      ),
                      SizedBox(height: 1.v),
                      _buildEditText2(context),
                      SizedBox(height: 3.v),

                      SizedBox(height: 72.v),
                      _buildRegistrate(context),
                    ],
                  ),
                ),
              ),
              _buildSeven(context),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildEditText(BuildContext context) {
    return CustomTextFormField(
      controller: editTextController,
    );
  }

  /// Section Widget
  Widget _buildEditText1(BuildContext context) {
    return CustomTextFormField(
      controller: editTextController1,
    );
  }

  /// Section Widget
  Widget _buildEditText2(BuildContext context) {
    return CustomTextFormField(
      controller: editTextController2,
    );
  }

  /// Section Widget
  Widget _buildRegistrate(BuildContext context) {
    return CustomElevatedButton(
      width: 133.h,
      text: "Registrate",
      alignment: Alignment.center,
    );
  }

  /// Section Widget
  Widget _buildEditText3(BuildContext context) {
    return CustomTextFormField(
      controller: editTextController3,
      textInputAction: TextInputAction.done,
    );
  }

  /// Section Widget
  Widget _buildSeven(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: SizedBox(
        height: 355.v,
        width: double.maxFinite,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            CustomImageView(
              imagePath: ImageConstant.imgImage2,
              height: 355.v,
              width: 390.h,
              alignment: Alignment.center,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 25.h,
                  right: 28.h,
                  bottom: 12.v,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Regístrate",
                      style: theme.textTheme.headlineLarge,
                    ),
                    SizedBox(height: 172.v),
                    
                    
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
