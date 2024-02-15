import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  late Future<dynamic> _datas;

  Future getDatas() async {
    var res = await Dio().get('http://localhost:8080/test');

    String id = res.data["id"];
    String title = res.data["title"];
    List routines = res.data["routines"];

    return {
      "id": id,
      "title": title,
      "routines": routines,
    };
  }

  @override
  void initState() {
    _datas = getDatas();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("data"),
            FutureBuilder(
                future: _datas,
                builder: (context, snapshot) {
                  String? id;
                  String? title;
                  String? routines;

                  _datas.then(
                    (value) => {
                      id = value["id"],
                      title = value["title"],
                      routines = value["routines"],
                    },
                  );

                  if (id != null && title != null && routines != null) {
                    print(id);
                    print(title);
                    print(routines);
                  }

                  return const Text("data");
                })
          ],
        ),
      ),
    );
  }
}
