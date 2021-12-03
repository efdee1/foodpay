import 'package:flutter/material.dart';
import 'package:foodlocker/Services/wrapper.dart';
import 'package:foodlocker/UI/sign_In.dart';
import 'package:foodlocker/UI/sign_in_ui/sign_in_auth_ui.dart';
import 'package:foodlocker/Views/Category/category.dart';
import 'package:foodlocker/Views/Home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:foodlocker/Views/ProfileViews/profile_view.dart';
import 'package:foodlocker/Views/ViewProduct/view_product_ui.dart';
import 'package:foodlocker/Views/buy_view.dart';
import 'package:foodlocker/model/buying_model.dart';
import 'UI/sign_In.dart';
import 'UI/sign_in_ui/register_ui_auth.dart';
import 'ViewModel/auth_view_model.dart';
import 'package:provider/provider.dart';

import 'Views/bottom_nav.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return MultiProvider(
      providers:[
         Provider<AuthService>(create:(_)=>AuthService(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'FoodLocker',
        initialRoute: '/',
        routes: {
          '/':(context)=> Wrapper(),
          '/SignInScreen':(context)=>  SignInScreen(),
         '/SignInAuthScreen':(context)=>  SignInAuthScreen(),
         '/RegisterScreen':(context)=>  RegisterScreen(),
          '/BottomNavView':(context)=>  BottomNavView(),
          '/HomeView':(context)=>  HomeView(),
          '/BuyingView':(context)=>  BuyingView(buyProduct: Product()),
          '/CategoryView':(context)=>  CategoryView(),
          '/ViewProduct':(context)=>  ViewProduct(),
          '/ProfileScreen':(context)=>  ProfileScreen(),
        },
      ),
    );
  }
}

// class HomeController extends StatelessWidget {
//   //const HomeController({ Key? key }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final BaseAuth auth = Provider.of(context).auth;
//     return StreamBuilder(
//       stream:auth.onAuthStateChanged,
//       builder: (context, AsyncSnapshot<String>snapshot){
//         if(snapshot.connectionState==ConnectionState.active){
//           final bool signedIn = snapshot.hasData;
//           return signedIn? HomeView() : SignInScreen();
//         }
//         return SignInScreen();
//       },
//       );
    
//   }
// }
 
//  class Provider extends InheritedWidget {
//   final BaseAuth auth;

//     const Provider({
    
//     required Widget child,
//     required this.auth,
//   }) : super(
          
//           child: child,
//         ); 

//   // const Provider({ Key? key,Widget? child,required this.auth,}) : super(key key,Widget?child: child,);

//   @override
//   bool updateShouldNotify(InheritedWidget oldWidget) {
//     return true;
//   }

//   static Provider of(BuildContext context) =>(context.dependOnInheritedWidgetOfExactType(aspect: Provider)as Provider );
// }