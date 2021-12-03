import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodlocker/ViewModel/auth_view_model.dart';
import 'package:foodlocker/Views/Home.dart';
import 'package:foodlocker/Views/bottom_nav.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;


class RegisterScreen extends StatelessWidget {
  const RegisterScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
   late final GlobalKey<FormState> _key = GlobalKey<FormState>();
    final height= MediaQuery.of(context).size.height;
    final width= MediaQuery.of(context).size.width;
    final TextEditingController emailController= TextEditingController();
    final TextEditingController passwordController= TextEditingController();
    bool isHidden = true;
    final authService = Provider.of<AuthService>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Container(
          width: width,
          height: height,
          child: SafeArea(
            child:SingleChildScrollView(
              child: Column(children: [
                SizedBox(height: height*0.02,),
                Text('Sign Up',
                style: TextStyle(
                  fontSize: 45,
                ),
                ),
                SizedBox(height: height*0.1,),
                Container(
                  child:    MyCustomForm2(),
                  ),


                ],
              ),
            ),
          ),
              ),
      ),

            );
    
  }
}


// Create a Form widget.
class MyCustomForm2 extends StatefulWidget {
  const MyCustomForm2({Key? key}) : super(key: key);

  @override
  MyCustomForm2State createState() {
    return MyCustomForm2State();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomForm2State extends State<MyCustomForm2> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  bool isHidden = true;
String? name = '';
  String? password;
  String? country;
  String? email;
  String? phonenumber;
  String? passwordtwo;
  @override
  Widget build(BuildContext context) {
    final height= MediaQuery.of(context).size.height;
    final width= MediaQuery.of(context).size.width;
    
    //  final TextEditingController emailController= TextEditingController();
    // final TextEditingController passwordController= TextEditingController();
    //  final TextEditingController nameController= TextEditingController();
    //   final TextEditingController countryController= TextEditingController();
    //    final TextEditingController password2Controller= TextEditingController();
    //     final TextEditingController phonenumberController= TextEditingController();
         
    // Build a Form widget using the _formKey created above.
    
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            validator: (  value){
                          if (value == null || value.isEmpty) {
                            return "name cannot be empty";
                          } else {
                            return null;
                          }
                        },
            onChanged: (value) {
              setState(() {
                name = value;
              });
            },
              decoration: InputDecoration(
                labelText: 'Name',
                  hintText: 'paul play',
                  border: OutlineInputBorder()
                ),

          ),

          SizedBox(height: height*0.03,),
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
                  hintText: 'Email',
                          labelText: 'Email',
                          border: OutlineInputBorder()
                ),

          ),
          SizedBox(height: height*0.03,),
          TextFormField(
            keyboardType:TextInputType.phone ,
           validator: (  value){
                          if (value == null || value.isEmpty) {
                            return "phonenumber cannot be empty";
                          } else {
                            return null;
                          }
                        },
            onChanged: (value) {
              setState(() {
                phonenumber = value;
              });
            },
                        decoration: InputDecoration(
                          labelText: 'PhoneNumber',
                  hintText: 'phonenumber',
                          border: OutlineInputBorder(),
                ),

          ),
          SizedBox(height: height*0.03,),
          TextFormField(
           validator: (  value){
                          if (value == null || value.isEmpty) {
                            return "country cannot be empty";
                          } else {
                            return null;
                          }
                        },
            onChanged: (value) {
              setState(() {
                country = value;
              });
            },
              decoration: InputDecoration(
                labelText: 'Country',
                  hintText: 'country',
                border: OutlineInputBorder(),
                ),

          ),
          SizedBox(height: height*0.03,),
          TextFormField(
            obscureText: isHidden,
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
                        decoration: InputDecoration(
                          labelText: 'Password',
                  hintText: 'password',
                          border: OutlineInputBorder(),
                             suffixIcon: IconButton(onPressed: (){
                              setState(() {
                                isHidden = ! isHidden;
                                 });
                                 },
                               icon: Icon(isHidden?Icons.visibility:Icons.visibility_off),
                ),
               ),
          ),
          SizedBox(height: height*0.03,),
          TextFormField(
            obscureText: isHidden,
           validator: (  value){
                          if (value == null || value.isEmpty) {
                            return "confirmpassword cannot be empty";
                          } else {
                            return null;
                          }
                        },
            onChanged: (value) {
              setState(() {
                passwordtwo = value;
              });
            },
                        decoration: InputDecoration(
                          labelText: 'Password',
                  hintText: 'confirm password',
                          border: OutlineInputBorder(),
                          suffixIcon: IconButton(onPressed: (){
                            setState(() {
                              isHidden = ! isHidden;
                            });
                          },
                            icon: Icon(isHidden?Icons.visibility:Icons.visibility_off),
                          ),
                ),
          ),
           SizedBox(height: height*0.03,),
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
                  Uri.parse('https://v2.foodlocker.com.ng/apiv1/action=register'),
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
                  Text('Sign Up',
                      maxLines: 1,
                      style: TextStyle(
                          color: Colors.white,

                          fontWeight: FontWeight.w600,
                          fontSize: 24)),
                ],
              ),
            ),
          )




    //         Container(
    //                   child: ElevatedButton(onPressed: ()async{
    //                     Navigator.pushNamed(context,'/HomeView');
    //                     print(name);
    //                     print(email);
    //                     print(password);
    //                     print(passwordtwo);
    //                     print(country);
    //                     print(phonenumber);
    //                     try{ http.Response response = await http.post(
    //   Uri.parse('https://v2.foodlocker.com.ng/apiv1/action=register'),
    //   headers: <String, String>{
    //     'Content-Type': 'application/json; charset=UTF-8',
    //   },
    //
    //   body: jsonEncode(<String, String>{
    //     'name': name.toString(),
    //     'email': email.toString(),
    //     'phone': phonenumber.toString(),
    //     'country': country.toString(),
    //     'password': password.toString(),
    //     'passwordtwo': passwordtwo.toString(),
    //
    //   ),
    //
    // );
    // print(response.body);}catch(e){print('errorrrrrr');}
    //
    // print(respon//se.body);
    //                 },
                    //  child: Text('SignUp'),)
                    // )




          // SizedBox(height: height*0.01,),
          // TextFormField(
          //   controller: phonenumberController,
          //  validator: (  value){
          //                 if (value == null || value.isEmpty)
          //                   return "phonenumber cannot be empty";
          //                 else
          //                   return null;
          //               },
          //               style: TextStyle(
          //                 color: Colors.black,
          //                 fontSize:25,
          //               ),


          //               textAlign: TextAlign.left,
          //               autocorrect: true,
          //               maxLength: 11,
          //               keyboardType: TextInputType.phone,
          //               decoration: InputDecoration(
          //                 hintText: '08034******',
          //                 hintStyle: TextStyle(
          //                 fontSize: 18,
          //                   color: Colors.grey,
          //               ),


          //                 filled: true,
          //                 fillColor: Colors.transparent,
          //                 enabledBorder: OutlineInputBorder(
          //                   borderRadius: BorderRadius.all(Radius.circular(15.0)),
          //                   borderSide: BorderSide(color: Colors.black, width: 2),
          //                 ),
          //                 focusedBorder: OutlineInputBorder(
          //                   borderRadius: BorderRadius.all(Radius.circular(15)),
          //                   borderSide: BorderSide(color: Colors.black26,width: 2),
          //                 ),
          //               ),
          // ),
          // SizedBox(height: height*0.01,),
          // TextFormField(
          //   controller: countryController,
          //  validator: (  value){
          //                 if (value == null || value.isEmpty)
          //                   return "country cannot be empty";
          //                 else
          //                   return null;
          //               },
          //               style: TextStyle(
          //                 color: Colors.black,
          //                 fontSize:25,
          //               ),


          //               textAlign: TextAlign.left,
          //               autocorrect: true,
          //               decoration: InputDecoration(
          //                 hintText: 'country',
          //                 hintStyle: TextStyle(
          //                 fontSize: 18,
          //                   color: Colors.grey,
          //               ),


          //                 filled: true,
          //                 fillColor: Colors.transparent,
          //                 enabledBorder: OutlineInputBorder(
          //                   borderRadius: BorderRadius.all(Radius.circular(15.0)),
          //                   borderSide: BorderSide(color: Colors.black, width: 2),
          //                 ),
          //                 focusedBorder: OutlineInputBorder(
          //                   borderRadius: BorderRadius.all(Radius.circular(15)),
          //                   borderSide: BorderSide(color: Colors.black26,width: 2),
          //                 ),
          //               ),
          // ),
          // SizedBox(height: height*0.01,),
          // TextFormField(
          //   controller: passwordController,
          //             obscureText: isHidden,
          //             autovalidateMode: AutovalidateMode.onUserInteraction,
          //             validator: (  value){
          //              return value!.isEmpty ? "password can't be empty" : null;
          //             },
          //             style: TextStyle(
          //               color: Colors.black,
          //               fontSize:25,
          //             ),


          //             textAlign: TextAlign.left,
          //             decoration:InputDecoration(
          //               suffixIcon: IconButton(onPressed: (){
          //                 setState(() {
          //                   isHidden = ! isHidden;
          //                 });
          //               },
          //                icon: Icon(isHidden?Icons.visibility:Icons.visibility_off),
          //                ),
          //                 hintText: 'password ',
          //               //errorText: _numberError,
          //               hintStyle: TextStyle(
          //                 fontSize: 18,
          //                   color: Colors.grey
          //               ),
          //               filled: true,
          //               fillColor: Colors.transparent,
          //               enabledBorder: OutlineInputBorder(
          //                 borderRadius: BorderRadius.all(Radius.circular(15.0)),
          //                 borderSide: BorderSide(color: Colors.black, width: 2),
          //               ),
          //               focusedBorder: OutlineInputBorder(
          //                 borderRadius: BorderRadius.all(Radius.circular(15)),
          //                 borderSide: BorderSide(color: Colors.black26,width: 2),
          //               ),
          //             ) ,
          // ),
          // SizedBox(height: height*0.01,),
          // TextFormField(
          //   controller: password2Controller,
          //             obscureText: isHidden,
          //             autovalidateMode: AutovalidateMode.onUserInteraction,
          //             validator: (  value){
          //              return value!.isEmpty ? "password can't be empty" : null;
          //             },
          //             style: TextStyle(
          //               color: Colors.black,
          //               fontSize:25,
          //             ),


          //             textAlign: TextAlign.left,
          //             decoration:InputDecoration(
          //               suffixIcon: IconButton(onPressed: (){
          //                 setState(() {
          //                   isHidden = ! isHidden;
          //                 });
          //               },
          //                icon: Icon(isHidden?Icons.visibility:Icons.visibility_off),
          //                ),
          //                 hintText: 'confirm password ',
          //               //errorText: _numberError,
          //               hintStyle: TextStyle(
          //                 fontSize: 18,
          //                   color: Colors.grey
          //               ),
          //               filled: true,
          //               fillColor: Colors.transparent,
          //               enabledBorder: OutlineInputBorder(
          //                 borderRadius: BorderRadius.all(Radius.circular(15.0)),
          //                 borderSide: BorderSide(color: Colors.black, width: 2),
          //               ),
          //               focusedBorder: OutlineInputBorder(
          //                 borderRadius: BorderRadius.all(Radius.circular(15)),
          //                 borderSide: BorderSide(color: Colors.black26,width: 2),
          //               ),
          //             ) ,
          // ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(vertical: 16.0),
          //   child: ElevatedButton(
          //     onPressed: () {
          //       // Validate returns true if the form is valid, or false otherwise.
          //       if (_formKey.currentState!.validate()) {
          //         // If the form is valid, display a snackbar. In the real world,
          //         // you'd often call a server or save the information in a database.
          //         ScaffoldMessenger.of(context).showSnackBar(
          //           const SnackBar(content: Text('Processing Data')),
          //         );
          //       }
          //     },
          //     child: const Text('Submit'),
          //   ),
          // ),
        ],
      ),
    );
  }
  
}

