import 'package:flutter/material.dart';
import 'package:home_life/src/util/utils.dart';

class SearchCard extends StatelessWidget {
  const SearchCard({
    required this.name,
    required this.oficio,
    required this.icon,
    required this.ontap,
  });

  final String name;
  final String oficio;
  final Widget icon;
  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius,
      ),
      elevation: 4,
      child: InkWell(
        child: ListTile(
          title: Text(name, style: TextStyle(fontSize: 18),),
          subtitle: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Text(oficio, style: TextStyle(fontSize: 16),),
          ),
          trailing: icon,
        ),
        onTap: ontap,
      ),
    );
  }
}
