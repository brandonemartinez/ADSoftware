import 'package:flutter/material.dart';
import '../widget/primaryButton.dart';
import '../widget/primaryTextField.dart';

import '../../core/utils/utils.dart';

class RegistroEmpresa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        title: Text(
          'Información de la empresa',
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
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                PrimaryTextField(
                  label: 'Razón Social',
                  prefixIcon: Icons.description_rounded,
                  filled: true,
                ),
                SizedBox(
                  height: 15,
                ),
                PrimaryTextField(
                  label: 'Nombre de fantasía',
                  prefixIcon: Icons.apartment_rounded,
                  filled: true,
                ),
                SizedBox(
                  height: 15,
                ),
                PrimaryTextField(
                  label: "Documento o R.U.T.",
                  prefixIcon: Icons.work_rounded,
                  filled: true,
                ),
                SizedBox(
                  height: 15,
                ),
                PrimaryTextField(
                  label: 'Presentación',
                  prefixIcon: Icons.description_rounded,
                  filled: true,
                ),
                TextField(
                  decoration: InputDecoration(
                    border: border,
                    prefixIcon: Icon(
                      Icons.person,
                    ),
                    hintText: 'Cargar fotos',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  decoration: InputDecoration(
                    border: border,
                    prefixIcon: Icon(
                      Icons.alternate_email,
                    ),
                    hintText: 'Foto de perfil',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  decoration: InputDecoration(
                    border: border,
                    prefixIcon: Icon(
                      Icons.home,
                    ),
                    hintText: 'Disponibilidad',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Checkbox(value: true, onChanged: (context) {}),
                    Text('Acepto los términos y condiciones'),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                PrimaryButton(
                  label: 'Seleccionar plan',
                  onPressed: () => Navigator.pushNamed(context, '/planes'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
