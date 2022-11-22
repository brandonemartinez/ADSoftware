import 'package:flutter/material.dart';

class SeleccionPlanes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Expanded(
              child: Card(
                child: InkWell(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          'Plan individual',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Divider(),
                        Text(
                            'Podrá elegir hasta 3 oficios en los cuales usted sea especialista, y ofrecer sus servicios hasta en 3 ciudades.'),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '\$3 USD mensuales',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Text('o'),
                        Text(
                          '\$30 USD anuales',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: () => Navigator.pushNamed(context, '/select-ciudades'),
                ),
              ),
            ),
            Expanded(
              child: Card(
                child: InkWell(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          'Plan empresa pequeña',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Divider(),
                        Text(
                            'Podrán elegir hasta 10 oficios en los cuales sean especialistas, y ofrecer sus servicios hasta en 5 ciudades.'),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '\$3,5 USD mensuales',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Text('o'),
                        Text(
                          '\$35 USD anuales',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: () => {},
                ),
              ),
            ),
            Expanded(
              child: Card(
                child: InkWell(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          'Plan enterprise',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Divider(),
                        Text(
                            'Podrán elegir hasta 20 oficios en los cuales sean especialistas, y ofrecer sus servicios hasta en 10 ciudades.'),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '\$4 USD mensuales',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Text('o'),
                        Text(
                          '\$40 USD anuales',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: () => {},
                ),
              ),
            ),
            Expanded(
              child: Card(
                child: InkWell(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          'Plan ultimate',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Divider(),
                        Text(
                            'Podrán elegir hasta 20 oficios en los cuales usted sea especialista, y ofrecer sus servicios en todo el país.'),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '\$5 USD mensuales',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Text('o'),
                        Text(
                          '\$50 USD anuales',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: () => {},
                ),
              ),
            ),
            SizedBox(
              height: 80,
            ),
          ],
        ),
      ),
    );
  }
}
