import 'package:carwash/services/appointment_service.dart';
import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../models/appoinment_model.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart'; // ignore_for_file: must_be_immutable

class FormularioUpdateScreen extends StatelessWidget {
  FormularioUpdateScreen({Key? key})
      : super(
          key: key,
        );

  TextEditingController edittextController = TextEditingController();
  TextEditingController vehiculoController = TextEditingController();
  TextEditingController fechaController = TextEditingController();
  TextEditingController horaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
             
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 23.h,
                      vertical: 154.v,
                    ),
                    decoration: AppDecoration.fillBlueAF,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 29.v),
                        Padding(
                          padding: EdgeInsets.only(left: 5.h),
                          child: _buildSeleccionFechaSection(
                            context,
                            labelText: "Selecciona tu vehiculo:", arrowText: '',
                          ),
                        ),
                        SizedBox(height: 1.v),
                        CustomTextFormField(controller: vehiculoController),
                        SizedBox(height: 47.v),
                        Padding(
                          padding: EdgeInsets.only(left: 2.h),
                          child: _buildSeleccionFechaSection(
                            context,
                            labelText: "Selecciona la fecha:",
                            arrowText: "",
                          ),
                        ),
                        SizedBox(height: 1.v),
                        CustomTextFormField(controller: fechaController),
                        SizedBox(height: 47.v),
                        Padding(
                          padding: EdgeInsets.only(left: 2.h),
                          child: _buildSeleccionFechaSection(
                            context,
                            labelText: "Selecciona Hora:",
                            arrowText: "",
                          ),
                        ),
                        SizedBox(height: 1.v),
                        CustomTextFormField(controller: horaController),
                        SizedBox(height: 47.v),
                        _buildNotaSection(context),
                        SizedBox(height: 72.v),
                        _buildScheduleAppointment(context,'2')
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
Widget _buildScheduleAppointment(BuildContext context, String appointmentId) {
  return CustomElevatedButton(
    width: 133.h,
    text: "Actualizar Cita",
    alignment: Alignment.center,
    buttonStyle: CustomButtonStyles.fillOrangeA,
    onPressed: () async {
      // Obtener los datos ingresados por el usuario
      String vehicle = vehiculoController.text;
      String dateOfAppointment = fechaController.text;
      String hour = horaController.text;
      String instructions = edittextController.text; // Asumo que edittextController es para las instrucciones

      // Opcional: Agregar validación para los datos ingresados

      // Actualizar una cita existente
      try {
        Appointment updatedAppointment = Appointment(
          vehicle: vehicle,
          dateOfAppointment: dateOfAppointment,
          hour: hour,
          instructions: instructions,
        );
        bool isSuccess = await AppointmentService().updateAppointment(appointmentId, updatedAppointment, 'your_auth_token_here');
        if (isSuccess) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Éxito"),
                content: Text("Cita actualizada correctamente."),
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
        } else {
          throw Exception("Failed to update appointment");
        }
      } catch (error) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Error"),
              content: Text("Error al actualizar la cita: $error"),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
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


   Widget _buildStackSection(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 141.v,
            width: 272.h,
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgRectangle12,
                  height: 141.v,
                  width: 272.h,
                  alignment: Alignment.center,
                ),
                CustomAppBar(
                  leadingWidth: double.maxFinite,
                  leading: AppbarLeadingImage(
                    imagePath: ImageConstant.imgRectangle11,
                    margin: EdgeInsets.only(
                      left: 18.h,
                      right: 337.h,
                    ),
                  ),
                )
              ],
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgRectangle12,
            height: 87.v,
            width: 110.h,
            margin: EdgeInsets.only(
              top: 4.v,
              bottom: 50.v,
            ),
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildNotaSection(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 2.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10.h),
            child: Text(
              "Nota:",
              style: theme.textTheme.labelLarge,
            ),
          ),
          SizedBox(height: 2.v),
          Padding(
            padding: EdgeInsets.only(left: 5.h),
            child: CustomTextFormField(
              controller: edittextController,
              textInputAction: TextInputAction.done,
            ),
          )
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildSeleccionFechaSection(
    BuildContext context, {
    required String labelText,
    required String arrowText,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 5.h),
          child: Text(
            labelText,
            style: theme.textTheme.labelLarge!.copyWith(
              color: appTheme.whiteA700,
            ),
          ),
        ),
        SizedBox(height: 3.v),
        Container(
          width: 337.h,
          margin: EdgeInsets.only(right: 5.h),
          padding: EdgeInsets.symmetric(
            horizontal: 15.h,
            vertical: 9.v,
          ),

          child: Text(
            arrowText,
            style: theme.textTheme.bodySmall!.copyWith(
              color: appTheme.whiteA700,
            ),
          ),
        )
      ],
    );
  }
}
