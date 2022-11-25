import 'package:flutter/cupertino.dart';
import 'package:home_life/src/page/calendar.dart';
import 'package:home_life/src/page/calificar.dart';
import 'package:home_life/src/page/cobrar.dart';
import 'package:home_life/src/page/codigo_qr.dart';
import 'package:home_life/src/page/datosDeContactoCliente.dart';
import 'package:home_life/src/page/datosDeContactoEspecialista.dart';
import 'package:home_life/src/page/datosEmpresaRegistro.dart';
import 'package:home_life/src/page/datosPersonalesCliente.dart';
import 'package:home_life/src/page/datosPersonalesEspecialista.dart';
import 'package:home_life/src/page/homePage.dart';
import 'package:home_life/src/page/hp.dart';
import 'package:home_life/src/page/indexPage.dart';
import 'package:home_life/src/page/locationPage.dart';
import 'package:home_life/src/page/loginPage.dart';
import 'package:home_life/src/page/modificarCiudades.dart';
import 'package:home_life/src/page/modificarNegocio.dart';
import 'package:home_life/src/page/profilePage.dart';
import 'package:home_life/src/page/searchPage.dart';
import 'package:home_life/src/page/seleccionCIudades.dart';
import 'package:home_life/src/page/seleccionarOficios.dart';
import 'package:home_life/src/page/seleccionarPlanes.dart';
import 'package:home_life/src/page/signupPage.dart';
import 'package:home_life/src/page/solicitarServicioPage.dart';
import 'package:home_life/src/page/solicitudes.dart';
import 'package:home_life/src/page/workerDetailPage.dart';


class NamedRoutes {
  static const homePage = '/home';
  static const loginPage = '/signIn';
  static const signUpPage = '/signUp';
  static const workerDetailPage = '/worker-detail';
  static const locationPage = '/ubication';
  static const searchPage = '/search';
  static const datosPersonalesCliente = '/client-sign-up';
  static const datosDeContactoCliente = '/client-data';
  static const datosPersonalesEspecialista = '/worker-sign-up';
  static const datosDeContactoEspecialista = '/worker-data';
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
  static const indexPages = '/index';

  static final menuLogedOut = {
    'Inicio': homePage,
    'Iniciar sesión': loginPage,
    'Cambiar ubicación': locationPage,
  };
  static final menuLogedIn = {
    'Ver mi perfil': profilePage,
    'Servicios solicitados': solicitudes,
    'Historial de pagos': historial,
    'Unirme como especialista': empresa,
  };

  static final menuWorkerLogedIn = {
    'Ver mi perfil': profilePage,
    'Historial de pagos': historial,
    'Ver agenda': calendar,
    'Servicios solicitados': solicitudes,
  };

  static final routes = {
    homePage: (BuildContext context) => MyHomePage(),
    workerDetailPage: (BuildContext context) => WorkerDetail(),
    loginPage: (BuildContext context) => LogIn(),
    signUpPage: (BuildContext context) => SignUp(),
    locationPage: (BuildContext context) => LocationPage(),
    searchPage: (BuildContext context) => SearchPage(),
    datosPersonalesCliente: (BuildContext context) => DatosPersonalesCliente(),
    datosDeContactoCliente: (BuildContext context) => DatosDeContactoCliente(),
    datosPersonalesEspecialista: (BuildContext context) =>
        DatosPersonalesEspecialista(),
    datosDeContactoEspecialista: (BuildContext context) =>
        DatosDeContactoEspecialista(),
    historial: (BuildContext context) => HistorialPagos(),
    profilePage: (BuildContext context) => Profile(),
    calendar: (BuildContext context) => Agenda(),
    solicitud: (BuildContext context) => Solicitud(),
    solicitudes: (BuildContext context) => SolicitudesPage(),
    calificar: (BuildContext context) => Calificar(),
    planes: (BuildContext context) => SeleccionPlanes(),
    cobrar: (BuildContext context) => Cobrar(),
    codigo: (BuildContext context) => CodigoQR(),
    empresa: (BuildContext context) => RegistroEmpresa(),
    negocio: (BuildContext context) => Negocio(),
    modificarCiudades: (BuildContext context) => ModificarCiudades(),
    seleccionarCiudades: (BuildContext context) => SeleccionarCiudades(),
    seleccionarOficios: (BuildContext context) => SeleccionarOficios(),
    indexPages: (BuildContext context) => IndexPage(),
  };
}
