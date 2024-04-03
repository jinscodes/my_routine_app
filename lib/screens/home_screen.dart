import 'package:flutter/material.dart';
import 'package:workout_app/common/color.dart';
import 'package:workout_app/screens/login_screen.dart';
import 'package:workout_app/utilities/manageLoginToken.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  logout() {
    removeLoginToken("login_token");

    return Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: MediaQuery.of(context).size.width,
        leading: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 25,
          ),
          child: Row(
            children: [
              Flexible(
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                          side: BorderSide(
                            color: ColorTheme.gray.withOpacity(0.4),
                            width: 2,
                          ),
                        ),
                      ),
                      child: const Icon(
                        Icons.calendar_month_outlined,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              Flexible(
                child: Container(
                  alignment: Alignment.centerRight,
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                      color: Colors.yellow,
                    ),
                    child: const Icon(
                      Icons.logout_outlined,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                logout();
              },
              child: const Text("LOGOUT"),
            ),
          ],
        ),
      ),
    );
  }
}
