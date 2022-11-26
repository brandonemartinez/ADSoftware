import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Cobrar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        foregroundColor: Colors.black,
        title: Text('Cobrar un servicio'),
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
              ),
              Text(
                'Ingrese el monto a cobrar: ',
                style: TextStyle(fontSize: 30),
              ),
              SizedBox(
                height: 40,
              ),
              TextField(
                style: TextStyle(fontSize: 30),
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  prefixIcon: Icon(
                    CupertinoIcons.money_dollar,
                    size: 35,
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/codigo'),
                child: Text(
                  'Cobrar servicio',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
