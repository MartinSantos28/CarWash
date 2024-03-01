import 'package:carwash/core/app_export.dart';
import 'package:carwash/presentation/main_screen/main_screen.dart';
import 'package:carwash/widgets/custom_elevated_button.dart';
import 'package:carwash/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class IniciarSesionScreen extends StatelessWidget {
  IniciarSesionScreen({Key? key})
      : super(
          key: key,
        );

  TextEditingController editTextController = TextEditingController();

  TextEditingController editTextController1 = TextEditingController();

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
                  margin: EdgeInsets.only(bottom: 1.v),
                  padding: EdgeInsets.symmetric(
                    horizontal: 25.h,
                    vertical: 91.v,
                  ),
                  decoration: AppDecoration.fillBlueA,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Spacer(
                        flex: 60,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 5.h),
                          child: Text(
                            "Correo electronico:",
                            style: theme.textTheme.labelLarge,
                          ),
                        ),
                      ),
                      SizedBox(height: 3.v),
                      CustomTextFormField(
                        controller: editTextController,
                      ),
                      SizedBox(height: 59.v),
                      CustomTextFormField(
                        controller: editTextController1,
                        textInputAction: TextInputAction.done,
                      ),
                      Spacer(
                        flex: 39,
                      ),
                      CustomElevatedButton(
                        onPressed: () {
                          print('Hola');
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MainScreen()),
                          );
                        },
                        width: 133.h,
                        text: "Iniciar sesion",
                        buttonStyle: CustomButtonStyles.fillOrangeA,
                      ),
                    ],
                  ),
                ),
              ),
              _buildFour(context),
              _buildSix(context),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildFour(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: SizedBox(
        height: 355.v,
        width: double.maxFinite,
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            CustomImageView(
              imagePath: ImageConstant.imgImage2,
              height: 355.v,
              width: 390.h,
              alignment: Alignment.center,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 12.h,
                  top: 69.v,
                ),
                child: Text(
                  "Iniciar sesión",
                  style: theme.textTheme.headlineLarge,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildSix(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 348.v,
        width: double.maxFinite,
        margin: EdgeInsets.only(bottom: 23.v),
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
         /*   CustomImageView(
              imagePath: ImageConstant.imgRectangle15,
              height: 348.v,
              width: 390.h,
              alignment: Alignment.center,
            ), */
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 30.h,
                  right: 168.h,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Contraseña:",
                      style: theme.textTheme.labelLarge,
                    ),
                    SizedBox(height: 44.v),
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
