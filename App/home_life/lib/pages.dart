import 'package:flutter/cupertino.dart';
import 'package:home_life/pages/calendar.dart';
import 'package:home_life/pages/calificar.dart';
import 'package:home_life/pages/clientRegisterPage.dart';
import 'package:home_life/pages/cobrar.dart';
import 'package:home_life/pages/codigo_qr.dart';
import 'package:home_life/pages/datosEmpresaRegistro.dart';
import 'package:home_life/pages/homePage.dart';
import 'package:home_life/pages/hp.dart';
import 'package:home_life/pages/modificarCiudades.dart';
import 'package:home_life/pages/modificarNegocio.dart';
import 'package:home_life/pages/profilePage.dart';
import 'package:home_life/pages/searchPage.dart';
import 'package:home_life/pages/loginPage.dart';
import 'package:home_life/pages/seleccionCIudades.dart';
import 'package:home_life/pages/seleccionarOficios.dart';
import 'package:home_life/pages/seleccionarPlanes.dart';
import 'package:home_life/pages/signupPage.dart';
import 'package:home_life/pages/locationPage.dart';
import 'package:home_life/pages/solicitarServicioPage.dart';
import 'package:home_life/pages/solicitudes.dart';
import 'package:home_life/pages/workerDetailPage.dart';
import 'package:home_life/pages/workerRegisterPage.dart';

class NamedRoutes {
  static const homePage = '/home';
  static const loginPage = '/signIn';
  static const signUpPage = '/signUp';
  static const workerDetailPage = '/worker-detail';
  static const locationPage = '/ubication';
  static const searchPage = '/search';
  static const clientSignUpPage = '/client-sign-up';
  static const workerSignUpPage = '/worker-sign-up';
  static const historial = '/pagos';
  static const profilePage = '/profile';
  static const calendar = '/agenda';
  static const solicitud = '/solicitud';
  static const solicitudes = '/solicitudes';
  static const calificar = '/calificar';
  static const planes = '/planes';
  static const cobrar = '/cobrar';
  static const codigo = '/codigo';
  static const empresa = '/empresa';
  static const negocio = '/negocio';
  static const modificarCiudades = '/modificar-ciudades';
  static const seleccionarCiudades = '/select-ciudades';
  static const seleccionarOficios = '/select-oficios';

  static final menuLogedOut = {
    'Inicio': homePage,
    'Iniciar sesión': loginPage,
    'Cambiar ubicación': locationPage,
  };
  static final menuLogedIn = {
    'Ver mi perfil': profilePage,
    'Historial de pagos': historial,
    'Unirme como especialista': workerSignUpPage,
  };

  static final menuWorkerLogedIn = {
    'Ver mi perfil': profilePage,
    'Historial de pagos': historial,
    'Ver agenda': calendar,
    'Solicitudes Pendientes': solicitudes,
  };

  static final routes = {
    homePage: (BuildContext context) => MyHomePage(),
    workerDetailPage: (BuildContext context) => WorkerDetail(),
    loginPage: (BuildContext context) => LogIn(),
    signUpPage: (BuildContext context) => SignUp(),
    locationPage: (BuildContext context) => Location(),
    searchPage: (BuildContext context) => SearchPage(),
    clientSignUpPage: (BuildContext context) => ClientRegisterPage(),
    workerSignUpPage: (BuildContext context) => WorkerRegisterPage(),
    historial: (BuildContext context) => HistorialPagos(),
    profilePage: (BuildContext context) => Profile(),
    calendar: (BuildContext context) => Agenda(),
    solicitud: (BuildContext context) => Solicitud(),
    solicitudes: (BuildContext context) => Solicitudes(),
    calificar: (BuildContext context) => Calificar(),
    planes: (BuildContext context) => SeleccionPlanes(),
    cobrar: (BuildContext context) => Cobrar(),
    codigo: (BuildContext context) => CodigoQR(),
    empresa: (BuildContext context) => RegistroEmpresa(),
    negocio: (BuildContext context) => Negocio(),
    modificarCiudades: (BuildContext context) => ModificarCiudades(),
    seleccionarCiudades: (BuildContext context) => SeleccionarCiudades(),
    seleccionarOficios: (BuildContext context) => SeleccionarOficios(),
  };
}
