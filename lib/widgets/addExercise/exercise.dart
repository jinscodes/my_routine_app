import 'package:flutter/material.dart';
import 'package:workout_app/common/color.dart';
import 'package:workout_app/screens/edit_exercise_screen.dart';
import 'package:workout_app/utilities/navigate.dart';
import 'package:workout_app/utilities/stringToExerciseType.dart';

class Exercise extends StatefulWidget {
  final ExerciseType? exerciseType;
  final String type;
  final String title;
  final String description;
  final bool isEdit;
  final int id;
  final Function deleteItem;

  const Exercise({
    super.key,
    required this.exerciseType,
    required this.type,
    required this.title,
    required this.description,
    required this.isEdit,
    required this.id,
    required this.deleteItem,
  });

  @override
  State<Exercise> createState() => _ExerciseState();
}

class _ExerciseState extends State<Exercise> {
  @override
  Widget build(BuildContext context) {
    void NavigateToEditScreen() {
      Navigate(
        context: context,
        materialPageRoute: MaterialPageRoute(
          builder: (context) => const EditExerciseScreen(),
        ),
      ).navigatePushScreen();
    }

    return Container(
      height: 75,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16.0,
        ),
        minVerticalPadding: 0.0,
        trailing: widget.isEdit
            ? IconButton(
                onPressed: () {
                  print("edit");
                  NavigateToEditScreen();
                },
                icon: const Icon(
                  Icons.edit,
                ),
              )
            : IconButton(
                onPressed: () => widget.deleteItem(),
                icon: const Icon(
                  Icons.delete,
                ),
              ),
        title: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                border: Border.all(
                  color: ColorTheme.gray,
                ),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: Text(
                  widget.exerciseType == ExerciseType.count ? "C" : "T",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: ColorTheme.softBlack,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                widget.description.isNotEmpty
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.title,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            widget.description,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: ColorTheme.darkgray,
                            ),
                          ),
                        ],
                      )
                    : Text(
                        widget.title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
