import 'package:flutter/material.dart';
import 'package:home_life/src/models/cliente_model.dart';
import 'package:home_life/src/resources/repositories/clienteRepository.dart';

import '../util/utils.dart';
import '../widget/primaryButton.dart';
import '../widget/primaryTextField.dart';

class DatosDeContactoCliente extends StatefulWidget {
  @override
  _DatosDeContactoClienteState createState() => _DatosDeContactoClienteState();
}

class _DatosDeContactoClienteState extends State<DatosDeContactoCliente> {
  final _formKey = GlobalKey<FormState>();
  String prueba = '';

  @override
  Widget build(BuildContext context) {
    final cliente = ModalRoute.of(context)!.settings.arguments as ClienteModel;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        title: Text(
          'Registro de cliente',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          'Datos de contacto',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  PrimaryTextField(
                    label: 'E-mail',
                    prefixIcon: Icons.alternate_email,
                    filled: true,
                    isEmail: true,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Enter your first name';
                      }
                      return null;
                    },
                    onSaved: (String? value) {
                      cliente.correo = value;
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  PrimaryTextField(
                    label: 'Teléfono',
                    prefixIcon: Icons.phone,
                    filled: true,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Ingrese un número de teléfono';
                      }
                      return null;
                    },
                    onSaved: (String? value) {
                      cliente.telefono = value;
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  PrimaryTextField(
                    label: 'Departamento',
                    prefixIcon: Icons.home_rounded,
                    filled: true,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Ingrese un departamento';
                      }
                      return null;
                    },
                    onSaved: (String? value) {
                      cliente.idDepartamento = int.parse(value!);
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  PrimaryTextField(
                    label: 'Dirección',
                    prefixIcon: Icons.home_rounded,
                    filled: true,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Ingrese una dirección';
                      }
                      return null;
                    },
                    onSaved: (String? value) {
                      cliente.direccion = value;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Checkbox(value: false, onChanged: (context) {}),
                      Text(prueba),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  PrimaryButton(
                    label: 'Registrarme',
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        ClienteRepository().registrarCliente(cliente);
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
