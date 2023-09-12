import 'package:brandshop/utils/text-widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController controller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              "assets/images/logo.png",
              height: 100,
            ),
          ),
          Center(
            child: Container(
              width: MediaQuery.sizeOf(context).width - 30,
              child: TextFormField(
                controller: controller,
                // validator: (value) {
                //   if (value!.isEmpty || value.length < 10) {
                //     return 'Phone invalidate';
                //   }
                //   return null;
                // },
                decoration: InputDecoration(
                  hintText: "Search",
                  labelStyle: const TextStyle(
                    color: Colors.black,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.3122410774),
                    borderSide: const BorderSide(
                      color: Color(0xffc0c0c0),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.3122410774),
                    borderSide: const BorderSide(
                      color: Color(0xffc0c0c0),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.3122410774),
                    borderSide: const BorderSide(color: Colors.black),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.3122410774),
                    borderSide: const BorderSide(
                      color: Color(0xffc0c0c0),
                    ),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
