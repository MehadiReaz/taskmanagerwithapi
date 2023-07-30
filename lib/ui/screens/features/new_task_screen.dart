import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taskmanagerwithapi/ui/screens/features/add_new_task_screen.dart';

import '../../widgets/TaskListTile.dart';
import '../../widgets/summary_card.dart';
import '../../widgets/user_profile_banner.dart';

class NewTaskScreen extends StatelessWidget {
  const NewTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          UserProfileBanner(),
          const Row(
            children: [
              Expanded(
                child: SummaryCard(
                  number: 123,
                  title: 'New',
                ),
              ),
              Expanded(
                child: SummaryCard(
                  number: 123,
                  title: 'Progress',
                ),
              ),
              Expanded(
                child: SummaryCard(
                  number: 123,
                  title: 'Cancled',
                ),
              ),
              Expanded(
                child: SummaryCard(
                  number: 123,
                  title: 'Completed',
                ),
              ),
            ],
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: 20,
                  itemBuilder: (context, index) => const TaskListTile()))
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => AddNewTaskScreen()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
