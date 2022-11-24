import 'package:flutter/material.dart';

import '../../core/utils/utils.dart';
import '../widget/primaryButton.dart';
import '../widget/primaryTextField.dart';

class DatosDeContactoEspecialista extends StatelessWidget {
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
          'Registro de especialista',
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
                ),
                SizedBox(
                  height: 15,
                ),
                PrimaryTextField(
                  label: 'Teléfono',
                  prefixIcon: Icons.phone,
                  filled: true,
                ),
                SizedBox(
                  height: 15,
                ),
                PrimaryTextField(
                  label: 'Dirección',
                  prefixIcon: Icons.home_rounded,
                  filled: true,
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Checkbox(value: false, onChanged: (context) {}),
                    Text('Acepto los términos y condiciones'),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                PrimaryButton(
                  label: 'Registrarme',
                  onPressed: () => Navigator.pushNamed(context, '/empresa'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
