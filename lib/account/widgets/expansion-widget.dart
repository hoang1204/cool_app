import 'package:brandshop/utils/text-widget.dart';
import 'package:flutter/material.dart';

class ExpansionWidget extends StatelessWidget {
  ExpansionWidget({
    super.key,
    required this.title,
    required this.icon,
    this.childrens,
  });
  final List<Widget>? childrens;
  final Widget icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      trailing: Icon(Icons.arrow_left),
      children: childrens ?? [],
      title: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: icon,
          ),
          TextWidget(
            text: title,
            size: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
