import 'package:carwash/models/car_model.dart';
import 'package:carwash/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:carwash/core/app_export.dart';

// ignore: unused_import
import 'package:carwash/services/car_service.dart'; // Asegúrate de importar el servicio de carros

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);

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
                      SizedBox(height: 10.v),
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
                              style: TextStyle(
                                color: appTheme.orange400D1,
                                fontSize: 15.fSize ,
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
        padding: EdgeInsets.only(left: 16, bottom: 140.h), // Asegúrate de que estos valores son correctos para tu layout.
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Destacado", style: Theme.of(context).textTheme.titleLarge),
            SizedBox(height: 5.h),
            FutureBuilder<List<Car>>(
              future: fetchCars(), // Asegúrate de que esta función devuelve una lista de carros.
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Text("Error: ${snapshot.error}");
                } else if (snapshot.hasData) {
                  return CarouselSlider.builder(
                    options: CarouselOptions(
                      height: 100.h, 
                      initialPage: 0,
                      autoPlay: true,
                      viewportFraction: 0.8,
                      enableInfiniteScroll: true,
                      scrollDirection: Axis.horizontal,
                    ),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
                      Car car = snapshot.data![itemIndex];
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 5.h),
                            child: Column(
                              children: [
                                Expanded(
                                  child: Image.network(
                                    car.imageUrl,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Text(car.brand + ' ' + car.model), // Muestra la marca y el modelo del carro
                              ],
                            ),
                          );
                        },
                      );
                    },
                  );
                } else {
                  return Center(child: Text('No hay datos disponibles.'));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
  
  fetchCars() {}
}
