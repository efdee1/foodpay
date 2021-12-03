import 'package:flutter/material.dart';
import 'package:foodlocker/Views/ProfileViews/profile_body.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body:SingleChildScrollView(
        child: Container(
          child: SafeArea(
            child: Column(
              children: [
                SizedBox(height: 15,),
                Text('Profile'),
                Container(
                  child: ProfileBody(),
                ),
              ],
            ),
          ),
        ),
      ) ,
    );
  }
}
