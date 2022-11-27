import 'package:flutter/material.dart';

class PlanCard extends StatelessWidget {
  PlanCard({
    required this.title,
    required this.description,
    required this.monthlyPrice,
    required this.anualPrice,
    this.onTap,
  });

  final String? title;
  final String? description;
  final int? monthlyPrice;
  final int? anualPrice;
  final VoidCallback? onTap;

  var _color;

  void selectColor(String monthlyPrice) {
    switch (monthlyPrice) {
      case '3':
        _color = Colors.blueAccent;
        break;
      case '3,5':
        _color = Colors.green;
        break;
      case '4':
        _color = Colors.orange;
        break;
      case '5':
        _color = Colors.red;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    selectColor(monthlyPrice.toString());
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          15,
        ),
      ),
      elevation: 4,
      child: InkWell(
        child: Padding(
          padding: const EdgeInsets.all(
            8.0,
          ),
          child: Column(
            children: [
              Text(
                title ?? '',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Divider(
                thickness: 1,
              ),
              Padding(
                padding: const EdgeInsets.all(
                  8.0,
                ),
                child: Text(
                  description ?? '',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(
                  8.0,
                ),
                child: Text(
                  '\$${monthlyPrice} USD / Por mes',
                  style: TextStyle(
                    fontSize: 18,
                    color: _color,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '\$${anualPrice} USD / Por año',
                style: TextStyle(
                  fontSize: 18,
                  color: _color,
                ),
              ),
            ],
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