// class RegisterScreenForm extends StatefulWidget {
//   const RegisterScreenForm({ Key? key }) : super(key: key);

//   @override
//   State<RegisterScreenForm> createState() => _RegisterScreenFormState();
// }

// class _RegisterScreenFormState extends State<RegisterScreenForm> {
//  final _formKey = GlobalKey<FormState>();
//    bool isHidden = true;

//   @override
//   Widget build(BuildContext context) {
//      final height= MediaQuery.of(context).size.height;
//     final width= MediaQuery.of(context).size.width;
//     return Scaffold(
//      body: SingleChildScrollView(
//        scrollDirection: Axis.vertical,
//        child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Container(
//             height: height,
//             width: width,
//             child: SafeArea(  
//               child:Column(children: [
//                 SizedBox(height: height*0.08,),
//                 Text('Sign Up',
//                 style: TextStyle(
//                   fontSize: 24,
//                 ),
//                 ),
//                 SizedBox(height: height*0.035,),
//                 Container(
                    
//             child: Form(
//               key: _formKey,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           TextFormField(
//            validator: (  value){
//                           if (value == null || value.isEmpty)
//                             return "email cannot be empty";
//                           else
//                             return null;
//                         },
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontSize:25,
//                         ),
         
                        
//                         textAlign: TextAlign.left,
//                         autocorrect: true,
//                         decoration: InputDecoration(
//                           hintText: 'name@samplemail.com',
//                           hintStyle: TextStyle(
//                           fontSize: 18,
//                             color: Colors.grey,
//                         ),
                      
                        
//                           filled: true,
//                           fillColor: Colors.transparent,
//                           enabledBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.all(Radius.circular(15.0)),
//                             borderSide: BorderSide(color: Colors.black, width: 2),
//                           ),
//                           focusedBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.all(Radius.circular(15)),
//                             borderSide: BorderSide(color: Colors.black26,width: 2),
//                           ),
//                         ),
//           ),
//           SizedBox(height: height*0.01,),
          
