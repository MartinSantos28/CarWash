import 'package:carwash/services/appointment_service.dart';
import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart'; // ignore_for_file: must_be_immutable

class FormularioDeleteScreen extends StatelessWidget {
  FormularioDeleteScreen({Key? key})
      : super(
          key: key,
        );

  TextEditingController appointmentIdController = TextEditingController();

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
                      vertical: 380.v,
                    ),
                    decoration: AppDecoration.fillBlueAF,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildNotaSection(context),
                        SizedBox(height: 72.v),
                        _buildDeleteAppointment(context) // This is the updated part
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

  Widget _buildDeleteAppointment(BuildContext context) {
    return CustomElevatedButton(
      width: 133.h,
      text: "Eliminar Cita",
      alignment: Alignment.center,
      buttonStyle: CustomButtonStyles.fillOrangeA,
      onPressed: () async {
        String appointmentId = appointmentIdController.text;

        try {
          bool isSuccess = await AppointmentService().deleteAppointment(appointmentId, 'your_auth_token_here');
          if (isSuccess) {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Éxito"),
                  content: Text("Cita eliminada correctamente."),
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
            throw Exception("Failed to delete appointment");
          }
        } catch (error) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Error"),
                content: Text("Error al eliminar la cita: $error"),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
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

  Widget _buildNotaSection(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 2.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextFormField(
            hintText: "ID de la Cita",
            controller: appointmentIdController,
            textInputAction: TextInputAction.done,
          )
        ],
      ),
    );
  }
  

}