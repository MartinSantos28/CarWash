

import 'package:carwash/presentation/formularioDelete_screen/formulario_screen.dart';
import 'package:carwash/presentation/formularioUpdate_screen/formulario_screen.dart';
import 'package:carwash/presentation/formulario_screen/formulario_screen.dart';
import 'package:carwash/presentation/formularioAddCar_screen/formulario_screen.dart';
import 'package:flutter/material.dart';

import '../presentation/app_navigation_screen/app_navigation_screen.dart';
import '../presentation/iniciar_sesion_screen/iniciar_sesion_screen.dart';
import '../presentation/inicio_screen/inicio_screen.dart';
import '../presentation/main_screen/main_screen.dart';
import '../presentation/registro_screen/registro_screen.dart';

class AppRoutes {
  static const String inicioScreen = '/inicio_screen';

  static const String registroScreen = '/registro_screen';

  static const String iniciarSesionScreen = '/iniciar_sesion_screen';

  static const String mainScreen = '/main_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String formScreen = '/formulario_screen';

  static const String formUpdateScreen = '/formularioUpdate_screen';

  static const String formDeleteScreen = '/formularioDelete_screen';

  static const String formAddCarScreen = '/formularioAddCar_screen';

  static Map<String, WidgetBuilder> routes = {
    inicioScreen: (context) => InicioScreen(),
    registroScreen: (context) => RegistroScreen(),
    iniciarSesionScreen: (context) => IniciarSesionScreen(),
    mainScreen: (context) => MainScreen(),
    appNavigationScreen: (context) => AppNavigationScreen(),
    formScreen : (context) => FormularioScreen(),
    formUpdateScreen : (context) => FormularioUpdateScreen(),
    formDeleteScreen : (context) => FormularioDeleteScreen(),
    formAddCarScreen : (context) => FormularioAddCarScreen()
  };
}
