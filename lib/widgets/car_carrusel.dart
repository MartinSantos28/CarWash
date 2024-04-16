import 'package:carwash/models/car_model.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';


class CarCarouselWidget extends StatefulWidget {
  @override
  _CarCarouselWidgetState createState() => _CarCarouselWidgetState();
}

class _CarCarouselWidgetState extends State<CarCarouselWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Car>>(
      future: fetchCars(), // Asegúrate de que esta función devuelve una lista de carros.
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text("Error: ${snapshot.error}");
        } else if (snapshot.hasData) {
          return CarouselSlider.builder(
            options: CarouselOptions(
              height: 200,
              initialPage: 0,
              autoPlay: true,
              viewportFraction: 0.8,
              enableInfiniteScroll: true,
              scrollDirection: Axis.horizontal,
            ),
            itemCount: snapshot.data!.length,
            itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
              Car car = snapshot.data![itemIndex];
              return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    car.imageUrl, // Asegúrate de tener un campo imageUrl en tu modelo de carro.
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          );
        } else {
          return Center(child: Text('No hay datos disponibles.'));
        }
      },
    );
  }
  
  fetchCars() {}
}
