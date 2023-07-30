import 'package:flutter/material.dart';

class UserProfileBanner extends StatelessWidget {
  const UserProfileBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.green,
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
        tileColor: Colors.green,
        leading: CircleAvatar(
          backgroundImage: NetworkImage(
              'http://www.singaporebusinesscentre.com.sg/wp-content/uploads/2016/12/singapore-business-centre-team-placeholder-t2.png'),
          radius: 15,
        ),
        title: Text(
          'User Name',
          style: TextStyle(fontSize: 14, color: Colors.white),
        ),
        subtitle: Text(
          'Email Address',
          style: TextStyle(fontSize: 12, color: Colors.white),
        ),
      ),
    );
  }
}
