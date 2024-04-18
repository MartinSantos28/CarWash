import 'package:carwash/core/app_export.dart';
import 'package:carwash/services/appointment_service.dart';
// ignore: unused_import
import 'package:carwash/services/car_service.dart'; // Asegúrate de importar el servicio de carros
import 'package:carwash/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);
  // Definir fetchCars aquí si no estás usando un servicio separado
  Future<Map<String, dynamic>> fetchCars() async {
    return CarService()
        .getCars(); // Asume que CarService tiene un método getCars que devuelve una lista de Carros
  }

  Future<Map<String, dynamic>> fetchAppointments() async {
    return AppointmentService()
        .getUserAppointments(); // Asume que CarService tiene un método getCars que devuelve una lista de Carros
  }

  @override
  Widget build(BuildContext context) {
  // MediaQuery para obtener las dimensiones de la pantalla
  double screenWidth = MediaQuery.of(context).size.width;

  // Definimos el ancho y el alto del contenedor de los botones.
  double buttonsContainerWidth = screenWidth * 0.8; // El contenedor es el 80% del ancho de la pantalla.
  double buttonsContainerHeight = screenWidth * 0.6; // Altura basada en el ancho para mantener la proporción.

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
                
                // Este contenedor mantiene el estilo de fondo y no afecta los botones.
                padding: EdgeInsets.symmetric(
                  horizontal: SizeUtils.width,
                  vertical: SizeUtils.height,
                  
                ),
                decoration: AppDecoration.fillBlueA,
              ),
            ),
            Align(
              alignment: Alignment.center,
              // El Container para los botones está aquí
              child: Container(
                width: buttonsContainerWidth,
                height: buttonsContainerHeight,
                
                padding: EdgeInsets.only(top: 79), // Padding para el contenedor de botones
                decoration: BoxDecoration(
                  color: Colors.transparent, // Puede ser transparente o el color deseado
                  borderRadius: BorderRadius.circular(20),
                ),
                child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: (buttonsContainerWidth / 2) / (buttonsContainerHeight / 4),
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  children: <Widget>[
                    CustomElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/formularioUpdate_screen');
                      },
                      text: 'Editar cita',
                      buttonStyle: CustomButtonStyles.fillOrangeA,
                    ),
                    CustomElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/formularioAddCar_screen');
                      },
                      text: 'Agregar carro',
                      buttonStyle: CustomButtonStyles.fillOrangeA,
                    ),
                    CustomElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/formularioDelete_screen');
                      },
                      text: 'Eliminar cita',
                      buttonStyle: CustomButtonStyles.fillOrangeA,
                    ),
                    CustomElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/formulario_screen');
                      },
                      text: "Agendar cita",
                      buttonStyle: CustomButtonStyles.fillOrangeA,
                    ),
                    // Más botones si son necesarios...
                  ],
                ),
              ),
            ),
             _buildScrollHorizontal(context),
             _buildThirteen(context)
            // asegúrate de que estos no estén siendo afectados por el nuevo contenedor de botones.
          ],
        ),
      ),
    ),
  );
}

  Widget _buildThirteen(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: SizedBox(
        height: 385.v,
        width: double.infinity,
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
                  bottom: 190.v,
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
                              "",
                              style: TextStyle(
                                color: appTheme.orange400D1,
                                fontSize: 15.fSize,
                                fontWeight: FontWeight.w600,
                              ),
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

  Widget _buildScrollHorizontal(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(
          left: 16,
          bottom: 40.h,
        ), // Asegúrate de que estos valores son correctos para tu layout.
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Coches", style: Theme.of(context).textTheme.titleLarge),
            SizedBox(height: 5.h),
            FutureBuilder<Map<String, dynamic>>(
              future:
                  fetchCars(), // Asegúrate de que esta función devuelve una lista de carros.
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Text("Error: ${snapshot.error}");
                } else if (snapshot.hasData) {
                  Map<String, dynamic> carData = snapshot.data!;
                  return ListTile(
                    title: Text(
                      carData["brand"] + ' ' + carData["model"],
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    subtitle: Text(carData["year_of_model"]),
                  );
                } else {
                  return Center(child: Text('No hay datos disponibles.'));
                }
              },
            ),
            Text(
              "Citas",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            FutureBuilder<Map<String, dynamic>>(
              future: fetchAppointments(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Text("Error : ${snapshot.error}");
                } else if (snapshot.hasData) {
                  Map<String, dynamic> appoinmentData = snapshot.data!;
                  return ListTile(
                    title: Text(
                        appoinmentData["vehicle"] +
                            ' ' +
                            appoinmentData["date_of_appointment"] +
                            ' ' +
                            appoinmentData["hour"],
                        style: Theme.of(context).textTheme.titleMedium),
                    subtitle: Text(appoinmentData["instructions"]),
                  );
                } else {
                  return Center(child: Text('No hay datos disponibles'));
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
