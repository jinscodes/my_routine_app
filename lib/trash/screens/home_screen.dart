import 'package:flutter/material.dart';
import 'package:workout_app/trash/common/appbar_icon_button.dart';
import 'package:workout_app/trash/common/color.dart';
import 'package:workout_app/trash/utilities/manageLoginToken.dart';
import 'package:workout_app/trash/utilities/navigate.dart';
import 'package:workout_app/trash/widgets/home/add_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? username;

  @override
  void initState() {
    super.initState();
    getName();
    print(username);
  }

  Future<void> getName() async {
    String? loginToken = await getLoginToken();

    setState(() {
      username = loginToken;
    });
  }

  void logout() {
    removeLoginToken("login_token");

    NavigateTo(
      context: context,
    ).toLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        leadingWidth: MediaQuery.of(context).size.width,
        scrolledUnderElevation: 0,
        leading: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 25,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: AppbarIconButton(
                  handleClick: () => print("Calendar"),
                  icon: Icons.calendar_month_outlined,
                ),
              ),
              Flexible(
                child: AppbarIconButton(
                  handleClick: () => logout(),
                  icon: Icons.logout_outlined,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Flexible(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.green,
                ),
                child: User(
                  username: username,
                ),
              ),
            ),
            Flexible(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(25, 20, 25, 20),
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 78,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFF4A53FF),
                            Color(0xFF2029FF),
                          ],
                        ),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 18,
                          ),
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: const Center(
                              child: Text("%25"),
                            ),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Your daily goals almost done! 🔥",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "1 of 4 completed",
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.8),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    const AddContainer(),
                    const SizedBox(
                      height: 25,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height / 2.4,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                        ),
                      ),
                      child: ListView.builder(
                        itemCount: ["1", "2", "3", "4"].length,
                        itemBuilder: (context, idx) {
                          return Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Colors.amber,
                              border: Border.all(
                                width: 1,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    // SizedBox(
                    //   height: MediaQuery.of(context).size.height / 2.4,
                    //   child: SingleChildScrollView(
                    //     child: Column(
                    //       mainAxisSize: MainAxisSize.min,
                    //       children: [
                    //         Container(
                    //           width: MediaQuery.of(context).size.width,
                    //           height: 150,
                    //           decoration: const BoxDecoration(
                    //             color: Colors.green,
                    //           ),
                    //           child: const Text("data"),
                    //         ),
                    //         Container(
                    //           width: MediaQuery.of(context).size.width,
                    //           height: 150,
                    //           decoration: const BoxDecoration(
                    //             color: Colors.yellow,
                    //           ),
                    //           child: const Text("data"),
                    //         ),
                    //         Container(
                    //           width: MediaQuery.of(context).size.width,
                    //           height: 150,
                    //           decoration: const BoxDecoration(
                    //             color: Colors.blue,
                    //           ),
                    //           child: const Text("data"),
                    //         ),
                    //         Container(
                    //           width: MediaQuery.of(context).size.width,
                    //           height: 150,
                    //           decoration: const BoxDecoration(
                    //             color: Colors.red,
                    //           ),
                    //           child: const Text("data"),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class User extends StatelessWidget {
  final String? username;

  const User({
    super.key,
    required this.username,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Name
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 25,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hi, ${username?.substring(0, 10)} 👋🏻",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Let's make habits together!",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    color: ColorTheme.infoBlue.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: const Center(
                    child: Text(
                      "😎",
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
