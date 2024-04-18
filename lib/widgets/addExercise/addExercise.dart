import 'package:flutter/material.dart';
import 'package:workout_app/common/color.dart';
import 'package:workout_app/common/login_text_field.dart';
import 'package:workout_app/common/next_button.dart';
import 'package:workout_app/utilities/api.dart';

enum TypeCharacter {
  COUNT,
  TIME,
}

class AddExercise extends StatefulWidget {
  const AddExercise({super.key});

  @override
  State<AddExercise> createState() => _AddExerciseState();
}

class _AddExerciseState extends State<AddExercise> {
  TextEditingController nameController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TypeCharacter? _type = TypeCharacter.COUNT;
  bool isText = false;
  bool isError = false;

  postExerciseValidation() async {
    try {
      PostApi(
        apiUrl: "/workout",
        body: {
          "name": nameController.text,
          "type": typeController.text,
          "description": descriptionController.text,
        },
      ).postData();
    } catch (e) {
      // ignore: avoid_print
      print("ERR: $e");
    }
  }

  void _navigateToOutlineScreen() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => _navigateToOutlineScreen(),
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        title: const Text(
          "Create Exercise",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: ColorTheme.loginBgGray,
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
                        LoginTextField(
                          controller: nameController,
                          title: "NAME",
                          isError: isError,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        // LoginTextField(
                        //   isError: isError,
                        //   controller: typeController,
                        //   title: "TYPE",
                        // ),
                        const Text(
                          "TYPE",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 2.5,
                              height: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: ColorTheme.gray,
                                ),
                              ),
                              child: ListTile(
                                title: const Text("COUNT"),
                                leading: Radio<TypeCharacter>(
                                  value: TypeCharacter.COUNT,
                                  groupValue: _type,
                                  onChanged: (value) {
                                    setState(() {
                                      _type = value;
                                    });
                                  },
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 2.5,
                              height: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: ColorTheme.gray,
                                ),
                              ),
                              child: ListTile(
                                title: const Text("TIME"),
                                leading: Radio<TypeCharacter>(
                                  value: TypeCharacter.TIME,
                                  groupValue: _type,
                                  onChanged: (value) {
                                    setState(() {
                                      _type = value;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        LoginTextField(
                          isError: isError,
                          controller: descriptionController,
                          title: "DESCRIPTION",
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
                      mainAxisAlignment: MainAxisAlignment.end,
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
                        NextButton(
                          content: "Next",
                          handlePressed: () {
                            print(
                                "${nameController.text} ${typeController.text} ${descriptionController.text}");
                            postExerciseValidation();
                          },
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