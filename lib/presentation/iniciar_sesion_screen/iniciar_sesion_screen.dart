import 'package:carwash/services/auth-user_service.dart';
import 'package:flutter/material.dart';
import 'package:carwash/core/app_export.dart';
import 'package:carwash/presentation/main_screen/main_screen.dart';

import 'package:carwash/widgets/custom_elevated_button.dart';
import 'package:carwash/widgets/custom_text_form_field.dart';

class IniciarSesionScreen extends StatelessWidget {
  IniciarSesionScreen({Key? key}) : super(key: key);

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
                      Spacer(flex: 60),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 5.h),
                          child: Text(
                            "Nombre de usuario:",
                            style: theme.textTheme.labelLarge,
                          ),
                        ),
                      ),
                      SizedBox(height: 3.v),
                      CustomTextFormField(
                        controller: usernameController,
                      ),
                      SizedBox(height: 59.v),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 5.h),
                          child: Text(
                            "Contraseña:",
                            style: theme.textTheme.labelLarge,
                          ),
                        ),
                      ),
                      SizedBox(height: 3.v),
                      CustomTextFormField(
                        controller: passwordController,
                        textInputAction: TextInputAction.done,
                      ),
                      Spacer(flex: 39),
                      CustomElevatedButton(
                        onPressed: () {
                          _login(context);
                        },
                        width: 133.h,
                        text: "Iniciar sesión",
                        buttonStyle: CustomButtonStyles.fillOrangeA,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _login(BuildContext context) async {
    AuthService authService = AuthService();
    bool success = await authService.loginUser(
      usernameController.text,
      passwordController.text,
    );

    if (success) {
      
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainScreen()),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('Inicio de sesión fallido.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Aceptar'),
            ),
          ],
        ),
      );
    }
  }
}
