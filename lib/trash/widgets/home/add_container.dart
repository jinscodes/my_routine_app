import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workout_app/trash/common/color.dart';
import 'package:workout_app/trash/provider/work_provider.dart';
import 'package:workout_app/trash/screens/exercise_outline_screen.dart';
import 'package:workout_app/trash/screens/routine_outline_screen.dart';
import 'package:workout_app/trash/utilities/navigate.dart';

class AddContainer extends StatefulWidget {
  const AddContainer({super.key});

  @override
  State<AddContainer> createState() => _AddContainerState();
}

class _AddContainerState extends State<AddContainer> {
  late List list;

  void _navigateToExerciseOutline() {
    Navigate(
      context: context,
      builder: (context) => ChangeNotifierProvider(
        create: (_) => ExerciseProvider(),
        child: const ExerciseOutlineScreen(),
      ),
    ).push();
  }

  void _navigateToRoutineOutline() {
    Navigate(
      context: context,
      builder: (_) => const RoutineOutlineScreen(),
    ).push();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: ElevatedButton(
            onPressed: () => _navigateToExerciseOutline(),
            style: ElevatedButton.styleFrom(
              elevation: 0,
              minimumSize: Size(MediaQuery.of(context).size.width, 78),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(18),
                  bottomLeft: Radius.circular(18),
                ),
              ),
              shadowColor: Colors.transparent,
              backgroundColor: ColorTheme.infoBlue.withOpacity(0.1),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Add",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Image.asset("assets/images/dumbbell.png"),
                ],
              ),
            ),
          ),
        ),
        Container(
          width: 3,
          decoration: const BoxDecoration(
            color: ColorTheme.infoBlue,
          ),
        ),
        Flexible(
          child: ElevatedButton(
            onPressed: () {
              NavigateTo(
                context: context,
              ).toExerciseOutline();
            },
            style: ElevatedButton.styleFrom(
              elevation: 0,
              minimumSize: Size(MediaQuery.of(context).size.width, 78),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(18),
                  bottomRight: Radius.circular(18),
                ),
              ),
              shadowColor: Colors.transparent,
              backgroundColor: ColorTheme.infoBlue.withOpacity(0.1),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Add",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Image.asset("assets/images/routine.png"),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
