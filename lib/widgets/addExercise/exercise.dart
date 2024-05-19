import 'package:flutter/material.dart';
import 'package:workout_app/common/color.dart';

class Exercise extends StatelessWidget {
  final String title;
  final String description;
  final bool isEdit;
  final int id;

  const Exercise({
    super.key,
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
        title: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
          ),
          child: Row(
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
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(title),
                  Text(description),
                ],
              ),
            ],
          ),
        ),
        trailing: isEdit
            ? IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.delete,
                ),
              )
            : null,
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