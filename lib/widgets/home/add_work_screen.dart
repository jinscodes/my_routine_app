import 'package:flutter/material.dart';

class AddWorkScreen extends StatelessWidget {
  const AddWorkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leadingWidth: MediaQuery.of(context).size.width,
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.add,
              ),
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text("ADD WORK SCREEN"),
      ),
    );
  }
}
