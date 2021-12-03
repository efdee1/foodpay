import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:foodlocker/ViewModel/auth_view_model.dart';
import 'package:foodlocker/ViewModel/auth_view_model.dart';
import 'package:foodlocker/ViewModel/auth_view_model.dart';
import 'package:foodlocker/Views/Home.dart';
import 'package:foodlocker/Views/bottom_nav.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
class SignInAuthScreen extends StatelessWidget {
  const SignInAuthScreen({ Key? key }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _key = GlobalKey<FormState>();
    final height= MediaQuery.of(context).size.height;
    final width= MediaQuery.of(context).size.width;
    final TextEditingController emailController= TextEditingController();
    final TextEditingController passwordController= TextEditingController();

    final authService = Provider.of<AuthService>(context);
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            height: height,
            width: width,
            child: SafeArea(  
              child:Column(children: [
                SizedBox(height: height*0.08,),
                Text('Sign In',
                style: TextStyle(
                  fontSize: 45,
                ),
                ),
                SizedBox(height: height*0.035,),
                Container(
                  child: MyCustomForm(),
                  ),
                  SizedBox(height: height*0.02,),






                // Container(
                  //  child: ElevatedButton(onPressed: ()async{
                  //    await authService.createUserWithEmailAndPassword(
                  //      emailController.text, passwordController.text);
                  //       Navigator.pushNamed(context, '/HomeView');
                  //  },
                  //
                  //
                  //  child: Text('SignUp'),)
                  // )
                ],
              ),
            ),
                ),
              )              
              ),
              
            );
          
          
  }

}

//  alignment: Alignment.center,
//                     child: GestureDetector(
//                         onTap: (){
//                         authService.signInWithEmailAndPassword(emailController.text, passwordController.text);
                   
//                  Navigator.push(
//     context,
//     MaterialPageRoute(
//     	builder: (context) => HomeView()),
//   );
//                       },
//           child: Container(
//             padding: EdgeInsets.fromLTRB(16, 15, 16, 15),
//             decoration: BoxDecoration(
//               color: Colors.greenAccent,
//               borderRadius: BorderRadius.circular(10),
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Text('Sign In',
//                     maxLines: 1,
//                     style: TextStyle(
//                         color: Colors.white,
                        
//                         fontWeight: FontWeight.w600,
//                         fontSize: 24)),
//                          ],
//                         ),
//           ),

//                     ),



// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  bool isHidden = true;
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
     final TextEditingController emailController= TextEditingController();
    final TextEditingController passwordController= TextEditingController();
    final height= MediaQuery.of(context).size.height;
    final width= MediaQuery.of(context).size.width;
    // Build a Form widget using the _formKey created above.

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            validator: (  value){
              if (value == null || value.isEmpty) {
                return "email cannot be empty";
              } else {
                return null;
              }
            },
            onChanged: (value) {
              setState(() {
                email = value;
              });
            },
            decoration: InputDecoration(
              labelText: 'Email',
              hintText: 'Email',
              border: OutlineInputBorder()
            ),

          ),
          SizedBox(height: height*0.01,),
          
          TextFormField(
                      obscureText: isHidden,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (  value){
              if (value == null || value.isEmpty) {
                return "password cannot be empty";
              } else {
                return null;
              }
            },
            onChanged: (value) {
              setState(() {
                password = value;
              });
            },
                      decoration:InputDecoration(
                        labelText: 'Password',
                        hintText: 'Password',
                         border: OutlineInputBorder(),
                        suffixIcon: IconButton(onPressed: (){
                          setState(() {
                            isHidden = ! isHidden;
                          });
                        },
                         icon: Icon(isHidden?Icons.visibility:Icons.visibility_off),
                         ),

                        //errorText: _numberError,
                      ) ,
          ),
          SizedBox(height: height*0.01,),
          GestureDetector(
            onTap: ()async{
              if(_formKey.currentState!.validate()){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BottomNavView()),
                );
                // Navigator.pushReplacementNamed(context,'/BottomNavView');
                // print(name);
                // print(email);
                // print(password);
                // print(passwordtwo);
                // print(country);
                // print(phonenumber);
                try{ http.Response response = await http.post(
                  Uri.parse('https://v2.foodlocker.com.ng/apiv1/action=login'),
                  headers: <String, String>{
                    'Content-Type': 'application/json; charset=UTF-8',
                  },
                  body: jsonEncode(<String, String>{
                    // 'name': name.toString(),
                    // 'email': email.toString(),
                    // 'phone': phonenumber.toString(),
                    // 'country': country.toString(),
                    // 'password': password.toString(),
                    // 'passwordtwo': passwordtwo.toString(),
                  }),
                );
                print(response.body);}catch(e){print('errorrrrrr');}
              }
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
          )
        ],
      ),
    );
  }
  
}