import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taskmanagerwithapi/data/model/network_response.dart';
import 'package:taskmanagerwithapi/data/services/network_caller.dart';
import 'package:taskmanagerwithapi/ui/widgets/background_screen.dart';
import 'package:taskmanagerwithapi/ui/widgets/user_profile_banner.dart';

import '../../../data/utils/urls.dart';

class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({super.key});

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _discriptionController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _addNewTaskInProgress = false;
  Future<void> addNewTask() async {
    if (mounted) {
      setState(() {
        _addNewTaskInProgress = true;
      });
    }
    final NetworkResponse response =
        await NetworkCaller().postRequest(Urls.createTask, <String, dynamic>{
      "title": _titleController.text.trim(),
      "description": _discriptionController.text.trim(),
      "status": "New"
    });
    if (response.isSuccess) {
      _titleController.clear();
      _discriptionController.clear();
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Task Added Successfully')));
      }
    } else
      (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Task Added Successfully')));
      };
  }

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
                child: Form(
                  key: _formKey,
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
                        validator: (String? value) {
                          if (value?.isEmpty ?? true) {
                            return 'Enter Task Title';
                          }
                        },
                        controller: _titleController,
                        decoration: InputDecoration(hintText: 'Title'),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        validator: (String? value) {
                          if (value?.isEmpty ?? true) {
                            return 'Enter Task Title';
                          }
                        },
                        controller: _discriptionController,
                        decoration: InputDecoration(
                          hintText: 'Discription',
                        ),
                        maxLines: 4,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () {
                              if (!_formKey.currentState!.validate()) {
                                return;
                              }
                              addNewTask();
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (_) => const BottomNavBar()));
                            },
                            child:
                                const Icon(CupertinoIcons.greaterthan_circle)),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      )),
    );
  }
}
