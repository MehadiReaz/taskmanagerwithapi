import 'package:flutter/material.dart';

import '../../widgets/TaskListTile.dart';
import '../../widgets/user_profile_banner.dart';

class InProgressTaskScreen extends StatelessWidget {
  const InProgressTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          UserProfileBanner(),
          Expanded(
              child: ListView.builder(
                  itemCount: 20,
                  itemBuilder: (context, index) => const TaskListTile()))
        ],
      )),
    );
  }
}
