import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: Colors.red,
          ),
        ),
        child: const Center(
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("username"),
                  Text("chart"),
                  Text("routine"),
                  Text("routine lists"),
                ],
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Text("menu"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
