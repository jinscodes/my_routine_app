import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workout_app/common/appbar_icon_button.dart';
import 'package:workout_app/common/color.dart';
import 'package:workout_app/provider/work_provider.dart';
import 'package:workout_app/utilities/snackbar.dart';
import 'package:workout_app/utilities/stringToExerciseType.dart';
import 'package:workout_app/widgets/addExercise/addExercise.dart';
import 'package:workout_app/widgets/addExercise/exercise.dart';

class AddExerciseOutlineScreen extends StatefulWidget {
  const AddExerciseOutlineScreen({super.key});

  @override
  State<AddExerciseOutlineScreen> createState() =>
      _AddExerciseOutlineScreenState();
}

class _AddExerciseOutlineScreenState extends State<AddExerciseOutlineScreen> {
  bool isEdit = false;
  int length = 0;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        Provider.of<ExerciseProvider>(context, listen: false).getExerciseList();
      },
    );
  }

  void isEditState() {
    if (length == 0) {
      Snackbar(
        type: SnackbarType.warning,
        context: context,
        content: "There is no exercise. Add Exercise.",
      ).showSnackBar();
    } else {
      setState(() {
        isEdit = !isEdit;
      });
    }
  }

  void _navigateToAddExerciseScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AddExercise(),
      ),
    );
  }

  void _navigateToPreviousScreen() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTheme.mainBlue,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leadingWidth: MediaQuery.of(context).size.width,
        leading: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 25,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: AppbarIconButton(
                  handleClick: () => _navigateToPreviousScreen(),
                  icon: Icons.arrow_back_ios_new_rounded,
                ),
              ),
              Flexible(
                child: AppbarIconButton(
                  handleClick: () => isEditState(),
                  icon: isEdit ? Icons.cancel_outlined : Icons.edit,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Consumer<ExerciseProvider>(
        builder: (context, provider, child) {
          length = provider.list.length;
          return Center(
            child: Column(
              children: [
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          "🏃🏻‍♂️",
                          style: TextStyle(
                            fontSize: 50,
                          ),
                        ),
                        const Text(
                          "Best Runners!",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "Today's date",
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.9),
                          ),
                        ),
                        Text(
                          "Once you are exercising regularly, the hardest thing is to stop it. Your body can stand almost anything. He who is not courageous enough to take risks will accomplish nothing in flie.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white.withOpacity(1),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 60,
                          child: ElevatedButton(
                            onPressed: () => _navigateToAddExerciseScreen(),
                            style: ElevatedButton.styleFrom(),
                            child: const Text(
                              "+ Add Exercise",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height / 2.5,
                    width: 500,
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 25,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Tasks",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Colors.white.withOpacity(0.8),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            ListView.separated(
                              shrinkWrap: true,
                              primary: false,
                              itemCount: length,
                              separatorBuilder: (context, index) =>
                                  const SizedBox(
                                height: 15,
                              ),
                              itemBuilder: (context, index) {
                                ExerciseType? exerciseType =
                                    stringToExerciseType(provider.list[index]
                                            ["type"]
                                        .toString()
                                        .toLowerCase());
                                String title = provider.list[index]["name"];
                                String description =
                                    provider.list[index]["description"];
                                int id = provider.list[index]["id"];

                                void deleteItemCallback(index, id) {
                                  provider.deleteItem(index, id);
                                }

                                return Exercise(
                                  exerciseType: exerciseType,
                                  title: title,
                                  description: description,
                                  isEdit: isEdit,
                                  id: id,
                                  deleteItem: () =>
                                      deleteItemCallback(index, id),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
