import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taskmanagerwithapi/ui/widgets/background_screen.dart';
import 'package:taskmanagerwithapi/ui/widgets/user_profile_banner.dart';

class AddNewTaskScreen extends StatelessWidget {
  const AddNewTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          ScreenBackground(),
          Column(
            children: [
              UserProfileBanner(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      'Add New Task',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      decoration: InputDecoration(hintText: 'Title'),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Discription',
                      ),
                      maxLines: 4,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (_) => const BottomNavBar()));
                          },
                          child: const Icon(CupertinoIcons.greaterthan_circle)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      )),
    );
  }
}
