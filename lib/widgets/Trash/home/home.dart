import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:workout_app/styles/font_inika.dart';
import 'package:workout_app/widgets/Trash/home/routine.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List<dynamic>> _routines;

  Future<List<dynamic>> getRoutines() async {
    Response res = await Dio().get("http://localhost:8080/testRoutine");

    return res.data["routines"];
  }

  @override
  void initState() {
    super.initState();
    _routines = getRoutines();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                FutureBuilder<List<dynamic>>(
                  future: _routines,
                  builder: (context, snapshot) {
                    final List<dynamic>? routines = snapshot.data;

                    if (snapshot.connectionState != ConnectionState.done) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    }

                    if (routines != null) {
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: routines.length,
                        itemBuilder: (context, idx) {
                          print(snapshot.data![idx]);
                          return Text("ROUTINE2: ${snapshot.data![idx]}");
                        },
                      );
                    } else {
                      return const Text("error!!");
                    }
                  },
                ),
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
    );
  }
}
