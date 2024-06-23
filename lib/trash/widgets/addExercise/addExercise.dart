// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:workout_app/trash/common/color.dart';
import 'package:workout_app/trash/common/login_text_field.dart';
import 'package:workout_app/trash/common/next_button.dart';
import 'package:workout_app/trash/utilities/api.dart';
import 'package:workout_app/trash/utilities/complete_page.dart';
import 'package:workout_app/trash/utilities/navigate.dart';
import 'package:workout_app/trash/utilities/snackbar.dart';

enum TypeCharacter {
  count,
  time,
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
  TypeCharacter? _type = TypeCharacter.count;
  bool isText = false;
  bool isError = false;

  postExerciseValidation() async {
    String type;
    switch (_type!) {
      case TypeCharacter.count:
        type = "COUNT";
      case TypeCharacter.time:
        type = "TIME";
    }

    try {
      String res = await PostApi(
        apiUrl: "/workout",
        body: {
          "name": nameController.text,
          "type": type,
          "description": descriptionController.text,
        },
      ).postData();

      if (res.isNotEmpty) {
        Navigate(
          context: context,
          builder: (_) => CompletePage(
            navigator: () => NavigateTo(context: context).toExerciseOutline(),
          ),
        ).push();
      }
    } catch (e) {
      // ignore: avoid_print
      print("ERR: $e");

      return Snackbar(
        type: SnackbarType.error,
        context: context,
        content: "Adding exercise failed 🥲",
      ).showSnackBar();
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    typeController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Navigate(context: context).pop(),
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
                          type: "",
                        ),
                        const SizedBox(
                          height: 20,
                        ),
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
                                  color: _type == "COUNT"
                                      ? ColorTheme.mainBlue
                                      : ColorTheme.gray,
                                ),
                              ),
                              child: RadioListTile(
                                title: const Text("COUNT"),
                                value: TypeCharacter.count,
                                groupValue: _type,
                                fillColor: MaterialStateColor.resolveWith(
                                  (states) =>
                                      ColorTheme.mainBlue.withOpacity(0.7),
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    _type = value;
                                  });
                                },
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
                              child: RadioListTile(
                                title: const Text("TIME"),
                                value: TypeCharacter.time,
                                groupValue: _type,
                                fillColor: MaterialStateColor.resolveWith(
                                  (states) =>
                                      ColorTheme.mainBlue.withOpacity(0.7),
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    _type = value;
                                  });
                                },
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
                          type: "",
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
                        NextButton(
                          content: "Next",
                          handlePressed: () => postExerciseValidation(),
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
