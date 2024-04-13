import 'package:flutter/material.dart';
import 'package:workout_app/common/color.dart';
import 'package:workout_app/screens/add_exercise_outline_screen.dart';

class AddContainer extends StatefulWidget {
  const AddContainer({super.key});

  @override
  State<AddContainer> createState() => _AddContainerState();
}

class _AddContainerState extends State<AddContainer> {
  late List list;

  void _navigateToAddWorkScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AddExerciseOutlineScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: ElevatedButton(
            onPressed: () {
              _navigateToAddWorkScreen();
            },
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
              print("Add Routine");
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
