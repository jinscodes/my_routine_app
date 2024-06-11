import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workout_app/common/color.dart';
import 'package:workout_app/provider/work_provider.dart';
import 'package:workout_app/utilities/stringToExerciseType.dart';

class Exercise extends StatefulWidget {
  final bool isEdit;
  final int index;
  final Function navigateToEdit;

  const Exercise({
    super.key,
    required this.isEdit,
    required this.index,
    required this.navigateToEdit,
  });

  @override
  State<Exercise> createState() => _ExerciseState();
}

class _ExerciseState extends State<Exercise> {
  late int index;
  late bool isEdit;
  late Function navigateToEdit;

  @override
  void initState() {
    super.initState();

    index = widget.index;
    isEdit = widget.isEdit;
    navigateToEdit = widget.navigateToEdit;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ExerciseProvider>(
      builder: (context, provider, child) {
        ExerciseType? exerciseType = stringToExerciseType(
            provider.list[index]["type"].toString().toLowerCase());
        String title = provider.list[index]["name"];
        String description = provider.list[index]["description"];
        int id = provider.list[index]["id"];

        Future<void> deleteItemCallback(index, id) {
          return showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                title: const SizedBox(
                  height: 50,
                  child: Center(
                    child: Text(
                      "Delete",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                content: const Text(
                  "Are you sure you want to delete this item?",
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text("Cancel"),
                  ),
                  TextButton(
                    onPressed: () {
                      provider.deleteItem(index, id);
                      Navigator.of(context).pop();
                    },
                    child: const Text("Yes"),
                  ),
                ],
              );
            },
          );
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
                    onPressed: () => navigateToEdit(),
                    icon: const Icon(
                      Icons.edit,
                    ),
                  )
                : IconButton(
                    onPressed: () => deleteItemCallback(index, id),
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
                      exerciseType == ExerciseType.count ? "C" : "T",
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
                    description.isNotEmpty
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                title,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                description,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: ColorTheme.darkgray,
                                ),
                              ),
                            ],
                          )
                        : Text(
                            title,
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
      },
    );
  }
}
