import 'package:flutter/material.dart';
import 'package:taskmanagerwithapi/ui/screens/features/cancelled_task_screen.dart';
import 'package:taskmanagerwithapi/ui/screens/features/completed_task_screen.dart';
import 'package:taskmanagerwithapi/ui/screens/features/in_progress_task_screen.dart';
import 'package:taskmanagerwithapi/ui/screens/features/new_task_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final PageController pageController = PageController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: const [
          NewTaskScreen(),
          InProgressTaskScreen(),
          CancelledTaskScreen(),
          CompletedTaskScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: onTapped,
        selectedItemColor: Colors.green, // Set the selected item color to black
        unselectedItemColor: Colors.grey, // Set the inactive item color to grey
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'New',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_tree),
            label: 'In Progress',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cancel_outlined),
            label: 'Cancel',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.done_all),
            label: 'Completed',
          ),
        ],
      ),
    );
  }

  void onTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    pageController.jumpToPage(index);
  }
}
