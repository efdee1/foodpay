// ignore: file_names
// ignore: file_names
// ignore: file_names
import 'package:flutter/material.dart';
import 'package:foodlocker/UI/commonWidgets/main_button.dart';
import 'package:foodlocker/UI/sign_in_ui/register_ui_auth.dart';
import 'package:foodlocker/UI/sign_in_ui/sign_in_auth_ui.dart';


class SignInScreen extends StatelessWidget {
  const SignInScreen({ Key? key }) : super(key: key);
 

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return  Scaffold(
    
    body: Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        width: width,
        height: height,
        child: SafeArea(
          child: Column(
            children: [
              const Text('Foodlocker',style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize:40
              ),),
              SizedBox(height: height*0.45,),
              const Text('The foodlocker App',style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize:24
              ),),
              SizedBox(height: height*0.009,),
              const Text('your satisfaction is our priority',
             
              ),
              SizedBox(height: height*0.02,),
              
              GestureDetector(
                 onTap: (){
                  Navigator.push(
    context,
    MaterialPageRoute(
    	builder: (context) => SignInAuthScreen()),
  );
                 },
      child: Container(
        padding: EdgeInsets.fromLTRB(16, 15, 16, 15),
        decoration: BoxDecoration(
          color: Colors.greenAccent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Sign In',
                maxLines: 1,
                style: TextStyle(
                    color: Colors.white,
                    
                    fontWeight: FontWeight.w600,
                    fontSize: 24)),
                     ],
                    ),
      ),
              ),
              SizedBox(height: height*0.02),
               GestureDetector(
                
                  onTap: (){
                  
                   Navigator.push(
    context,
    MaterialPageRoute(
    	builder: (context) => RegisterScreen()),
  );
                  },
      child: Container(
        padding: EdgeInsets.fromLTRB(16, 15, 16, 15),
        decoration: BoxDecoration(
          color: Colors.greenAccent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('create account',
                maxLines: 1,
                style: TextStyle(
                    color: Colors.white,
                    
                    fontWeight: FontWeight.w600,
                    fontSize: 24)),
                     ],
                    ),
      ),
              
               ),
            ],
            
          ),
          
          ),
      ),
        
    ),
    );
  }
} 