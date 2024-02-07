import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:workout_app/styles/font_inika.dart';
import 'package:workout_app/widgets/login/home/routine.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<List>? routines;

  Future<void> getRoutine() async {
    Response res = await Dio().get("http://localhost:8080/testRoutine");
    try {
      if (res.statusCode == 200) {
        // print("RES DATA: ${res.data}");
        setState(() {
          // routines = List<String>.from(res.data["routines"]);
          routines = res.data;
        });
      }
    } catch (e) {
      print("Error fetching routines: $e");
    }
  }

  @override
  void initState() {
    getRoutine();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("ROUTINES: $routines");
    return GestureDetector(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFB4B4B4),
          elevation: 2.0,
          title: const FontInika(
            content: "username",
            isBold: true,
          ),
        ),
        body: Center(
          child: Stack(
            fit: StackFit.expand,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    height: 360,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.red,
                        width: 2,
                      ),
                    ),
                    child: const Text(
                      "chart",
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    height: 58,
                    padding: const EdgeInsets.only(
                      left: 20,
                    ),
                    decoration: const BoxDecoration(
                      color: Color(0xFFB4B4B4),
                    ),
                    child: const FontInika(
                      content: "routine",
                      isBold: true,
                    ),
                  ),
                  // FutureBuilder(
                  //   future: routines,
                  //   builder: (context, snapshot) {
                  //     if (snapshot.hasData) {
                  //       return ListView.builder(
                  //         itemBuilder: (context, index) {
                  //           return const Text("ListView");
                  //         },
                  //       );
                  //     } else {
                  //       return const Text("error!!");
                  //     }
                  //   },
                  // ),
                  const Routine(content: "Mon Routine"),
                ],
              ),
              const Positioned(
                bottom: 30,
                right: 30,
                child: Text("menu"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