//           TextFormField(
//                       obscureText: isHidden,
//                       autovalidateMode: AutovalidateMode.onUserInteraction,
//                       validator: (  value){
//                        return value!.isEmpty ? "password can't be empty" : null;
//                       },
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontSize:25,
//                       ),
                      
                     
//                       textAlign: TextAlign.left,
//                       decoration:InputDecoration(
//                         suffixIcon: IconButton(onPressed: (){
//                           setState(() {
//                             isHidden = ! isHidden;
//                           });
//                         },
//                          icon: Icon(isHidden?Icons.visibility:Icons.visibility_off),
//                          ),
//                           hintText: 'password ',
                        
//                         hintStyle: TextStyle(
//                           fontSize: 18,
//                             color: Colors.grey
//                         ),
//                         filled: true,
//                         fillColor: Colors.transparent,
//                         enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.all(Radius.circular(15.0)),
//                           borderSide: BorderSide(color: Colors.black, width: 2),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.all(Radius.circular(15)),
//                           borderSide: BorderSide(color: Colors.black26,width: 2),
//                         ),
//                       ) ,
//           ),
//             SizedBox(height: height*0.01,),
//                       TextFormField(
//                       obscureText: isHidden,
//                       autovalidateMode: AutovalidateMode.onUserInteraction,
//                       validator: (  value){
//                        return value!.isEmpty ? "password can't be empty" : null;
//                       },
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontSize:25,
//                       ),
                      
                     
//                       textAlign: TextAlign.left,
//                       decoration:InputDecoration(
//                         suffixIcon: IconButton(onPressed: (){
//                           setState(() {
//                             isHidden = ! isHidden;
//                           });
//                         },
//                          icon: Icon(isHidden?Icons.visibility:Icons.visibility_off),
//                          ),
//                           hintText: 'password ',
                        
