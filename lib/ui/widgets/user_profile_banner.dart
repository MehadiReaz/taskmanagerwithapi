import 'package:flutter/material.dart';
import 'package:taskmanagerwithapi/data/model/auth_utility.dart';
import 'package:taskmanagerwithapi/ui/screens/auth/login_screen.dart';

class UserProfileBanner extends StatelessWidget {
  UserProfileBanner({
    super.key,
  });
  void userLogout() {
    AuthUtility.clearUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.green,
      child: Row(
        children: [
          Expanded(
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
              tileColor: Colors.green,
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                  AuthUtility.userInfo.data?.photo ?? '',
                ),
                radius: 15,
                onBackgroundImageError: (_, __) => Icon(Icons.image),
              ),
              title: Text(
                '${AuthUtility.userInfo.data?.firstName} ${AuthUtility.userInfo.data?.lastName}',
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
              subtitle: Text(
                AuthUtility.userInfo.data?.email ?? '',
                style: TextStyle(fontSize: 12, color: Colors.white),
              ),
            ),
          ),
          IconButton(
              onPressed: () {
                userLogout();
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => LoginScreen()),
                    (route) => false);
              },
              icon: Icon(Icons.logout))
        ],
      ),
    );
  }
}
