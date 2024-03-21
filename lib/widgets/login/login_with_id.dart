import 'package:flutter/material.dart';
import 'package:workout_app/common/color.dart';

class LoginWithId extends StatefulWidget {
  const LoginWithId({super.key});

  @override
  State<LoginWithId> createState() => _LoginWithIdState();
}

class _LoginWithIdState extends State<LoginWithId> {
  TextEditingController idController = TextEditingController();
  TextEditingController pwController = TextEditingController();
  bool isText = false;

  void handleChange(String word) {
    if (word.isNotEmpty) {
      setState(() {
        isText = true;
      });
    } else {
      setState(() {
        isText = false;
      });
    }
  }

  void resetText(TextEditingController controller) {
    controller.clear();
    setState(() {
      isText = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    print("idC0: ${idController.text}");
    print("pwC0: ${pwController.text}");
    print("isEmpty: $isText");

    @override
    void dispose() {
      idController.dispose();
      pwController.dispose();
      super.dispose();
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 2.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {},
          style: IconButton.styleFrom(),
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        title: const Text(
          "Continue with ID & PW",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 230, 232, 237),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 0, 30, 30),
          child: Center(
            child: Column(
              children: [
                Flexible(
                  flex: 4,
                  child: Container(
                    alignment: Alignment.topCenter,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 25,
                        ),
                        const Text(
                          "ID",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextField(
                          controller: idController,
                          onChanged: (value) {
                            handleChange(value);
                          },
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                          decoration: InputDecoration(
                            suffixIcon: idController.text.isEmpty
                                ? null
                                : IconButton(
                                    onPressed: () {
                                      resetText(idController);
                                    },
                                    icon: const Icon(
                                      Icons.cancel_rounded,
                                      color: ColorTheme.gray,
                                    ),
                                  ),
                            hintText: "Enter your id",
                            hintStyle: const TextStyle(
                              color: ColorTheme.gray,
                              fontSize: 20,
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: ColorTheme.gray.withOpacity(0.6),
                                width: 3,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: ColorTheme.green.withOpacity(0.5),
                                width: 5,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "PASSWORD",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextField(
                          controller: pwController,
                          onChanged: (value) {
                            handleChange(value);
                          },
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                          decoration: InputDecoration(
                            suffixIcon: pwController.text.isEmpty
                                ? null
                                : IconButton(
                                    onPressed: () {
                                      resetText(pwController);
                                    },
                                    icon: const Icon(
                                      Icons.cancel_rounded,
                                      color: ColorTheme.gray,
                                    ),
                                  ),
                            hintText: "Enter your pw",
                            hintStyle: const TextStyle(
                              color: ColorTheme.gray,
                              fontSize: 20,
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: ColorTheme.gray.withOpacity(0.6),
                                width: 3,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: ColorTheme.green.withOpacity(0.5),
                                width: 5,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Don't have account? Let's create!",
                            style: TextStyle(
                              color: ColorTheme.mainBlue,
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(
                              MediaQuery.of(context).size.width,
                              60,
                            ),
                            backgroundColor: ColorTheme.mainBlue,
                          ),
                          onPressed: () {
                            print("idC: ${idController.text}");
                            print("pwC: ${pwController.text}");
                          },
                          child: const Text(
                            "Next",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
