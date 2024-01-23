import 'package:brandshop/utils/text-widget.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextWidget(
          text: "Notification",
          size: 23,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Column(
        children: [
          Divider(),
        ],
      ),
    );
  }
}
