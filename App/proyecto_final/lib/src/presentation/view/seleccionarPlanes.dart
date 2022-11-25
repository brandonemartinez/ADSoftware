import 'package:flutter/material.dart';
import 'package:home_life/src/core/utils/utils.dart';
import 'package:home_life/src/presentation/widget/planCard.dart';

class SeleccionPlanes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        foregroundColor: Colors.black,
        title: Text('Seleccionar plan'),
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(
            15.0,
          ),
          child: Column(
            children: [
              PlanCard(
                title: 'Plan individual',
                description:
                    'Podrán elegir hasta 3 oficios en los cuales sean especialistas, y ofrecer sus servicios hasta en 3 ciudades.',
                monthlyPrice: '3',
                anualPrice: '30',
              ),
              PlanCard(
                title: 'Plan empresa pequeña',
                description:
                    'Podrán elegir hasta 10 oficios en los cuales sean especialistas, y ofrecer sus servicios hasta en 5 ciudades.',
                monthlyPrice: '3,5',
                anualPrice: '35',
              ),
              PlanCard(
                title: 'Plan enterprise',
                description:
                    'Podrán elegir hasta 20 oficios en los cuales sean especialistas, y ofrecer sus servicios hasta en 10 ciudades.',
                monthlyPrice: '4',
                anualPrice: '40',
              ),
              PlanCard(
                title: 'Plan ultimate',
                description:
                    'Podrán elegir hasta 20 oficios en los cuales usted sea especialista, y ofrecer sus servicios en todo el país.',
                monthlyPrice: '5',
                anualPrice: '50',
              ),
              SizedBox(
                height: 80,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
