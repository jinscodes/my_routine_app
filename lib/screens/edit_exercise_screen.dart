import 'package:flutter/material.dart';
import 'package:workout_app/common/color.dart';
import 'package:workout_app/common/login_text_field.dart';
import 'package:workout_app/common/next_button.dart';
import 'package:workout_app/utilities/navigate.dart';
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
  TextEditingController nameController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TypeCharacter? _type = TypeCharacter.count;
  bool isError = false;

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
                          handlePressed: () => {},
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
