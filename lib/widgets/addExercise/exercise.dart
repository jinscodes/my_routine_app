import 'package:flutter/material.dart';
import 'package:workout_app/common/color.dart';
import 'package:workout_app/utilities/stringToExerciseType.dart';

class Exercise extends StatelessWidget {
  final ExerciseType? exerciseType;
  final String type;
  final String title;
  final String description;
  final bool isEdit;
  final int id;

  const Exercise({
    super.key,
    required this.exerciseType,
    required this.type,
    required this.title,
    required this.description,
    required this.isEdit,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
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
  }
}

// Container(
//       width: MediaQuery.of(context).size.width,
//       height: 75,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.symmetric(
//           horizontal: 16,
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Row(
//               children: [
//                 Container(
//                   width: 40,
//                   height: 40,
//                   decoration: BoxDecoration(
//                     border: Border.all(
//                       color: ColorTheme.gray,
//                     ),
//                     borderRadius: BorderRadius.circular(100),
//                   ),
//                   child: const Center(
//                     child: Text(
//                       "C",
//                       style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(
//                   width: 16,
//                 ),
//                 description.isNotEmpty
//                     ? Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             title,
//                             style: const TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.w700,
//                             ),
//                           ),
//                           Text(
//                             description,
//                             style: const TextStyle(
//                               fontSize: 14,
//                               fontWeight: FontWeight.w500,
//                               color: ColorTheme.darkgray,
//                             ),
//                           ),
//                         ],
//                       )
//                     : Text(
//                         title,
//                         style: const TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.w700,
//                         ),
//                       ),
//               ],
//             ),
//             isEdit
//                 ? AppbarIconButton(
//                     handleClick: () {
//                       print("Edit");
//                       deleteItem();
//                     },
//                     icon: Icons.edit,
//                   )
//                 : const Text(""),
//           ],
//         ),
//       ),
//     );
