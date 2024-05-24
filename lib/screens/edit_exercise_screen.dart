// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:workout_app/common/color.dart';
import 'package:workout_app/common/login_text_field.dart';
import 'package:workout_app/common/next_button.dart';
import 'package:workout_app/screens/add_exercise_outline_screen.dart';
import 'package:workout_app/utilities/api.dart';
import 'package:workout_app/utilities/complete_page.dart';
import 'package:workout_app/utilities/navigate.dart';
import 'package:workout_app/utilities/snackbar.dart';
import 'package:workout_app/utilities/stringToExerciseType.dart';
import 'package:workout_app/widgets/addExercise/addExercise.dart';

class EditExerciseScreen extends StatefulWidget {
  final ExerciseType? exerciseType;
  final String title;
  final String description;
  final int id;

  const EditExerciseScreen({
    super.key,
    this.exerciseType,
    required this.title,
    required this.description,
    required this.id,
  });

  @override
  State<EditExerciseScreen> createState() => _EditExerciseScreenState();
}

class _EditExerciseScreenState extends State<EditExerciseScreen> {
  late int id;
  late TextEditingController nameController;
  late TextEditingController typeController;
  late TextEditingController descriptionController;
  late TypeCharacter? _type;
  bool isError = false;

  @override
  void initState() {
    super.initState();
    id = widget.id;
    if (widget.exerciseType == ExerciseType.count) {
      _type = TypeCharacter.count;
    } else if (widget.exerciseType == ExerciseType.time) {
      _type = TypeCharacter.time;
    }
    nameController = TextEditingController(text: widget.title);
    typeController = TextEditingController();
    descriptionController = TextEditingController(text: widget.description);
  }

  patchExerciseValidation() async {
    String type;
    switch (_type!) {
      case TypeCharacter.count:
        type = "COUNT";
      case TypeCharacter.time:
        type = "TIME";
    }

    print("$type; ${nameController.text}; ${descriptionController.text};");

    try {
      String res = await PatchApi(
        apiUrl: "/workout",
        body: {
          "name": nameController.text,
          "type": type,
          "description": descriptionController.text,
        },
      ).patchData();

      if (res.isNotEmpty) {
        Navigate(
          context: context,
          builder: (_) => CompletePage(
            navigator: _navigateToHome,
            buttonTitle: 'Done',
          ),
        ).navigatePushScreen();
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

  void _navigateToHome() {
    Navigate(
      context: context,
      builder: (_) => const AddExerciseOutlineScreen(),
    ).navigateReplacementScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Navigate(context: context).navigatePopScreen(),
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
                                  color: _type == TypeCharacter.count
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
                                  color: _type == TypeCharacter.time
                                      ? ColorTheme.mainBlue
                                      : ColorTheme.gray,
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
                          handlePressed: () => patchExerciseValidation(),
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
