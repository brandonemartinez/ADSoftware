import 'package:flutter/material.dart';
import 'package:home_life/src/util/utils.dart';

class SearchCard extends StatelessWidget {
  const SearchCard({
    required this.image,
    required this.name,
    required this.oficio,
    required this.icon,
    required this.ontap,
  });

  final Widget image;
  final String name;
  final String oficio;
  final Widget icon;
  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius,
        ),
        elevation: 4,
        child: InkWell(
          child: ListTile(
            leading: image,
            title: Text(name),
            subtitle: Text(oficio),
            trailing: icon,
          ),
          onTap: ontap,
        ),
      ),
    );
  }
}
