import 'package:carwash/core/app_export.dart';
import 'package:carwash/models/User_model.dart';
import 'package:carwash/services/user_service.dart';
import 'package:carwash/widgets/custom_elevated_button.dart';
import 'package:carwash/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';


// ignore: must_be_immutable
class RegistroScreen extends StatelessWidget {
  RegistroScreen({Key? key}) : super(key: key);

  TextEditingController nombreController = TextEditingController();
  TextEditingController apellidoController = TextEditingController();
  TextEditingController correoController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repetirPasswordController = TextEditingController();

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
                    vertical: 100.v,
                  ),
                  decoration: AppDecoration.fillBlueA,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.only(left: 5.h),
                        child: Text(
                          "Nombre :",
                          style: theme.textTheme.labelLarge,
                        ),
                      ),
                      SizedBox(height: 3.v),
                      CustomTextFormField(controller: nombreController),
                      SizedBox(height: 15.v,),
                      Padding(
                        padding: EdgeInsets.only(left: 5.h),
                        child : Text (
                          "Apellidos: ",
                          style: theme.textTheme.labelLarge,
                        )
                      ),
                      SizedBox(height: 3.v),
                      CustomTextFormField(controller: apellidoController),
                      SizedBox(height: 15.v),
                      Padding(
                        padding: EdgeInsets.only(left: 5.h),
                        child: Text(
                          "Correo electrónico:",
                          style: theme.textTheme.labelLarge,
                        ),
                      ),
                      SizedBox(height: 3.v),
                      CustomTextFormField(controller: correoController),
                      SizedBox(height: 15.v),
                      Padding(
                        padding: EdgeInsets.only(left: 5.h),
                        child: Text(
                          "Contraseña:",
                          style: theme.textTheme.labelLarge,
                        ),
                      ),
                      SizedBox(height: 2.v),
                      CustomTextFormField(controller: passwordController),
                      SizedBox(height: 15.v),
                      Padding(
                        padding: EdgeInsets.only(left: 5.h),
                        child: Text(
                          "Repetir contraseña:",
                          style: theme.textTheme.labelLarge,
                        ),
                      ),
                      SizedBox(height: 1.v),
                      CustomTextFormField(controller: repetirPasswordController),
                      SizedBox(height: 3.v),
                     SizedBox(height: 4.v,),
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

  Widget _buildRegistrate(BuildContext context) {
    return CustomElevatedButton(
      width: 133.h,
      text: "Regístrate",
      buttonStyle: CustomButtonStyles.fillOrangeA,
      alignment: Alignment.center,
      onPressed: () async {
        // Obtener los datos ingresados por el usuario
        String name = nombreController.text;
        String last_name = apellidoController.text;
        String email = correoController.text;
        String password = passwordController.text;
        String repetirPassword = repetirPasswordController.text;

        // Verificar si las contraseñas coinciden
        if (password != repetirPassword) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Error"),
                content: Text("Las contraseñas no coinciden."),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text("OK"),
                  ),
                ],
              );
            },
          );
          return;
        }

        // Crear un nuevo usuario
        try {
          User newUser = await CreateUserServices.createUser(name,last_name, email, password);
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Éxito"),
                content: Text("Usuario registrado correctamente: ${newUser.last_name}"),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.pushNamed(context, '/main_screen');
                    },

                    child: Text("OK"),
                  ),
                ],
              );
            },
          );
        } catch (error) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Error"),
                content: Text("Error al registrar usuario: $error"),
                actions: [
                  TextButton(
                     onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.pushNamed(context, '/main_screen');
                    },

                    child: Text("OK"),
                  ),
                ],
              );
            },
          );
        }
      },
    );
  }

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
                    SizedBox(height: 250.v),
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
