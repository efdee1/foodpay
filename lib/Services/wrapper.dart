import 'package:flutter/material.dart';
import 'package:foodlocker/Services/user_model.dart';
import 'package:foodlocker/UI/sign_In.dart';
import 'package:foodlocker/UI/sign_in_ui/sign_in_auth_ui.dart';
import 'package:foodlocker/ViewModel/auth_view_model.dart';
import 'package:foodlocker/ViewModel/auth_view_model.dart';
import 'package:foodlocker/Views/Home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return StreamBuilder<User?>(
      stream: authService.user,
      builder: (_, AsyncSnapshot<User?> snapshot){
        if(snapshot.connectionState==ConnectionState.active){
          final User? user = snapshot.data;
          return user == null ?SignInScreen () : HomeView();
        }else{
          return Scaffold(
            body: Center(child: CircularProgressIndicator(),),
          );
        }
      });
  }
}