//                         hintStyle: TextStyle(
//                           fontSize: 18,
//                             color: Colors.grey
//                         ),
//                         filled: true,
//                         fillColor: Colors.transparent,
//                         enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.all(Radius.circular(15.0)),
//                           borderSide: BorderSide(color: Colors.black, width: 2),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.all(Radius.circular(15)),
//                           borderSide: BorderSide(color: Colors.black26,width: 2),
//                         ),
//                       ) ,
//           ),
//         ],
//               ),
//             ),
//                 ),
//               ],
              
//               ),
              
//             ),
//           ),
//         ),
//      ),
      
      
//     );
//   }
// }




  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children: [
  //                  Center(
  //                   child: TextFormField(
  //                     validator: (  value){
  //                       if (value == null || value.isEmpty)
  //                         return "name cannot be empty";
  //                       else
  //                         return null;
  //                     },
  //                     style: TextStyle(
  //                       color: Colors.black,
  //                       fontSize:25,
  //                     ),
         
  //                     controller: nameController,
  //                     textAlign: TextAlign.left,
  //                     autocorrect: true,
  //                     decoration: InputDecoration(
  //                       hintText: 'John Doe',
  //                       hintStyle: TextStyle(
  //                       fontSize: 18,
  //                         color: Colors.grey,
  //                     ),
                    
                      
  //                       filled: true,
  //                       fillColor: Colors.transparent,
  //                       enabledBorder: OutlineInputBorder(
  //                         borderRadius: BorderRadius.all(Radius.circular(15.0)),
  //                         borderSide: BorderSide(color: Colors.black, width: 2),
  //                       ),
  //                       focusedBorder: OutlineInputBorder(
  //                         borderRadius: BorderRadius.all(Radius.circular(15)),
  //                         borderSide: BorderSide(color: Colors.black26,width: 2),
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //                 SizedBox(height: height*0.01,),
  //                 ///////////////////////email/////////////////////////////
  //                 TextFormField(
  //                     validator: (  value){
  //                       if (value == null || value.isEmpty)
  //                         return "email cannot be empty";
  //                       else
  //                         return null;
  //                     },
  //                     style: TextStyle(
  //                       color: Colors.black,
  //                       fontSize:25,
  //                     ),
         
                     
  //                     textAlign: TextAlign.left,
  //                     autocorrect: true,
  //                     decoration: InputDecoration(
  //                       hintText: 'name@samplemail.com',
  //                       hintStyle: TextStyle(
  //                       fontSize: 18,
  //                         color: Colors.grey,
  //                     ),
                    
                      
  //                       filled: true,
  //                       fillColor: Colors.transparent,
  //                       enabledBorder: OutlineInputBorder(
  //                         borderRadius: BorderRadius.all(Radius.circular(15.0)),
  //                         borderSide: BorderSide(color: Colors.black, width: 2),
  //                       ),
  //                       focusedBorder: OutlineInputBorder(
  //                         borderRadius: BorderRadius.all(Radius.circular(15)),
  //                         borderSide: BorderSide(color: Colors.black26,width: 2),
  //                       ),
  //                     ),
  //                   ),
  //                 ////////////////////////////////phonNumber////////////////////////////////
  //                 SizedBox(height: height*0.01,),
  //                 TextFormField(
  //                    validator: ( value){
  //                     if (value!.length < 11)
  //                      return "check phonenumber";
  //                     else
  //                       return null;
  //                   },
  //                     style: TextStyle(
  //                       color: Colors.black,
  //                       fontSize:25,
  //                     ),
  //                     maxLength: 11,
  //                     keyboardType: TextInputType.phone,
                      
  //                     textAlign: TextAlign.left,
  //                     autocorrect: true,
  //                     decoration: InputDecoration(
  //                       hintText: '08034******',
                      
  //                       hintStyle: TextStyle(
  //                       fontSize: 18,
  //                         color: Colors.grey,
  //                     ),
                    
                      
  //                       filled: true,
  //                       fillColor: Colors.transparent,
  //                       enabledBorder: OutlineInputBorder(
  //                         borderRadius: BorderRadius.all(Radius.circular(15.0)),
  //                         borderSide: BorderSide(color: Colors.black, width: 2),
  //                       ),
  //                       focusedBorder: OutlineInputBorder(
  //                         borderRadius: BorderRadius.all(Radius.circular(15)),
  //                         borderSide: BorderSide(color: Colors.black26,width: 2),
  //                       ),
  //                     ),
  //                   ),
  //                 /////////////////////////////country//////////////////////////////////
  //                 SizedBox(height: height*0.01,),
  //                    Container(
  //                   child: TextFormField(
  //                       validator: (  value){
  //                         if (value == null || value.isEmpty)
  //                           return "country cannot be empty";
  //                         else
  //                           return null;
  //                       },
  //                       style: TextStyle(
  //                         color: Colors.black,
  //                         fontSize:25,
  //                       ),
         
  //                       controller: countryController,
  //                       textAlign: TextAlign.left,
  //                       autocorrect: true,
  //                       decoration: InputDecoration(
  //                         hintText: 'country',
  //                         hintStyle: TextStyle(
  //                         fontSize: 18,
  //                           color: Colors.grey,
  //                       ),
                      
                        
  //                         filled: true,
  //                         fillColor: Colors.transparent,
  //                         enabledBorder: OutlineInputBorder(
  //                           borderRadius: BorderRadius.all(Radius.circular(15.0)),
  //                           borderSide: BorderSide(color: Colors.black, width: 2),
  //                         ),
  //                         focusedBorder: OutlineInputBorder(
  //                           borderRadius: BorderRadius.all(Radius.circular(15)),
  //                           borderSide: BorderSide(color: Colors.black26,width: 2),
  //                         ),
  //                       ),
  //                     ),
  //                 ),
  //                 /////////////////////////////password1////////////////////////////////////////
            
  //                  SizedBox(height: height*0.01,),
  //                 Container(
  //                   child: TextFormField(
  //                     controller: passwordController,
  //                     obscureText: true,
  //                     autovalidateMode: AutovalidateMode.onUserInteraction,
  //                     validator: (  value){
  //                      return value!.isEmpty ? "password can't be empty" : null;
  //                     },
  //                     style: TextStyle(
  //                       color: Colors.black,
  //                       fontSize:25,
  //                     ),
                      
                     
  //                     textAlign: TextAlign.left,
  //                     decoration:InputDecoration(
                        
  //                         hintText: 'password ',
  //                       //errorText: _numberError,
  //                       hintStyle: TextStyle(
  //                         fontSize: 18,
  //                           color: Colors.grey
  //                       ),
  //                       filled: true,
  //                       fillColor: Colors.transparent,
  //                       enabledBorder: OutlineInputBorder(
  //                         borderRadius: BorderRadius.all(Radius.circular(15.0)),
  //                         borderSide: BorderSide(color: Colors.black, width: 2),
  //                       ),
  //                       focusedBorder: OutlineInputBorder(
  //                         borderRadius: BorderRadius.all(Radius.circular(15)),
  //                         borderSide: BorderSide(color: Colors.black26,width: 2),
  //                       ),
  //                     ) ,
  //                   ),
  //                 ),
         
  //                 /////////////////////////////////password2///////////////////////////////////////////////
  //                 SizedBox(height: height*0.01,),
  //                 Container(
  //                   child: TextFormField(
  //                     controller: password2Controller,
  //                     obscureText: true,
  //                     autovalidateMode: AutovalidateMode.onUserInteraction,
  //                     validator: (  value){
  //                      return value!.isEmpty ? "password can't be empty" : null;
  //                     },
  //                     style: TextStyle(
  //                       color: Colors.black,
  //                       fontSize:25,
  //                     ),
                      
                     
  //                     textAlign: TextAlign.left,
  //                     decoration:InputDecoration(
                        
  //                         hintText: 'confirm password ',
                       
  //                       hintStyle: TextStyle(
  //                         fontSize: 18,
  //                           color: Colors.grey
  //                       ),
  //                       filled: true,
  //                       fillColor: Colors.transparent,
  //                       enabledBorder: OutlineInputBorder(
  //                         borderRadius: BorderRadius.all(Radius.circular(15.0)),
  //                         borderSide: BorderSide(color: Colors.black, width: 2),
  //                       ),
  //                       focusedBorder: OutlineInputBorder(
  //                         borderRadius: BorderRadius.all(Radius.circular(15)),
  //                         borderSide: BorderSide(color: Colors.black26,width: 2),
  //                       ),
  //                     ) ,
  //                   ),
  //                 ),
  //                 SizedBox(height: height*0.02,),
  //                 Container(
  //                   alignment: Alignment.center,
  //                   child: GestureDetector(
  //                       onTap: ()async{
  //                       await authService.signInWithEmailAndPassword(
  //                         emailController.text, passwordController.text,
  //                         );
  //                          Navigator.push(
  //   context,
  //   MaterialPageRoute(
  //   	builder: (context) => const HomeView()),
  // );
  //                     },
  //         child: Container(
  //           padding: EdgeInsets.fromLTRB(16, 15, 16, 15),
  //           decoration: BoxDecoration(
  //             color: Colors.greenAccent,
  //             borderRadius: BorderRadius.circular(10),
  //           ),
  //           child: Row(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             crossAxisAlignment: CrossAxisAlignment.center,
  //             children: [
  //               Text('Sign Up',
  //                   maxLines: 1,
  //                   style: TextStyle(
  //                       color: Colors.white,
                        
  //                       fontWeight: FontWeight.w600,
  //                       fontSize: 24)),
  //                        ],
  //                       ),
  //         ),
                  
                  
  //                   ),
  //                 )
  //               ],