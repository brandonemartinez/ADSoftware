import 'package:flutter/cupertino.dart';
import 'package:home_life/src/bloc/plan_bloc.dart';
import 'package:home_life/src/page/calendar.dart';
import 'package:home_life/src/page/calificar.dart';
import 'package:home_life/src/page/cobrar.dart';
import 'package:home_life/src/page/codigo_qr.dart';
import 'package:home_life/src/page/datos_de_contacto_cliente.dart';
import 'package:home_life/src/page/datos_de_contacto_especialista.dart';
import 'package:home_life/src/page/datos_empresa_registro.dart';
import 'package:home_life/src/page/datos_personales_cliente.dart';
import 'package:home_life/src/page/datos_personales_especialista.dart';
import 'package:home_life/src/page/home_page.dart';
import 'package:home_life/src/page/hp.dart';
import 'package:home_life/src/page/index_page.dart';
import 'package:home_life/src/page/location_page.dart';
import 'package:home_life/src/page/login_page.dart';
import 'package:home_life/src/page/modificar_ciudades.dart';
import 'package:home_life/src/page/modificar_negocio.dart';
import 'package:home_life/src/page/profile_page.dart';
import 'package:home_life/src/page/search_page.dart';
import 'package:home_life/src/page/seleccion_cIudades.dart';
import 'package:home_life/src/page/seleccionar_oficios.dart';
import 'package:home_life/src/page/seleccionar_oficios_ciudades_page.dart';
import 'package:home_life/src/page/seleccionar_planes.dart';
import 'package:home_life/src/page/signup_page.dart';
import 'package:home_life/src/page/solicitar_servicio_page.dart';
import 'package:home_life/src/page/solicitudes.dart';
import 'package:home_life/src/page/splash_screen.dart';
import 'package:home_life/src/page/worker_detail_page.dart';

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
  static const splashScreen = '/splash';
  static const oficiosCiudadesScreen = '/oficios_ciudades';


  static final routes = {
    homePage: (BuildContext context) => MyHomePage(),
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
    planes: (BuildContext context) => SeleccionPlanes(bloc: PlanBloc(),),
    cobrar: (BuildContext context) => Cobrar(),
    codigo: (BuildContext context) => CodigoQR(),
    empresa: (BuildContext context) => RegistroEmpresa(),
    negocio: (BuildContext context) => Negocio(),
    modificarCiudades: (BuildContext context) => ModificarCiudades(),
    seleccionarCiudades: (BuildContext context) => SeleccionarCiudades(),
    seleccionarOficios: (BuildContext context) => SeleccionarOficios(),
    indexPages: (BuildContext context) => IndexPage(),
    splashScreen: (BuildContext context) => SplashScreen(),
    oficiosCiudadesScreen: (BuildContext context) => SeleccionOficiosCiudadesPage(),
  };
}
