import 'package:flutter/cupertino.dart';
import 'package:home_life/src/presentation/view/calendar.dart';
import 'package:home_life/src/presentation/view/calificar.dart';
import 'package:home_life/src/presentation/view/cobrar.dart';
import 'package:home_life/src/presentation/view/codigo_qr.dart';
import 'package:home_life/src/presentation/view/datosDeContactoCliente.dart';
import 'package:home_life/src/presentation/view/datosDeContactoEspecialista.dart';
import 'package:home_life/src/presentation/view/datosEmpresaRegistro.dart';
import 'package:home_life/src/presentation/view/datosPersonalesCliente.dart';
import 'package:home_life/src/presentation/view/datosPersonalesEspecialista.dart';
import 'package:home_life/src/presentation/view/homePage.dart';
import 'package:home_life/src/presentation/view/hp.dart';
import 'package:home_life/src/presentation/view/indexPage.dart';
import 'package:home_life/src/presentation/view/locationPage.dart';
import 'package:home_life/src/presentation/view/loginPage.dart';
import 'package:home_life/src/presentation/view/modificarCiudades.dart';
import 'package:home_life/src/presentation/view/modificarNegocio.dart';
import 'package:home_life/src/presentation/view/profilePage.dart';
import 'package:home_life/src/presentation/view/searchPage.dart';
import 'package:home_life/src/presentation/view/seleccionCIudades.dart';
import 'package:home_life/src/presentation/view/seleccionarOficios.dart';
import 'package:home_life/src/presentation/view/seleccionarPlanes.dart';
import 'package:home_life/src/presentation/view/signupPage.dart';
import 'package:home_life/src/presentation/view/solicitarServicioPage.dart';
import 'package:home_life/src/presentation/view/solicitudes.dart';
import 'package:home_life/src/presentation/view/workerDetailPage.dart';

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
